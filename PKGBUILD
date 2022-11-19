# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=openfx-gmic
pkgver=2.4.4
pkgrel=1
arch=('x86_64')
pkgdesc="OpenFX wrapper for the G'MIC framework"
url="https://github.com/NatronGitHub/openfx-gmic"
license=('custom:CeCILL-C' 'custom:CeCILLv2')
depends=('fftw' 'libgl' 'libpng')
makedepends=('openmp')

_natron_ver="Natron-${pkgver}"
_pkgname="${pkgname}-${_natron_ver}"
_url=${url%/${pkgname}}

source=("${_pkgname}.tar.gz::${url}/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-${_natron_ver}.tar.gz::${_url}/openfx/archive/refs/tags/${_natron_ver}.tar.gz")
sha512sums=('4ced9fc167617fee679707faff9e7de79d848b0b7e0033f281ce5d7097b53d144d9f735e804311c3f80261d1abc8802fef1855f9141b1354e7844e6b1d3f25b7'
            '39983f693798121342bf6509c819f9243c176c8123e4e2665309270ba3709f686592f9f29b3b938d2c7ce87c756b0ce9ef0ea36c0c96e4d3ba3379bd7f5976be')

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
