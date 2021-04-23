# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_openfx_supportext_commit=bde8d6a2b119ca35e9229d8af18cda2f57114a20

pkgname=openfx-misc
pkgver=2.4.0
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
        "openfx-supportext-${_openfx_supportext_commit}.tar.gz::${_url}/openfx-supportext/archive/${_openfx_supportext_commit}.tar.gz")
sha512sums=('81d87f116e18ba15c9609ac18177fe38f338433f95fe22e6e0557671ecddbf89accf4685d8fbe7106350714d22aa157ac78441f15a8dee795bcae54da4e7ab55'
            '0a01ea18970a06eb58b03e16f9027a84f37e53581387a0fbd208be16e2fa71f3e0d314307934348e3a7a0c3bc699c36535fd044f18e89a937e9bfca239037096'
            'SKIP')

prepare() {
  tar -xzf "openfx-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/openfx/"
  tar -xzf "openfx-supportext-${_openfx_supportext_commit}.tar.gz" --strip 1 \
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
