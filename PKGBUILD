# Maintainer: Slash
# Contributor: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-hdhomerun
pkgver=20.4.0
pkgrel=1
pkgdesc='HD Homerun PVR client addon for Kodi'
_koditarget=Nexus
_gitname=pvr.hdhomerun
_kodiver=20.0
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform')
conflicts=('kodi-addon-pvr-hdhomerun-git');
depends=('kodi' 'git')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('3872265e00fc748ba327aaa91beece747936f55d16356051cdd04b0b70a353c0'
            '4c75add8b9ea44924b6ee45f94439545676033f35f5993908871e3dded527b79')

prepare() {
    cd xbmc-${_kodiver}-${_koditarget}
    sed -i "s|-p1 -i|--binary -p1 -i|" cmake/scripts/common/HandleDepends.cmake
}

build() {
    mkdir -p "pvr.hdhomerun-${pkgver}-${_koditarget}/build"
    cd "pvr.hdhomerun-${pkgver}-${_koditarget}/build"

    # Needed to get cmake to find jsoncpp
    # @see https://gitlab.kitware.com/cmake/cmake/issues/17555#note_355574
    export PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1

    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DADDONS_TO_BUILD=pvr.hdhomerun \
        -DADDONS_SRC_PREFIX=../.. \
        ../../xbmc-${_kodiver}-${_koditarget}/cmake/addons
    make
}

package() {
    cd "pvr.hdhomerun-${pkgver}-${_koditarget}/build"
    install -d "${pkgdir}/usr"
    mv .install/lib "${pkgdir}/usr/"
    mv .install/share "${pkgdir}/usr/"
}

