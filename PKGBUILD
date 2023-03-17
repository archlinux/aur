# Maintainer: acidicX
pkgname=kodi-addon-pvr-waipu
pkgver=20.7.0
pkgrel=1
pkgdesc='Waipu.tv PVR Plugin for Kodi'
_koditarget=Nexus
_gitname=pvr.waipu
_kodiver=20.1
arch=('any')
url="https://github.com/flubshi/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}");
depends=('kodi' 'kodi-addon-script-module-inputstreamhelper')
source=("https://github.com/flubshi/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('311f42b32100324b14008ea1dd91ab6da0803562ebc48e81183473f4c0b72f1c'
            'cd4158b2bc2d9593ad2f5c1cd2494957ab726b13d8379bbfb09d7d36df7b7d7e')
prepare() {
        cd xbmc-${_kodiver}-${_koditarget}
        mkdir -p "cmake/addons/addons/${_gitname}/"
        echo "${_gitname} https://github.com/flubshi/${_gitname} ${_koditarget}" > "cmake/addons/addons/${_gitname}/${_gitname}.txt"
        echo "all" > "cmake/addons/addons/${_gitname}/platforms.txt"
}

build() {
        mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
        cd "${_gitname}-${pkgver}-${_koditarget}/build"

        cmake \
                -DCMAKE_INSTALL_PREFIX=/usr \
                -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
                -DCMAKE_BUILD_TYPE=Release \
                -DBUILD_SHARED_LIBS=1 \
                -DADDONS_TO_BUILD=${_gitname} \
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
