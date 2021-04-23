# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_openfx_supportext_commit=bde8d6a2b119ca35e9229d8af18cda2f57114a20
_SequenceParsing_commit=ab247c293c12066bd31cc1caabeedeac9c387e49
_tinydir_commit=3aae9224376b5e1a23fd824f19d9501162620b53

pkgname=openfx-io
pkgver=2.4.0
_pkgname="${pkgname}-Natron-${pkgver}"
pkgrel=1
arch=('x86_64')
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/NatronGitHub/openfx-io"
license=('GPL')
depends=('ffmpeg' 'openimageio' 'libseexpr2')
conflicts=("${pkgname}-git")

_natron_ver="Natron-${pkgver}"
_pkgname="${pkgname}-${_natron_ver}"
_url=${url%/${pkgname}}

source=("${_pkgname}.tar.gz::${url}/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-${_natron_ver}.tar.gz::${_url}/openfx/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-supportext-${_openfx_supportext_commit}.tar.gz::${_url}/openfx-supportext/archive/${_openfx_supportext_commit}.tar.gz"
        "SequenceParsing-${_SequenceParsing_commit}.tar.gz::${_url}/SequenceParsing/archive/${_SequenceParsing_commit}.tar.gz"
        "tinydir-${_tinydir_commit}.tar.gz::${_url}/tinydir/archive/${_tinydir_commit}.tar.gz")
sha512sums=('5c51eb2ee3c4210dc07546e7424ed6e038a5c0f0d2c4a65b3b9a8f70caab1d07a13de410bc3c2cb95b58b45159ae98671e41db843b0a6ff88e36df7d80a6a22c'
            '0a01ea18970a06eb58b03e16f9027a84f37e53581387a0fbd208be16e2fa71f3e0d314307934348e3a7a0c3bc699c36535fd044f18e89a937e9bfca239037096'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  tar -xzf "openfx-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/openfx/"
  tar -xzf "openfx-supportext-${_openfx_supportext_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/SupportExt/"

  tar -xzf "SequenceParsing-${_SequenceParsing_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/IOSupport/SequenceParsing/"
  tar -xzf "tinydir-${_tinydir_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/IOSupport/SequenceParsing/tinydir"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make CONFIG=release
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/OFX/Plugins"
  make install PLUGINPATH="${pkgdir}/usr/OFX/Plugins" \
               CONFIG=release
}
