# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_lodepng_commit=997936fd2b45842031e4180d73d7880e381cf33f
_SequenceParsing_commit=3c93fcc488632b0bdfeee3181586809932357598
_tinydir_commit=64fb1d4376d7580aa1013fdbacddbbeba67bb085

pkgname=openfx-arena
pkgver=2.4.4
pkgrel=1
arch=('x86_64')
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/NatronGitHub/openfx-arena"
license=('GPL')
depends=('libcdr' 'libmagick' 'librsvg' 'libxt' 'libzip' 'opencolorio' 'poppler-glib' 'sox')
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
sha512sums=('7581d551b296da133c529341f033d5f126ac488bef9394354a9d60f3ca96314b812f0404a3f2269de494361dd6d9955734284888e17729c21246344173060d0e'
            '39983f693798121342bf6509c819f9243c176c8123e4e2665309270ba3709f686592f9f29b3b938d2c7ce87c756b0ce9ef0ea36c0c96e4d3ba3379bd7f5976be'
            'df556665b757136fab1f2d51825cac397c939f9701b2a5d850411238711826d4473570af9847c663ab4685d13ccd0769a61f03e4947bd7901bf93c5a4b5cb9d2'
            '6b577c26c9299e0c1a707eeaa97e752cd3dd29587580c663ebeabe8d09c76afb66ae31feb0b10a473f84b8e6f4359ed0791c11c1b7cc1b48fb7df0ed69c44b52'
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

# Solve a problem in the linking of the "Extra" plugins,
# caused by a misconfiguration of pkgconfig in the "libzip" package
  sed -i '/ZIP_LINKFLAGS/ s|\$.*libs.*|-lbz2 -llzma -lzstd -lgnutls -lnettle -lz|' \
          "${_pkgname}/Makefile.master"

# The ReadPDF plugin needs Poppler, which uses C++17 features
  sed -i "/POPPLER_CXXFLAGS/ s/$/ -std=c++17/" \
         "${_pkgname}/Makefile.master"
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
