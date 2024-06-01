# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_SequenceParsing_commit=3c93fcc488632b0bdfeee3181586809932357598
_tinydir_commit=64fb1d4376d7580aa1013fdbacddbbeba67bb085

pkgname=openfx-io
pkgver=2.5.0
pkgrel=2
arch=('x86_64')
pkgdesc="A set of Readers/Writers plugins written using the OpenFX standard"
url="https://github.com/NatronGitHub/openfx-io"
license=('GPL-2.0-or-later')
depends=('ffmpeg' 'openimageio' 'libseexpr2')
makedepends=('opencolorio')

_natron_ver="Natron-${pkgver%+*}"
_pkgname="${pkgname}-${_natron_ver}"
_url=${url%/${pkgname}}

source=("${_pkgname}.tar.gz::${url}/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-${_natron_ver}.tar.gz::${_url}/openfx/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-supportext-${_natron_ver}.tar.gz::${_url}/openfx-supportext/archive/${_natron_ver}.tar.gz"
        "SequenceParsing-${_SequenceParsing_commit}.tar.gz::${_url}/SequenceParsing/archive/${_SequenceParsing_commit}.tar.gz"
        "tinydir-${_tinydir_commit}.tar.gz::${_url}/tinydir/archive/${_tinydir_commit}.tar.gz"
        'update-opencolorio-support.patch')
b2sums=('ccd145aabb554e4a3665d3da11dc7660cdf8a4907a6fe6a5a72895a6ecec4096a7ee8bf79d917233e1bd355b82fca6f0d52cef179a3bd3ffcf4e73ab0eeb4d10'
        'b5bda788e381d8bfc585a16817ab207152327638290099b54565306e1f6165eb36f7b34ed57732ca53b75d34c6abfc30b7e6f73548820e0f214b4be99db84420'
        '26c63f91c778bb3e79e3ef8b0e7a0416881315a8c60e03e9bb7bf13e87115ad3b9b39ff9d249f2cc4e89f4a759fa18fe81448ebd5bb68f0af0be3d251a4c3240'
        'SKIP'
        'SKIP'
        '5f0553a064c884da1f01f0274f2f997f917425037d560ca88bbf9ecb1d77973d8de128035060af130080fe80ccdb4780eb8d1c73692c0fbf9fcd9e62336cab28')

prepare() {
  tar -xzf "openfx-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/openfx/"
  tar -xzf "openfx-supportext-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/SupportExt/"

  tar -xzf "SequenceParsing-${_SequenceParsing_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/IOSupport/SequenceParsing/"
  tar -xzf "tinydir-${_tinydir_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/IOSupport/SequenceParsing/tinydir"

  cd "${srcdir}/${_pkgname}"
  patch --forward --strip=1 --input="${srcdir}/update-opencolorio-support.patch"
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
