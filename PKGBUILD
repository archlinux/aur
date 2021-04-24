# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-io-git
pkgver=Natron.2.4.0.r0.g47c236e
_pkgname="${pkgname}-Natron-${pkgver}"
pkgrel=1
arch=('x86_64')
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/NatronGitHub/openfx-io"
license=('GPL')
depends=('ffmpeg' 'openimageio' 'libseexpr2')

_pkgname=${pkgname%-git}
_url=${url%/${_pkgname}}

conflicts=("${_pkgname}")

source=("${_pkgname}::git+${url}"
        "openfx::git+${_url}/openfx"
        "openfx-supportext::git+${_url}/openfx-supportext"
        "SequenceParsing::git+${_url}/SequenceParsing"
        "tinydir::git+${_url}/tinydir")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd ${_pkgname}
  git submodule init
  git config submodule.openfx.url ${srcdir}/openfx
  git config submodule.SupportExt.url ${srcdir}/openfx-supportext
  git config submodule.IOSupport/SequenceParsing.url ${srcdir}/SequenceParsing
  git submodule update

  cd IOSupport/SequenceParsing
  git submodule init
  git config submodule.tinydir.url ${srcdir}/tinydir
  git submodule update
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
