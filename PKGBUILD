# Maintainer: xiota / aur.chaotic.cx

_pkgname='geany-plugin-preview'
_gitname='geany-preview'
pkgname="$_pkgname-git"
pkgdesc="Plugin for Geany to Preview lightweight markup languages, including AsciiDoc, DocBook, Fountain, LaTeX, Markdown, MediaWiki, reStructuredText, Textile, and Txt2Tags."
url="https://github.com/xiota/geany-preview"
pkgver=0.0.3.r6.gd8b9e04
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

  export PKG_CONFIG_PATH='/usr/lib/podofo-0.9/pkgconfig:/usr/lib/pkgconfig'
  #export CFLAGS+=' -O3  -I "/usr/include/podofo-0.9"'
  export CPPFLAGS+=' -O3 -I "/usr/include/podofo-0.9" -DENABLE_EXPORT_PDF=1'

  local _configure_options=(
    --prefix='/usr'
    --with-system-libdir='/usr/lib/podofo-0.9:/usr/lib'
    --with-system-includedir='/usr/include/podofo-0.9:/usr/include'
  )

  ./configure "${_configure_options[@]}"
}


build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir"
}
