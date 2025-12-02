# Maintainer: George Tsiamasiotis <george+aur@tsiamasiotis.gr>

pkgname=dnst
pkgver=0.1.0alpha
_pkgver=0.1.0-alpha
pkgrel=1
pkgdesc='A DNS administration toolbox including re-implementations of important ldns programs'
arch=('x86_64')
url='https://github.com/NLnetLabs/dnst'
license=(BSD-3-Clause)
depends=(
    openssl
    glibc
    gcc-libs
)
makedepends=(
    cargo

    python-toml
    python-sphinx
    python-sphinx_rtd_theme
    python-sphinx-tabs
    python-sphinx-copybutton
    python-sphinx-notfound-page
)

options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/NLnetLabs/dnst/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('bff3d70ca78bb82a77c01a5dc8c055dfb9974c2500dfe9022cdaf976c12e70ea')

export RUSTUP_TOOLCHAIN="stable"
export CARGO_TARGET_DIR="target"
export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

prepare() {
    cd "$pkgname-$_pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$_pkgver"
    make -C doc/manual man
    cargo build --frozen --release --bin dnst
}

check() {
    cd "$pkgname-$_pkgver"
    cargo test
}

package() {
    cd "$pkgname-$_pkgver"

    # Install the final binary into `/usr/bin`.
    install -Dm0755 "target/$CARGO_BUILD_TARGET/release/$pkgname" -t "$pkgdir/usr/bin/"

    # Install man (1) pages for dnst.
    for page in doc/manual/build/man/dnst*.1
    do
        install -Dm0644 -t "$pkgdir/usr/share/man/man1" $page
    done

    # Install the license file (this is required for BSD-3-Clause).
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
