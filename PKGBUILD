# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=openfx-gmic
pkgver=2.5.0
pkgrel=1
arch=('x86_64')
pkgdesc="OpenFX wrapper for the G'MIC framework"
url="https://github.com/NatronGitHub/openfx-gmic"
license=('CECILL-C OR CECILL-2.0')
depends=('fftw' 'libgl' 'libpng')
makedepends=('openmp')

_natron_ver="Natron-${pkgver}"
_pkgname="${pkgname}-${_natron_ver}"
_url=${url%/${pkgname}}

source=("${_pkgname}.tar.gz::${url}/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-${_natron_ver}.tar.gz::${_url}/openfx/archive/refs/tags/${_natron_ver}.tar.gz")
b2sums=('67da4767064806031014680e6479d56042acbaa8856e7c78e2c40d798eb5b1474848c171e93c8d8707c4694bd7d41606beb2d90a26deca8cd9c92c8944dcdb1d'
        'b5bda788e381d8bfc585a16817ab207152327638290099b54565306e1f6165eb36f7b34ed57732ca53b75d34c6abfc30b7e6f73548820e0f214b4be99db84420')

prepare() {
  tar -xzf "openfx-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/openfx/"
}

build() {
  cd ${_pkgname}
  make CONFIG=release \
       OPENMP=1
}

package() {
  cd ${_pkgname}
  install -d "${pkgdir}/usr/OFX/Plugins"
  make install PLUGINPATH="${pkgdir}/usr/OFX/Plugins" \
               CONFIG=release

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

  for license_file in COPYING Licence_CeCILL-C_V1-en.txt Licence_CeCILL_V2-en.txt; do
      install -Dm644 $license_file \
                    "${pkgdir}/usr/share/licenses/${pkgname}/"
  done
}
