# Maintainer: George Tsiamasiotis <george+aur@tsiamasiotis.gr>

pkgname=(dnst dnst-ldns)
_pkgname=dnst
pkgver=0.1.0alpha
_pkgver=0.1.0-alpha
pkgrel=1
pkgdesc='A DNS administration toolbox'
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
source=("$_pkgname-$pkgver.tar.gz::https://github.com/NLnetLabs/dnst/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('bff3d70ca78bb82a77c01a5dc8c055dfb9974c2500dfe9022cdaf976c12e70ea')

export RUSTUP_TOOLCHAIN="stable"
export CARGO_TARGET_DIR="target"
export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

prepare() {
    cd "$_pkgname-$_pkgver"
    cargo fetch --locked
}

build() {
    cd "$_pkgname-$_pkgver"
    make -C doc/manual man
    cargo build --frozen --release --bin dnst
}

check() {
    cd "$_pkgname-$_pkgver"
    cargo test
}

package_dnst() {
    cd "$_pkgname-$_pkgver"

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

package_dnst-ldns() {
    cd "$_pkgname-$_pkgver"

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
