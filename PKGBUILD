# Maintainer: George Tsiamasiotis <george+aur@tsiamasiotis.gr>

pkgname=(dnst-git dnst-ldns-git)
_pkgname=dnst
pkgver=git
pkgrel=1
pkgdesc='A DNS administration toolbox'
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
source=("git+https://github.com/NLnetLabs/dnst.git")
sha256sums=('SKIP')

export RUSTUP_TOOLCHAIN="stable"
export CARGO_TARGET_DIR="target"
export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked
}

build() {
    cd "$_pkgname"
    make -C doc/manual man
    cargo build --frozen --release --bin dnst
}

check() {
    cd "$_pkgname"
    cargo test
}

package_dnst-git() {
    cd "$_pkgname"

    # Install the final binary into `/usr/bin`.
    install -Dm0755 "target/$CARGO_BUILD_TARGET/release/dnst" -t "$pkgdir/usr/bin/"

    # Install man (1) pages for dnst.
    for page in doc/manual/build/man/dnst*.1
    do
        install -Dm0644 -t "$pkgdir/usr/share/man/man1" $page
    done

    # Install the license file (this is required for BSD-3-Clause).
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/dnst/LICENSE"
}

package_dnst-ldns-git() {
    cd "$_pkgname"

    pkgdesc='dnst re-implementation of important ldns programs'
    depends=(dnst)
    provides=(ldns)
    conflicts=(ldns)

    # Install compatibility symlinks.
    install -dm0755 "$pkgdir/usr/bin"
    for cmd in key2ds notify keygen nsec3-hash signzone update
    do
        ln -s dnst "$pkgdir/usr/bin/ldns-$cmd"
    done

    # Install man (1) pages for dnst ldns wrappers.
    for page in doc/manual/build/man/ldns*.1
    do
        install -Dm0644 -t "$pkgdir/usr/share/man/man1" $page
    done
}
