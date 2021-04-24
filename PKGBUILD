# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=openfx-gmic-git
pkgver=Natron.2.4.0.r0.g626699d
pkgrel=1
arch=('x86_64')
pkgdesc="OpenFX wrapper for the G'MIC framework"
url="https://github.com/NatronGitHub/openfx-gmic"
license=('custom:CeCILL-C' 'custom:CeCILLv2')
depends=('fftw' 'libgl' 'libpng')
makedepends=('openmp')

_pkgname=${pkgname%-git}
_url=${url%/${_pkgname}}

conflicts=("${_pkgname}")

source=("${_pkgname}::git+${url}"
        "openfx::git+${_url}/openfx")
sha512sums=('SKIP'
            'SKIP')

prepare() {
  cd ${_pkgname}
  git submodule init
  git config submodule.openfx.url ${srcdir}/openfx
  git submodule update
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
