# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc
pkgver=2.5.0
pkgrel=1
arch=('x86_64')
pkgdesc="Miscellaneous OpenFX plugins"
url="https://github.com/NatronGitHub/openfx-misc"
license=('GPL')
depends=('libgl' 'python')
makedepends=('openmp')
optdepends=('natron-plugins-git: More presets for the Shadertoy plugin')

_natron_ver="Natron-${pkgver}"
_pkgname="${pkgname}-${_natron_ver}"
_url=${url%/${pkgname}}

source=("${_pkgname}.tar.gz::${url}/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-${_natron_ver}.tar.gz::${_url}/openfx/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-supportext-${_natron_ver}.tar.gz::${_url}/openfx-supportext/archive/${_natron_ver}.tar.gz")
sha512sums=('e9fccb676d4308176d8b92b4637b88adf59bfe54ae2589e72d41329ab3881d0ee2816c615a0e27045c35a67316f512f9d6d89772ca38432461d2dd2ab8ec32e4'
            '174b75061ac2bb887f2e10df1ec899276e8e27f1873d2dda2ef07ee3fb53f54169fe37d9921642248e28faa974a50a62e5e8ab20ccdd09c96a235084ae16d87d'
            'd0ff47d51176defa8ea09c84b3f5c82e899455e5a3375c32fcf4d6ec24d96f3c2882cff759cd6a3a79be3004d2244092c16cfeb5313660dcab8fc17135435968')

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
