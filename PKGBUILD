# Contributor: 3ED <krzysztof1987@gmail.com>

pkgname=gz-models
_svnmod=GZ-Models
pkgver=16
pkgrel=1
pkgdesc="HiRes 3D Models for GZDoom"
arch=('any')
url="http://code.google.com/p/ds-models/"
license=('GPL')
depends=('gzdoom')
makedepends=('subversion' 'perl' 'p7zip')
install=gz-models.install
source=("${_svnmod}::svn+http://ds-models.googlecode.com/svn/trunk/GZ-Models/")
sha256sums=('SKIP')

pkgver() {
  cd ${_svnmod}
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir"

  find "$_svnmod" -type f -name "*.def" -print0|xargs -0 perl -pe 's/\xA0/ /g' -i

  if [ -d "build" ]; then
    rm -rf "build"
  fi

  mkdir -p -m 755 build/Models
  mv "$_svnmod"/Build/*/*.def build/
  mv "$_svnmod"/Build/Hires build/
  mv "$_svnmod"/Build/*/*/ build/Models/

  rm -rf "$_svnmod"
}

build() {
  cd "$srcdir/build"
  7za a -bd -tzip ../GZ-Models.pk3 *.def Models Hires
#  bsdtar --format zip -cf ../GZ-Models.pk3 *.def Models Hires # not working :<
}

package() {
  cd "$srcdir"
  install -Dm644 GZ-Models.pk3 "$pkgdir"/usr/share/games/gzdoom/GZ-Models.pk3
}
