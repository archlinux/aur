# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Benjamin Klettbach <b.klettbach@gmail.com>

pkgname=obs-studio-ftl
_obs_pkgver=18.0.0
_obs_ftl_pkgver=ftl.0.9.0
_ftl_pkgver=0.9.1
pkgver=${_obs_pkgver}+ftl_${_ftl_pkgver}
pkgrel=1
pkgdesc="Free, open source software for live streaming and recording (Beam's ftl fork)"
arch=('i686' 'x86_64')
url="https://github.com/WatchBeam/obs-studio-ftl"
license=('GPL2')
depends=('ffmpeg' 'jansson' 'libxinerama' 'libxkbcommon-x11'
         'qt5-x11extras' 'curl' 'jack' 'gtk-update-icon-cache')
makedepends=('cmake' 'libfdk-aac' 'libxcomposite' 'x264')
optdepends=('libfdk-aac: FDK AAC codec support'
            'libxcomposite: XComposite capture support')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/WatchBeam/${pkgname}/archive/${_obs_ftl_pkgver}.tar.gz
        ftl-sdk-${_ftl_pkgver}.tar.gz::https://github.com/WatchBeam/ftl-sdk/archive/v${_ftl_pkgver}.tar.gz)
md5sums=('0fcb51abbc87b53a0465b5cefde7375e'
         '5b79cc3a1f13ce753a2aba8dd394b42c')
conflicts=('obs-studio')
provides=('obs-studio')

prepare() {
    cd "${srcdir}/ftl-sdk-${_ftl_pkgver}/libftl"
    sed -i '0,/#include/ s//#include <ctype.h>\n&/' ftl_helpers.c

    cd "${srcdir}/${pkgname}-${_obs_ftl_pkgver}"

    rm -rf "${srcdir}/${pkgname}-${_obs_ftl_pkgver}/plugins/libftl/ftl-sdk"
    ln -s "${srcdir}/ftl-sdk-${_ftl_pkgver}" "${srcdir}/${pkgname}-${_obs_ftl_pkgver}/plugins/libftl/ftl-sdk"
}

build() {
  cd "${srcdir}/${pkgname}-${_obs_ftl_pkgver}"

  mkdir -p build; cd build

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
    -DOBS_VERSION_OVERRIDE="${pkgver}-${pkgrel}" ..

  make
}

package() {
  cd "${srcdir}/${pkgname}-${_obs_ftl_pkgver}/build"

  make install DESTDIR="${pkgdir}"
}
