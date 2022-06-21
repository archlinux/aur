# Maintainer: Anton Filimonov <anton.filimonov@gmail.com>

pkgname=klogg
pkgver=22.06
_subversion=0.1289
pkgrel=2
pkgdesc="A multi-platform GUI application that helps browse and search through long and complex log files. It is designed with programmers and system administrators in mind and can be seen as a graphical, interactive combination of grep, less, and tail"
arch=('x86_64')
url='https://klogg.filimonov.dev'
license=('GPL3')
provides=('klogg')
conflicts=('klogg-bin')
depends=('qt5-base' 'hicolor-icon-theme' 'hyperscan' 'xxhash' 'uchardet' 'tbb')
makedepends=('cmake' 'git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/variar/klogg/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/variar/klogg/releases/download/v${pkgver}/${pkgname}-${pkgver}.${_subversion}.deps.tar.gz")
sha256sums=('a6a68b45d828a0de34572a77a25cb0bac7ce15f7e0328b4f4dae573b990e3970'
            'c9316454cbca126ee7fb55dd7b3af5bab92a914ec4df950fcf7c435a2f2c8276')

build() {
    KLOGG_VERSION=${pkgver}.${_subversion} \
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='RelWithDebugInfo' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCPM_USE_LOCAL_PACKAGES=ON \
        -DCPM_SOURCE_CACHE=${srcdir}/cpm_cache \
        -DWARNINGS_AS_ERRORS=OFF \
        -DKLOGG_USE_SENTRY=OFF \
        -DKLOGG_BUILD_TESTS=OFF

    make -C "${pkgname}-${pkgver}/build" klogg
}

package() {
    make -C "${pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
    install -D -m644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
