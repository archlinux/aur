# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_openfx_io_commit=22751c949f0992644af2bf70bbffc438fbb10caa
_SequenceParsing_commit=103c528347ebb2dd0ff5d79b5cee24bbcf938ce0
_tinydir_commit=64fb1d4376d7580aa1013fdbacddbbeba67bb085

pkgname=openfx-io
pkgver=2.4.3+g22751c9
pkgrel=1
arch=('x86_64')
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/NatronGitHub/openfx-io"
license=('GPL')
depends=('ffmpeg' 'opencolorio1' 'openimageio' 'libseexpr2')

_natron_ver="Natron-${pkgver%+*}"
_pkgname="${pkgname}-${_openfx_io_commit}"
_url=${url%/${pkgname}}

source=("${_pkgname}.tar.gz::${url}/archive/${_openfx_io_commit}.tar.gz"
        "openfx-${_natron_ver}.tar.gz::${_url}/openfx/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-supportext-${_natron_ver}.tar.gz::${_url}/openfx-supportext/archive/${_natron_ver}.tar.gz"
        "SequenceParsing-${_SequenceParsing_commit}.tar.gz::${_url}/SequenceParsing/archive/${_SequenceParsing_commit}.tar.gz"
        "tinydir-${_tinydir_commit}.tar.gz::${_url}/tinydir/archive/${_tinydir_commit}.tar.gz")
sha512sums=('SKIP'
            '56fc96d0820d053940336ef3ae9fee4e4386e90c9cede6e5450de66c92220f2670f12b25dfb17aaec621001db140281ab47ee8f3fa5e5915a56cfefe2be813fe'
            'b700769ffc0df0cb3f48ec68cfbdddb01e25a55a3606df5c618cd277ba86af77c58b4301678a5f2b045c13fbe8f0403afe965102e2c78dc69226e11ea8e4be53'
            'SKIP'
            'SKIP')

prepare() {
  tar -xzf "openfx-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/openfx/"
  tar -xzf "openfx-supportext-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/SupportExt/"

  tar -xzf "SequenceParsing-${_SequenceParsing_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/IOSupport/SequenceParsing/"
  tar -xzf "tinydir-${_tinydir_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/IOSupport/SequenceParsing/tinydir"

  # Change OpenColorIO library references to the version of "opencolorio1" package
  find "${_pkgname}/IOSupport/" -name GenericOCIO.* \
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
