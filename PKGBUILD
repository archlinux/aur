# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-io-git
pkgver=Natron.2.4.3.r6.g9fb5ee9
pkgrel=1
arch=('x86_64')
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/NatronGitHub/openfx-io"
license=('GPL')
depends=('ffmpeg' 'openimageio' 'libseexpr2')
makedepends=('opencolorio1' 'git')

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

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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
  cd ../..

  # Change OpenColorIO library references to the version of "opencolorio1" package
  find IOSupport/ -name GenericOCIO.* \
        -exec sed -i 's/include <OpenColorIO/include <OpenColorIO1/' {} \;
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
