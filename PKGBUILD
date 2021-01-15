# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-iptvsimple
pkgver=3.10.0
pkgrel=1
pkgdesc='IPTV Simple PVR client addon for Kodi'
_koditarget=Leia
_gitname=pvr.iptvsimple
_kodiver=18.9
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform' 'git')
conflicts=('kodi-addon-pvr-iptvsimple-git');
depends=('kodi')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('906d023b4713be558445902ff703ae65e03733d47dd7d0e1b16d02c05679c7ed'
            'bdf8afa9356b1f815de9984801d3e0d2b46a719e747895b75528f20995c59d2b'
            )

prepare() {
        cd xbmc-${_kodiver}-${_koditarget}
        #patch -p1 cmake/scripts/common/HandleDepends.cmake ${srcdir}/8f714dcc7f1a1dfa9b57ef18c3f4accc62cb0652.diff
        #sed -i "s|-p1 -i|--binary -p1 -i|" cmake/scripts/common/HandleDepends.cmake
        #sed -i 's/GIT_SHALLOW 1/GIT_SHALLOW ""/g' cmake/scripts/common/HandleDepends.cmake
}

build() {
        mkdir -p "pvr.iptvsimple-${pkgver}-${_koditarget}/build"
        cd "pvr.iptvsimple-${pkgver}-${_koditarget}/build"

        cmake \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
                -DCMAKE_BUILD_TYPE=Release \
                -DBUILD_SHARED_LIBS=1 \
                -DADDONS_TO_BUILD=pvr.iptvsimple \
                -DADDONS_SRC_PREFIX=../.. \
                ../../xbmc-${_kodiver}-${_koditarget}/cmake/addons
        make
}
        
package() {
        cd "pvr.iptvsimple-${pkgver}-${_koditarget}/build"
        install -d "${pkgdir}/usr"
        mv .install/lib "${pkgdir}/usr/"
        mv .install/share "${pkgdir}/usr/"
}
