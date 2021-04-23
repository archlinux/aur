# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=openfx-gmic
pkgver=2.4.0
pkgrel=1
arch=('x86_64')
pkgdesc="OpenFX wrapper for the G'MIC framework"
url="https://github.com/NatronGitHub/openfx-gmic"
license=('custom:CeCILL-C' 'custom:CeCILLv2')
depends=('fftw' 'libgl' 'libpng')
makedepends=('openmp')
conflicts=("${pkgname}-git")

_natron_ver="Natron-${pkgver}"
_pkgname="${pkgname}-${_natron_ver}"
_url=${url%/${pkgname}}

source=("${_pkgname}.tar.gz::${url}/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-${_natron_ver}.tar.gz::${_url}/openfx/archive/refs/tags/${_natron_ver}.tar.gz")
sha512sums=('e2328cf4d0c8bb4442433b9e3c4f21cddaaaf64de88ba1c16b64dbcfd40ba4d21a25a0d6c9a0d4b4e543c5c2c116a5802799c0da5a07f5ccf585176399839c9f'
            '0a01ea18970a06eb58b03e16f9027a84f37e53581387a0fbd208be16e2fa71f3e0d314307934348e3a7a0c3bc699c36535fd044f18e89a937e9bfca239037096')

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

  install -Dm644 COPYING \
                 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 Licence_CeCILL-C_V1-en.txt \
                 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 Licence_CeCILL_V2-en.txt \
                 "${pkgdir}/usr/share/licenses/${pkgname}/"
}
