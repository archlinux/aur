# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=openfx-gmic
pkgver=2.5.0
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
sha512sums=('a5c56c6d70405b55c514d24f7e82a0f536638a56b74ed56bdecf7de03886dd948e336c352f721364bf41eb2f87aa3169646c687a110aca0c79809dc5efe765d5'
            '174b75061ac2bb887f2e10df1ec899276e8e27f1873d2dda2ef07ee3fb53f54169fe37d9921642248e28faa974a50a62e5e8ab20ccdd09c96a235084ae16d87d')

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
