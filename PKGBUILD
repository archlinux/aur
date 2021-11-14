# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>

pkgname=openfx-gmic
pkgver=2.4.1
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
sha512sums=('1e182858e36db278d94b1ebc16855d88bca8f2fa91cb1d5050d73f834086a896b84f218cf56d7b7f1daa8577e8816454ed42b4661d5acce17fd88346e228a501'
            '0559401414508bdf14a785d1d43aeb0e40744a54b18ed33f9fca7bd577713ecc1841c1d4dbf14b7ad8ca5e413c1511668d16ee57c166341ab9ac45b87f2295f5')

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
