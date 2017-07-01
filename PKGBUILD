# Contributor: 3ED <krzysztofas@protonmail.com>

pkgname=gz-models
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

prepare() {
  cd "$srcdir"

  find "ds-models/trunk/GZ-Models" -type f -iname "*.def" -print0 \
    | xargs -0 perl -p -i -e 's/\xA0/ /g'

  if [ -d "$pkgname-$pkgver" ]; then
    rm -rf "$pkgname-$pkgver"
  fi

  install -dm755 "$pkgname-$pkgver/Models"
  mv "ds-models/trunk/GZ-Models"/Build/*/*.def "$pkgname-$pkgver/"
  mv "ds-models/trunk/GZ-Models"/Build/Hires   "$pkgname-$pkgver/"
  mv "ds-models/trunk/GZ-Models"/Build/*/*/    "$pkgname-$pkgver/Models/"

  rm -rf "ds-models"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Dunno if this is still a proper path
  _DESTDIR="$pkgdir"/usr/share/games/gzdoom/

  install -dm755    "$_DESTDIR"
  7za a   -bd -tzip "$_DESTDIR"/GZ-Models.pk3 *.def Models Hires
  chmod   a=r,u+w   "$_DESTDIR"/GZ-Models.pk3
}
