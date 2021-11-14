# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc
pkgver=2.4.1
pkgrel=1
arch=('x86_64')
pkgdesc="Miscellaneous OpenFX plugins"
url="https://github.com/NatronGitHub/openfx-misc"
license=('GPL')
depends=('libgl')
makedepends=('openmp')
optdepends=('natron-plugins-git: More presets for the Shadertoy plugin')
conflicts=("${pkgname}-git")

_natron_ver="Natron-${pkgver}"
_pkgname="${pkgname}-${_natron_ver}"
_url=${url%/${pkgname}}

source=("${_pkgname}.tar.gz::${url}/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-${_natron_ver}.tar.gz::${_url}/openfx/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-supportext-${_natron_ver}.tar.gz::${_url}/openfx-supportext/archive/${_natron_ver}.tar.gz")
sha512sums=('34a050e9cd9fd9c7206d364b841d251a8879a4b75b3dcec8c9eb4ec3bc45d157415b76299a8229401e4e31571ec215c59a8f49c393ab8fc13c2decf679c873cd'
            '0559401414508bdf14a785d1d43aeb0e40744a54b18ed33f9fca7bd577713ecc1841c1d4dbf14b7ad8ca5e413c1511668d16ee57c166341ab9ac45b87f2295f5'
            'a8125170a3d3e9a4ee659be104063ff40781f5bf6e6c37e8d7ff7ff9500a4134e40c70bfa98a5013d93b8bd4bc163ca8505f460d00b81a77554b2307ebeb1072')

prepare() {
  tar -xzf "openfx-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/openfx/"
  tar -xzf "openfx-supportext-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/SupportExt/"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make CONFIG=release \
       OPENMP=1
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/OFX/Plugins"
  make install PLUGINPATH="${pkgdir}/usr/OFX/Plugins" \
               CONFIG=release
}
