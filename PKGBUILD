# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc-git
pkgver=Natron.2.4.0.r0.gf4c99c31
pkgrel=1
arch=('x86_64')
pkgdesc="Miscellaneous OpenFX plugins"
url="https://github.com/NatronGitHub/openfx-misc"
license=('GPL')
depends=('libgl')
makedepends=('openmp')
optdepends=('natron-plugins-git: More presets for the Shadertoy plugin')

_pkgname=${pkgname%-git}
_url=${url%/${_pkgname}}

conflicts=("${_pkgname}")

source=("${_pkgname}::git+${url}"
        "openfx::git+${_url}/openfx"
        "openfx-supportext::git+${_url}/openfx-supportext")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd ${_pkgname}
  git submodule init
  git config submodule.openfx.url ${srcdir}/openfx
  git config submodule.SupportExt.url ${srcdir}/openfx-supportext
  git submodule update
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
