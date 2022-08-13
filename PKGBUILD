# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_lodepng_commit=5601b8272a6850b7c5d693dd0c0e16da50be8d8d
_SequenceParsing_commit=103c528347ebb2dd0ff5d79b5cee24bbcf938ce0
_tinydir_commit=64fb1d4376d7580aa1013fdbacddbbeba67bb085

pkgname=openfx-arena
pkgver=2.4.3
pkgrel=2
arch=('x86_64')
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/NatronGitHub/openfx-arena"
license=('GPL')
depends=('libcdr' 'libgl' 'libmagick' 'librsvg' 'libxt' 'libzip' 'opencolorio1' 'poppler-glib' 'sox' 'zstd')
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
sha512sums=('10613e34476aed3c0b51db590d2da7173773ee07b545ff32228b8bab7ac29b0df8b3804135c54fa98d2bdeadfc5df8a4c626846dae9b97960cf6c60e951725e7'
            '56fc96d0820d053940336ef3ae9fee4e4386e90c9cede6e5450de66c92220f2670f12b25dfb17aaec621001db140281ab47ee8f3fa5e5915a56cfefe2be813fe'
            'c29af37f01850a44cc64420028ba4b9fdd0068a3f3d6464a21a06ba2eb980b469da4d0c1a80eb4201292cb525666c1f948e83e9db86db8ae4f56b5578268a8a0'
            'b700769ffc0df0cb3f48ec68cfbdddb01e25a55a3606df5c618cd277ba86af77c58b4301678a5f2b045c13fbe8f0403afe965102e2c78dc69226e11ea8e4be53'
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

# Change OpenColorIO library references to the version of "opencolorio1" package
  find "${_pkgname}/OpenFX-IO/IOSupport/" -name GenericOCIO.* \
        -exec sed -i 's/include <OpenColorIO/include <OpenColorIO1/' {} \;

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
