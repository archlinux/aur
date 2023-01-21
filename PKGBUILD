# Maintainer: acidicX
pkgname=kodi-addon-pvr-waipu
pkgver=20.6.0
pkgrel=1
pkgdesc='Waipu.tv PVR Plugin for Kodi'
_koditarget=Nexus
_gitname=pvr.waipu
_kodiver=20.0
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
sha256sums=('64d348040dcf523d5ef7dad2cc6efa05b2186d99b116f353d97d2cbd5f4093b8'
            '4c75add8b9ea44924b6ee45f94439545676033f35f5993908871e3dded527b79')
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
