# Author: Miguel Useche <migueluseche@skatox.com>
# Maintainer: Miguel Useche <migueluseche@skatox.com>
pkgname=kim6
pkgver=2.2.0
pkgrel=1
pkgdesc="Kde Image Menu to compress, resize, convert, rename and much more (for KDE Plasma 6)"
arch=(i686 x86_64)
url="https://skatox.com/blog/kim-kde-image-manipulator-for-plasma-6/"
license=("GPL")
depends=(imagemagick intltool gettext kdialog perl-image-exiftool kdialog)
optdepends=(
  "ffmpeg: video resizing/encoding features"
  "xdg-utils: xdg-email support"
)
source=("$pkgname"-"$pkgver".tar.gz::https://github.com/KIM-6/kim6/archive/refs/tags/v"$pkgver".tar.gz)
sha512sums=('b7ef7a041c84d6617cb9b38cba9b26df1de7a94d8a0bfed315b251fae45ea049af0f5762861cfdfe59c31ccec3f0688d109c97e253bebc9b49324cc29b2ec919') 
package() {
  cd "$srcdir/$pkgname-$pkgver"

  local servicemenu_dir="$pkgdir/usr/share/kio/servicemenus"
  install -dm755 "$servicemenu_dir" "$pkgdir/usr/share/licenses/$pkgname"

  XDG_DATA_DIRS="$pkgdir/usr/share" ./install.sh

  # install.sh writes absolute build paths when staging into $pkgdir; normalize to runtime paths.
  local escaped_pkgdir
  escaped_pkgdir="$(printf '%s\n' "$pkgdir" | sed 's/[\/&]/\\&/g')"
  find "$servicemenu_dir" -type f -exec sed -i "s|$escaped_pkgdir||g" {} +

  install -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
