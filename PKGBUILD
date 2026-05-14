# Maintainer: Semyon Ivanov <aur at semyon dot dev>

_pkgname=epoxy
pkgname=$_pkgname-git
pkgver=0.4.1.r0.g67a48ec
pkgrel=1
pkgdesc='SmartBox-compatible open source tool for signing ePorezi tax forms'
arch=('x86_64')
url='https://github.com/semyon2105/epoxy'
license=('MIT')
depends=('gtk4' 'libxml2' 'nspr' 'nss' 'xmlsec')
makedepends=('cargo' 'patchelf')
optdepends=(
    'srb-id-pkcs11: Serbian ID card support (unofficial)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/semyon2105/epoxy.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release --all-features
}

package() {
    cd "$srcdir/$_pkgname"

    # patch the binary to use xmlsec link name w/o major version as SONAME
    # to avoid having to rebuild epoxy on each xmlsec1 upgrade
    xmlsec_linkname="libxmlsec1.so"
    xmlsec_soname=$(readelf -d "/usr/lib/$xmlsec_linkname" | awk '/SONAME/ {print $NF}' | tr -d '[]')
    patchelf --replace-needed $xmlsec_soname $xmlsec_linkname "target/release/$_pkgname"

    xmlsec_nss_linkname="libxmlsec1-nss.so"
    xmlsec_nss_soname=$(readelf -d "/usr/lib/$xmlsec_nss_linkname" | awk '/SONAME/ {print $NF}' | tr -d '[]')
    patchelf --replace-needed $xmlsec_nss_soname $xmlsec_nss_linkname "target/release/$_pkgname"

    install -Dm0755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 "epoxy/systemd/epoxy.service" -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 "epoxy/systemd/epoxy.socket" -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
