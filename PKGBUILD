# Maintainer: akbdt
# Contributor: c4tz
# Submitter: c4tz
pkgname=kodi-addon-pvr-zattoo
pkgver=21.0.1
pkgrel=1
pkgdesc='Zattoo PVR Plugin for Kodi'
_koditarget=Omega
_gitname=pvr.zattoo
_kodiver=21.0
arch=('any')
url="https://github.com/rbuehlma/${_gitname}"
license=('GPL')
groups=('kodi')
makedepends=('cmake' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}");
depends=('kodi' 'kodi-addon-script-module-inputstreamhelper')
source=("https://github.com/rbuehlma/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('5908de86c038b3565d8b3a8d4578d4cac0d37287fc039808542b874d9fb2bffa'
            '7f54c1fd8456ac46221fbc85e447362bdc209163c6cb19fca98d106560071b7c')

prepare() {
        cd xbmc-${_kodiver}-${_koditarget}
        mkdir -p "cmake/addons/addons/${_gitname}/"
        echo "${_gitname} https://github.com/rbuehlma/${_gitname} ${_koditarget}" > "cmake/addons/addons/${_gitname}/${_gitname}.txt"
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
