# Maintainer: bytesketch

pkgname=lpack-git
pkgver=r9.g743fc69
pkgrel=1
pkgdesc="A lightweight Linux packaging system and portable package manager using the .lpk format"
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url="https://github.com/bytesketch/lpack"
license=('MIT')

depends=('gcc-libs')
makedepends=('git' 'cargo')

provides=("lpack=${pkgver}")
conflicts=('lpack')

source=("lpack::git+https://github.com/bytesketch/lpack.git")
sha256sums=('SKIP')

options=('!debug')

pkgver() {
    cd "${srcdir}/lpack"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/lpack"

    export CARGO_TARGET_DIR=target
    export ZSTD_SYS_USE_PKG_CONFIG=0

    cargo build --release
}

package() {
    cd "${srcdir}/lpack"

    install -Dm755 \
        "target/release/lpack" \
        "${pkgdir}/usr/bin/lpack"

    install -Dm644 \
        LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
