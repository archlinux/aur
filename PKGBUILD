# Maintainer: c4tz
pkgname=kodi-addon-pvr-waipu
pkgver=0.2.0
pkgrel=1
pkgdesc='Waipu.tv PVR Plugin for Kodi'
_koditarget=Leia
_gitname=pvr.waipu
_kodiver=18.4
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
sha256sums=('9884c0a7c5f040c44b16ac3de0dad2fdca506ecc382c86a32fdc7a41b258b6c9'
            'bf2be186d8ae5b5377e43c06a538012bb9f51a0e98f8244b70a401006861d110')

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
