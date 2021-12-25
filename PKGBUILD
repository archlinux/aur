# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_SequenceParsing_commit=103c528347ebb2dd0ff5d79b5cee24bbcf938ce0
_tinydir_commit=64fb1d4376d7580aa1013fdbacddbbeba67bb085

pkgname=openfx-io
pkgver=2.4.2
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
        "openfx-supportext-${_natron_ver}.tar.gz::${_url}/openfx-supportext/archive/${_natron_ver}.tar.gz"
        "SequenceParsing-${_SequenceParsing_commit}.tar.gz::${_url}/SequenceParsing/archive/${_SequenceParsing_commit}.tar.gz"
        "tinydir-${_tinydir_commit}.tar.gz::${_url}/tinydir/archive/${_tinydir_commit}.tar.gz")
sha512sums=('12ba4d52f5712dee30db94bd5d382d899c58f61e68e30268d8c45baa40a9a13281ae2d88b56160547e0feaa0cc28f6f43c40f95d825cf47f082d071b6dda2535'
            '624530af417821d759358ccfc45ba7ba10890fd115bbfef3e3fa61f486414fe61f39bfce8593f7ab84ee3d5ed3db05149d614f1407735fd8d6529894996103fa'
            'b3d6672287824b3f61c32156618040ed4892c7748a496688369eca95a4c0d562b53e573b22a38f59445d96e4e54a34ea20164a1495d8780338c6dcc945c804c9'
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
