pkgbase='geany-plugin-preview'
_gitname='geany-preview'
pkgname="$pkgbase-git"
pkgdesc="Plugin for Geany to Preview lightweight markup languages, including AsciiDoc, DocBook, Fountain, LaTeX, Markdown, MediaWiki, reStructuredText, Textile, and Txt2Tags."
url="https://github.com/xiota/geany-preview"
pkgver=0.0.2.r0.gc83d1cf
pkgrel=1
arch=(x86_64)
license=(GPL)
depends=(
  'cmark-gfm'
  'geany'
  'podofo'
  'webkit2gtk'
)
makedepends=(
  'git'
)

provides=("$pkgbase")
conflicts=(${provides[@]})

_branch="main"
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
  ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install DESTDIR="$pkgdir"
}
