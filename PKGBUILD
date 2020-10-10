# Maintainer: c4tz
pkgname=kodi-addon-pvr-waipu
pkgver=0.2.3
pkgrel=1
pkgdesc='Waipu.tv PVR Plugin for Kodi'
_koditarget=Leia
_gitname=pvr.waipu
_kodiver=18.8
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
        "https://github.com/xbmc/xbmc/commit/8f714dcc7f1a1dfa9b57ef18c3f4accc62cb0652.diff"
)
sha256sums=('56c24280789d785f97d3c3a13b7386403c5a3d9e58bd46821ebb3f1332f40f6f'
            '6deb28f725880b1ab6c5920b55ef1190a79b0684ffb30b6e13b199d23a0af296'
            'c4ed6c685a3de5633387a8ca79c06141f643c47eace30c614223f9120f72a25a')

prepare() {
        cd xbmc-${_kodiver}-${_koditarget}
        patch -p1 cmake/scripts/common/HandleDepends.cmake ${srcdir}/8f714dcc7f1a1dfa9b57ef18c3f4accc62cb0652.diff
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
