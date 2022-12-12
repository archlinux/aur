# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-arena-git
pkgver=Natron.2.4.4.r1.gd7c5f1b
pkgrel=1
arch=('x86_64')
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/NatronGitHub/openfx-arena"
license=('GPL')
depends=('libcdr' 'libmagick' 'librsvg' 'libxt' 'libzip' 'opencolorio' 'poppler-glib' 'sox')
makedepends=('git' 'jbigkit' 'openmp' 'pango')

_pkgname=${pkgname%-git}
_url=${url%/${_pkgname}}

conflicts=("${_pkgname}")

source=("${_pkgname}::git+${url}"
        "openfx::git+${_url}/openfx"
        "openfx-io::git+${_url}/openfx-io"
        "lodepng::git+https://github.com/lvandeve/lodepng"
        "openfx-supportext::git+${_url}/openfx-supportext"
        "SequenceParsing::git+${_url}/SequenceParsing"
        "tinydir::git+${_url}/tinydir")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.OpenFX.url "$srcdir"/openfx
  git config submodule.OpenFX-IO.url "$srcdir"/openfx-io
  git config submodule.SupportExt.url "$srcdir"/openfx-supportext
  git config submodule.lodepng.url "$srcdir"/lodepng
  git -c protocol.file.allow=always submodule update

  cd OpenFX-IO
  git submodule init
  git config submodule.openfx.url "$srcdir"/openfx
  git config submodule.SupportExt.url "$srcdir"/openfx-supportext
  git config submodule.IOSupport/SequenceParsing.url "$srcdir"/SequenceParsing
  git -c protocol.file.allow=always submodule update

  cd IOSupport/SequenceParsing
  git submodule init
  git config submodule.tinydir.url "$srcdir"/tinydir
  git -c protocol.file.allow=always submodule update
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
