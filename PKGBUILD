# Maintainer: Felix Esch <felix_esch at alice dot de>

# Upstream name of extension:
_extname=Math
# Variant valid as package name without suffix and prefix
_basepkgname=math

pkgname=mediawiki-$_basepkgname-git
pkgver=r851.2ba9c21
pkgrel=2
pkgdesc="An extension for math typesetting with texvc support."
install=mediawiki-math-git.install
source=("git+https://gerrit.wikimedia.org/r/mediawiki/extensions/$_extname")
sha256sums=("SKIP")
arch=(i686 x86_64)
url="https://www.mediawiki.org/wiki/Extension:$_extname"
license=("GPL")
depends=(mediawiki texvc)
optdepends=()
makedepends=(git make ocaml)
provides=("mediawiki-$_basepkgname")
conflicts=("mediawiki-$_basepkgname")

pkgver() {
  cd $_extname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Target extension directory of MediaWiki:
  _extdir="$pkgdir/usr/share/webapps/mediawiki/extensions"
  mkdir -p "$_extdir"
  mv $_extname "$_extdir/"
  rm -r $_extdir/$_extname/.git
}

build() {
  cd "$srcdir/$_extname/texvccheck"
  make
  cd "$srcdir/$_extname"
  # Remove build files
  shopt -s nullglob
  rm -r math/*.cmx math/*.cmi math/*.o \
        texvccheck/*.cmx texvccheck/*.cmi \
        texvccheck/*.o
}