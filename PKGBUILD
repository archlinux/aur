# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc
pkgver=2.4.4
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
sha512sums=('b7c7f4684c629be59deb5968f72b0250974329eea6df892b052d03e5185cdf027f282907e2d57026fda3d2061baf91bb7739f0aa4f4f91549e8d77ca722cbbdd'
            '39983f693798121342bf6509c819f9243c176c8123e4e2665309270ba3709f686592f9f29b3b938d2c7ce87c756b0ce9ef0ea36c0c96e4d3ba3379bd7f5976be'
            '6b577c26c9299e0c1a707eeaa97e752cd3dd29587580c663ebeabe8d09c76afb66ae31feb0b10a473f84b8e6f4359ed0791c11c1b7cc1b48fb7df0ed69c44b52')

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
