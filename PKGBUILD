# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Arkham <arkham@archlinux.us>
# Contributor: brix <blbennett@telus.net>

pkgname=ghextris
pkgver=0.9.0
pkgrel=5
pkgdesc='Tetris-like game on a hexagonal grid'
arch=('x86_64' 'i686')
url='http://mjr.iki.fi/software/ghextris'
license=('GPL')
depends=('gnome-python')
makedepends=('gettext' 'setconf' 'xorg-xdpyinfo')
source=("http://mjr.iki.fi/software/${pkgname}_$pkgver-1.tar.gz")
sha256sums=('cd67776a35561879407208a5ecd201a23fcd5726a4962eaba1e25219c44c4cd6')

prepare() {
  cd "$pkgname-$pkgver"

  setconf install.sh BINDIR '"$PREFIX/bin"'
  setconf install.sh SHAREDIR '"$PREFIX/share/ghextris"'
  setconf install.sh REALSHAREDIR '"$REALPREFIX/share/ghextris"'

  sed -i -e 's:share/games:share:' install.sh
  sed -i -e 's:python2.3:python2:' -e 's:whrandom:random:g' "$pkgname.py"

  # Adjust the image sizes for DPI > 96
  DPI=$(xdpyinfo | grep resolution | head -1 | cut -d"x" -f2 | cut -d" " -f1)
  if (( DPI > 96 )); then
    sed -i 's/24/48/' ghextris.py
    sed -i 's/26/52/' ghextris.py
    sed -i 's/14/28/' ghextris.py
  fi
}

package() {
  cd "$pkgname-$pkgver"
  
  ./install.sh "$pkgdir/usr" /usr > install.log
}

# vim:set ts=2 sw=2 et:
