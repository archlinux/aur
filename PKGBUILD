# Maintainer: dingjing <dingjing[at]live[dot]cn>
# Cloud Server
_server=cpx51

pkgbase=graceful-platform-theme
pkgname=('graceful-platform-theme' 'graceful-platform-theme-dbg')
pkgver=1.0.4
pkgrel=1
arch=('x86_64')
url="https://github.com/graceful-linux/graceful-platform-theme"
license=('GPL')
depends=(
    'qt5-base'
)
makedepends=(
    'git'
    'qt5-base'
)
source=(
    "https://github.com/graceful-linux/graceful-platform-theme/archive/${pkgver}.tar.gz"
)

sha256sums=(
    "057e2067582af0e595999db4aa3f2f708484b772d714faab7b66a0a1954faa7f"
)
    
prepare() {
    msg "prepare"
}
    
build() {
    msg "build"
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake
    make all -j32

    # build release
    cd "${srcdir}/${pkgname}-${pkgver}/lib"
    rm -rf libgraceful.so
    make release -j32
    mv libgraceful.so libgraceful.so.release
    make debug -j32
    mv libgraceful.so libgraceful.so.debug
    cp -r "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/${pkgname}-dbg-${pkgver}"
}

package_graceful-platform-theme() {
    msg "${pkgname} package"
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d -Dm755                               "${pkgdir}/usr/share/icons/"
    install -d -Dm755                               "${pkgdir}/usr/share/themes/"

    cp -ra data/icon/graceful/                      "${pkgdir}/usr/share/icons/"
    cp -ra data/theme/graceful/                     "${pkgdir}/usr/share/themes/"
    install -Dm644 ../../README.md                  "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm644 ../../LICENSE                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 lib/libgraceful.so.release       "${pkgdir}/usr/lib/qt/plugins/styles/libgraceful.so"
}

package_graceful-platform-theme-dbg() {
    options=(debug !strip)
    msg "${pkgname} package"
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d -Dm755                               "${pkgdir}/usr/share/icons/"
    install -d -Dm755                               "${pkgdir}/usr/share/themes/"

    cp -ra data/icon/graceful/                      "${pkgdir}/usr/share/icons/"
    cp -ra data/theme/graceful/                     "${pkgdir}/usr/share/themes/"
    install -Dm644 ../../README.md                  "${pkgdir}/usr/share/doc/${pkgname}/README"
    install -Dm644 ../../LICENSE                    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 lib/libgraceful.so.debug         "${pkgdir}/usr/lib/qt/plugins/styles/libgraceful.so"
}


