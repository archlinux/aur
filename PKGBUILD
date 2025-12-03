# Maintainer: George Tsiamasiotis <george+aur@tsiamasiotis.gr>

_name=dnst
pkgname=$_name-git
pkgver=git
pkgrel=1
pkgdesc='A DNS administration toolbox including re-implementations of important ldns programs'
arch=('x86_64')
url='https://github.com/NLnetLabs/dnst'
license=(BSD-3-Clause)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

depends=(
    openssl
    glibc
    gcc-libs
)
makedepends=(
    git

    cargo

    python-toml
    python-sphinx
    python-sphinx_rtd_theme
    python-sphinx-tabs
    python-sphinx-copybutton
    python-sphinx-notfound-page
)

options=(!lto)
source=("git+https://github.com/NLnetLabs/$_name.git")
sha256sums=('SKIP')

export RUSTUP_TOOLCHAIN="stable"
export CARGO_TARGET_DIR="target"
export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

pkgver() {
    cd "$_name"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$_name"
    cargo fetch --locked
}

build() {
    cd "$_name"
    make -C doc/manual man
    cargo build --frozen --release --bin dnst
}

check() {
    cd "$_name"
    cargo test
}

package() {
    cd "$_name"

    # Install the final binary into `/usr/bin`.
    install -Dm0755 "target/$CARGO_BUILD_TARGET/release/$_name" -t "$pkgdir/usr/bin/"

    # Install man (1) pages for dnst.
    for page in doc/manual/build/man/dnst*.1
    do
        install -Dm0644 -t "$pkgdir/usr/share/man/man1" "$page"
    done

    # Install the license file (this is required for BSD-3-Clause).
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
