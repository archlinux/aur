# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-arena
pkgver=2.3.14
pkgrel=2
arch=("i686" "x86_64")
pkgdesc="Extra OpenFX plugins for Natron"
url="https://github.com/NatronGitHub/openfx-arena"
license=("GPL")
makedepends=("git")
depends=('libcdr' 'libgl' 'libmagick' 'librsvg' 'libxt' 'libzip' \
	 'ocl-icd' 'opencolorio' 'poppler-glib')
source=("$pkgname::git+https://github.com/NatronGitHub/openfx-arena#tag=Natron-$pkgver"
        "git+https://github.com/NatronGitHub/openfx"
        "git+https://github.com/NatronGitHub/openfx-supportext"
        "git+https://github.com/NatronGitHub/openfx-io"
        "git+https://github.com/NatronGitHub/SequenceParsing"
        "git+https://github.com/NatronGitHub/tinydir"
        "im7.patch")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '2e4cf8665b074afe84d743ea86e9e89e')

# Check the ImageMagick version
_IM_VERSION=$(echo `identify -version` | tr -dc '0-9' | cut -c 1)

prepare() {
  cd "$srcdir/$pkgname"
  git config submodule.OpenFX.url $srcdir/openfx
  git config submodule.OpenFX-IO.url $srcdir/openfx-io
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git submodule update

  cd OpenFX-IO
  git config submodule.openfx.url $srcdir/openfx
  git config submodule.SupportExt.url $srcdir/openfx-supportext
  git config submodule.IOSupport/SequenceParsing.url $srcdir/SequenceParsing
  git submodule update

  cd IOSupport/SequenceParsing
  git config submodule.tinydir.url $srcdir/tinydir
  git submodule update
}

build() {
  cd "$srcdir/$pkgname"
  patch Makefile.master ../../im7.patch
  make CONFIG=release \
       IM=$_IM_VERSION \
       #LIBS="-linotify"
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/OFX/Plugins"
  make install PLUGINPATH=$pkgdir/usr/OFX/Plugins \
               CONFIG=release \
               IM=$_IM_VERSION
}

