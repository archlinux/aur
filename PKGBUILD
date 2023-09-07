# Maintainer:

_pkgname='geany-plugin-preview'
_gitname='geany-preview'
pkgname="$_pkgname-git"
pkgdesc="Plugin for Geany to Preview lightweight markup languages, including AsciiDoc, DocBook, Fountain, LaTeX, Markdown, MediaWiki, reStructuredText, Textile, and Txt2Tags."
url="https://github.com/xiota/geany-preview"
pkgver=0.0.3.r5.g05b965b
pkgrel=1
arch=(x86_64)
license=(GPL)
depends=(
  'cmark-gfm'
  'geany'
  'podofo-0.9'
  'webkit2gtk'
)
makedepends=(
  'git'
)

if [ x"$_pkgname" != x"$pkgname" ] ; then
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")
fi

: ${_branch:=main}
source=(
  "$_gitname"::"git+$url#branch=$_branch"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_gitname"

  if [ "$_branch" = "main" ] ; then
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf "%s.%s" \
      $(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g') \
      "$_branch"
  fi
}

prepare() {
  cd "$srcdir/$_gitname"
  autoreconf -vfi

  export PKG_CONFIG_PATH=/usr/lib/podofo-0.9/pkgconfig PKG_CONFIG_PATH='/usr/lib/podofo-0.9/pkgconfig:/usr/lib/pkgconfig'
  export CFLAGS+=' -O3'
  export CXXFLAGS+=' -O3'

  ./configure \
    --prefix='/usr' \
    --with-system-libdir='/usr/lib/podofo-0.9:/usr/lib' \
    --with-system-includedir='/usr/lib/podofo-0.9:/usr/include'
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir"
}
