# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc
pkgver=2.4.2
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
sha512sums=('f03aaef24e5ffc897651a5d22996be42c4f34563e214790b27b5797318f0cd92edf2f858fa75d6499ef95a73cebe617e803c38b1acc49e4b4f38d4e79a9a847e'
            '624530af417821d759358ccfc45ba7ba10890fd115bbfef3e3fa61f486414fe61f39bfce8593f7ab84ee3d5ed3db05149d614f1407735fd8d6529894996103fa'
            'b3d6672287824b3f61c32156618040ed4892c7748a496688369eca95a4c0d562b53e573b22a38f59445d96e4e54a34ea20164a1495d8780338c6dcc945c804c9')

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
