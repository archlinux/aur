# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

_lodepng_commit=997936fd2b45842031e4180d73d7880e381cf33f
_SequenceParsing_commit=3c93fcc488632b0bdfeee3181586809932357598
_tinydir_commit=64fb1d4376d7580aa1013fdbacddbbeba67bb085

pkgname=openfx-arena
pkgver=2.5.0
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
sha512sums=('1e30da50daa40a779325dff2d0f37d27fbbb97c2906fb4fa74be68c57208c4de5097b7d6ffa66deed902fbac8511075c1440aa670e9908529e10af78a684ba59'
            '174b75061ac2bb887f2e10df1ec899276e8e27f1873d2dda2ef07ee3fb53f54169fe37d9921642248e28faa974a50a62e5e8ab20ccdd09c96a235084ae16d87d'
            '610e27f056743961c7b3cfbf217e4474ee047e8b70e77eec4b23fb1ad647860b1cbb184c9439d9ca6bf8bcef5fa1248998f98e5da263ec15c070ff7e9264be24'
            'd0ff47d51176defa8ea09c84b3f5c82e899455e5a3375c32fcf4d6ec24d96f3c2882cff759cd6a3a79be3004d2244092c16cfeb5313660dcab8fc17135435968'
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
