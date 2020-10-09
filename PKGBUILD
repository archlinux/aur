# Maintainer: Will Marler <will@wmarler.com>
pkgname=kodi-addon-pvr-nextpvr
pkgver=3.3.21
pkgrel=1
pkgdesc='NextPVR PVR client addon for Kodi'
_koditarget=Leia
_gitname=pvr.nextpvr
_kodiver=18.8
arch=('x86_64')
url="https://github.com/kodi-pvr/${_gitname}"
license=('GPL2')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev' 'tinyxml')
depends=('kodi')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kodi-pvr/${_gitname}/archive/${pkgver}-${_koditarget}.tar.gz"
        "kodi-${_kodiver}_${_koditarget}.tar.gz::https://github.com/xbmc/xbmc/archive/${_kodiver}-${_koditarget}.tar.gz"
)
sha256sums=('1f5576070a0bf076d1f28cdd547bc4ff134861c18a71cff7fd036eaacc357707'
            '6deb28f725880b1ab6c5920b55ef1190a79b0684ffb30b6e13b199d23a0af296')

prepare() {
    #Delete references to tinyxml cmake dependencies in kodi src on the fly.
    cd xbmc-${_kodiver}-${_koditarget}
    sed -i -e '1d' cmake/addons/depends/common/kodi-platform/deps.txt
    rm -rf cmake/addons/depends/common/tinyxml
}

build() {
    mkdir -p "${_gitname}-${pkgver}-${_koditarget}/build"
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DADDONS_TO_BUILD=${_gitname} \
        -DPACKAGE_ZIP=1 \
        ../../xbmc-${_kodiver}-${_koditarget}/cmake/addons
    make
}
       
package() {
    cd "${_gitname}-${pkgver}-${_koditarget}/build"
    install -d "${pkgdir}/usr/share/kodi/addons"
    mv .install/${_gitname} "${pkgdir}/usr/share/kodi/addons"
}

