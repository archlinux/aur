# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-stalker
pkgver=3.4.10
pkgrel=1
pkgdesc='IPTV Stalker PVR client addon for Kodi'
_koditarget=Leia
_gitname=pvr.stalker
_kodiver=18.6
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform')
# conflicts=('kodi-addon-pvr-iptvsimple-git');
depends=('kodi' 'git')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('03eb428f21d6b8526b6671278b60ac6dc5a761a515af27172d8ac5c814cc3f65'
            '47e6d7d4e01dbda92ff83a3e141ac43003e918133e78b3a4b79faff65184711c')

prepare() {
        cd xbmc-${_kodiver}-${_koditarget}
        #sed -i "s|-p1 -i|--binary -p1 -i|" cmake/scripts/common/HandleDepends.cmake
        #sed -i 's/GIT_SHALLOW 1/GIT_SHALLOW ""/g' cmake/scripts/common/HandleDepends.cmake
}

build() {
        mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
        cd "${_gitname}-${pkgver}-${_koditarget}/build"

        cmake \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
                -DCMAKE_BUILD_TYPE=Release \
                -DBUILD_SHARED_LIBS=1 \
                -DADDONS_TO_BUILD=pvr.stalker \
                -DADDONS_SRC_PREFIX=../.. \
                ../../xbmc-${_kodiver}-${_koditarget}/cmake/addons
        make
}
        
package() {
        cd "${_gitname}-${pkgver}-${_koditarget}/build"
        install -d "${pkgdir}/usr"
        mv .install/lib "${pkgdir}/usr/"
        mv .install/share "${pkgdir}/usr/"
}
