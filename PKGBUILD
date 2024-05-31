# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_lodepng_commit=997936fd2b45842031e4180d73d7880e381cf33f
_SequenceParsing_commit=3c93fcc488632b0bdfeee3181586809932357598
_tinydir_commit=64fb1d4376d7580aa1013fdbacddbbeba67bb085

pkgname=openfx-arena
pkgver=2.5.0
pkgrel=2
arch=('x86_64')
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/NatronGitHub/openfx-arena"
license=('GPL-2.0-or-later')
depends=('libcdr' 'libmagick' 'librsvg' 'libxt' 'libzip' 'ocl-icd' \
         'opencolorio' 'poppler-glib' 'sox')
makedepends=('jbigkit' 'openmp' 'pango')

_natron_ver="Natron-${pkgver}"
_pkgname="${pkgname}-${_natron_ver}"
_url=${url%/${pkgname}}

source=("${_pkgname}.tar.gz::${url}/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-${_natron_ver}.tar.gz::${_url}/openfx/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-io-${_natron_ver}.tar.gz::${_url}/openfx-io/archive/refs/tags/${_natron_ver}.tar.gz"
        "openfx-supportext-${_natron_ver}.tar.gz::${_url}/openfx-supportext/archive/${_natron_ver}.tar.gz"
        "lodepng-${_lodepng_commit}.tar.gz::https://github.com/lvandeve/lodepng/archive/${_lodepng_commit}.tar.gz"
        "SequenceParsing-${_SequenceParsing_commit}.tar.gz::${_url}/SequenceParsing/archive/${_SequenceParsing_commit}.tar.gz"
        "tinydir-${_tinydir_commit}.tar.gz::${_url}/tinydir/archive/${_tinydir_commit}.tar.gz")
b2sums=('8e24dd50a85b880d0403fd0099bc4ece3dd3af3e6af10a4696506c31063b55bc32ecce4c9602fae6a690255c4c5333937b1e3ea8bf400f0bdedab6c9ed626837'
        'b5bda788e381d8bfc585a16817ab207152327638290099b54565306e1f6165eb36f7b34ed57732ca53b75d34c6abfc30b7e6f73548820e0f214b4be99db84420'
        'ccd145aabb554e4a3665d3da11dc7660cdf8a4907a6fe6a5a72895a6ecec4096a7ee8bf79d917233e1bd355b82fca6f0d52cef179a3bd3ffcf4e73ab0eeb4d10'
        '26c63f91c778bb3e79e3ef8b0e7a0416881315a8c60e03e9bb7bf13e87115ad3b9b39ff9d249f2cc4e89f4a759fa18fe81448ebd5bb68f0af0be3d251a4c3240'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  tar -xzf "lodepng-${_lodepng_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/lodepng/"
  tar -xzf "openfx-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/OpenFX/"
  tar -xzf "openfx-supportext-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/SupportExt/"

  tar -xzf "openfx-io-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/OpenFX-IO/"
  tar -xzf "openfx-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/OpenFX-IO/openfx/"
  tar -xzf "openfx-supportext-${_natron_ver}.tar.gz" --strip 1 \
      -C   "${_pkgname}/OpenFX-IO/SupportExt/"

  tar -xzf "SequenceParsing-${_SequenceParsing_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/OpenFX-IO/IOSupport/SequenceParsing/"
  tar -xzf "tinydir-${_tinydir_commit}.tar.gz" --strip 1 \
      -C   "${_pkgname}/OpenFX-IO/IOSupport/SequenceParsing/tinydir"

  # Fix issue during compilation of ReadPDF module
  sed '/POPPLER_CXXFLAGS/ s/$/ -std=c++20/' \
   -i "${srcdir}/${_pkgname}/Makefile.master"
}

build() {
  cd $_pkgname
  make CONFIG=release
}

package() {
  cd $_pkgname
  mkdir -p "${pkgdir}/usr/OFX/Plugins"
  make install PLUGINPATH="${pkgdir}/usr/OFX/Plugins" \
               CONFIG=release
}
