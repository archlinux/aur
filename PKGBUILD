# Contributor: 3ED <krzysztofas@protonmail.com>

pkgname=gz-models
_trunk=GZ-Models
pkgver=20130109
pkgrel=1
pkgdesc="HiRes 3D Models for GZDoom"
arch=('any')
url="http://code.google.com/p/ds-models/"
license=('GPL')
depends=('gzdoom')
makedepends=('perl' 'p7zip')
install=gz-models.install
source=("ds-models-${pkgver}.zip::https://storage.googleapis.com/google-code-archive-source/v2/code.google.com/ds-models/source-archive.zip")
sha512sums=('6a3b7b9446d42e12371fab2b25bb2856ca79f5796ecd0c7e6f315ddb56c3eb57a88d406d4aa3b83c2f7bbb8fe04a8670602545b7bb8dbc114da21fc3b7ee6b96')
noextract=("ds-models-${pkgver}.zip")

prepare() {
  cd "$srcdir"

  if [ -d "$pkgname-$pkgver" ]; then
    rm -rf "$pkgname-$pkgver"
  fi

  msg2 "Extracting $_trunk..."
  bsdtar \
    --include="ds-models/trunk/$_trunk/*" \
    --strip-components 2 \
    -xf "ds-models-${pkgver}.zip"

  cd "$_trunk"

  msg2 "Fixing space chars..."
  find -type f -iname "*.def" -print0 \
    | xargs -0 perl -p -i -e 's/\xA0/ /g'

  msg2 "Fixing files paths..."
  install -dm755 "$srcdir/$pkgname-$pkgver/Models"
  mv Build/*/*.def "$srcdir/$pkgname-$pkgver/"
  mv Build/Hires   "$srcdir/$pkgname-$pkgver/"
  mv Build/*/*/    "$srcdir/$pkgname-$pkgver/Models/"

  cd "$srcdir"

  msg2 "Cleaning leftovers..."
  rm -rf "$_trunk"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Dunno if this is still a proper path
  _DESTDIR="$pkgdir"/usr/share/games/gzdoom/

  install -dm755    "$_DESTDIR"
  7za a   -bd -tzip "$_DESTDIR/${_trunk}.pk3" *
  chmod   a=r,u+w   "$_DESTDIR/${_trunk}.pk3"
}
