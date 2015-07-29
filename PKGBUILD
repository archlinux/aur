# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=xtide
pkgver=2.14
pkgrel=1
pkgdesc="Harmonic tide clock and tide predictor"
arch=('i686' 'x86_64')
url="http://www.flaterco.com/xtide/xtide.html"
license=('GPL')
depends=('xaw3d' 'libpng' 'libtcd')
optdepends=(
  'gpsd: for automatic location finding'
  'xtide-wvs: for hi-res vector coastlines'
)
backup=("etc/$pkgname/$pkgname.conf")
source=('ftp://ftp.flaterco.com/xtide/harmonics-dwf-20141224-free.tar.bz2'
  "ftp://ftp.flaterco.com/xtide/$pkgname-$pkgver.tar.bz2"
  "${pkgname}-$pkgver-aur.patch"
  "${pkgname}.conf"
  "${pkgname}.desktop"
)
md5sums=('27adcccb2824ac45b072636b1ee1cdd5'
         '0f50833e6f686eca16dcb33c1719cf6c'
         '6b95a3602898b45bb0079740e4859660'
         '24c362cc119e413408318bd1eea04846'
         'eb5ebe8432103880ff3331f3236b3e74')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # patch to look for conf in /etc/xtide
  patch -Np1 < ../$pkgname-$pkgver-aur.patch

  ./configure --prefix=/usr --sbindir=/usr/bin
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  local hver=20141224
  local hdir=harmonics-dwf-${hver}
  local hfile=${hdir}-free.tcd

  # install harmonics file
  install -D -m0644 $srcdir/$hdir/$hfile "$pkgdir/usr/share/$pkgname/$hfile"

  # config file
  install -D -m0644 $srcdir/${pkgname}.conf $pkgdir/etc/$pkgname/${pkgname}.conf

  # desktop file
  install -D -m0644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop

  # binary
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # icon
  install -D -m0644 iconsrc/icon_48x48_orig.png $pkgdir/usr/share/pixmaps/${pkgname}.png
}

# vim:set ts=2 sw=2 et:
