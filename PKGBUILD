# Maintainer: thepasto <thepasto@gmail.com>
pkgname=kodi-addon-pvr-stalker
pkgver=3.4.10
pkgrel=2
pkgdesc='IPTV Stalker PVR client addon for Kodi'
_koditarget=Leia
_gitname=pvr.stalker
_kodiver=18.8
arch=('armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'kodi-platform')
# conflicts=('kodi-addon-pvr-iptvsimple-git');
depends=('kodi' 'git')
source=("https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/commit/8f714dcc7f1a1dfa9b57ef18c3f4accc62cb0652.diff"
)
sha256sums=('03eb428f21d6b8526b6671278b60ac6dc5a761a515af27172d8ac5c814cc3f65'
            '6deb28f725880b1ab6c5920b55ef1190a79b0684ffb30b6e13b199d23a0af296'
            'c4ed6c685a3de5633387a8ca79c06141f643c47eace30c614223f9120f72a25a'
            )

prepare() {
        cd xbmc-${_kodiver}-${_koditarget}
        patch -p1 cmake/scripts/common/HandleDepends.cmake ${srcdir}/8f714dcc7f1a1dfa9b57ef18c3f4accc62cb0652.diff
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
