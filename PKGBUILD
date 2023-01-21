# Maintainer: dodoradio <dodoradio@outlook.com>
# Contributor: Beej Jorgensen <beej@beej.us>
pkgname=xtide
pkgver=2.15.5
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
source=("https://flaterco.com/files/xtide/harmonics-dwf-20220109-free.tar.xz"
  "https://flaterco.com/files/xtide/$pkgname-$pkgver.tar.xz"
  "${pkgname}.conf"
  "${pkgname}.desktop"
)
md5sums=('095eaf7f8a62fba55b91455182974154'
         '48b6993d4a04a15d2d7be355b6e0e739'
         '4de09c336aa0e41980c1925d06201e5c'
         'eb5ebe8432103880ff3331f3236b3e74')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sbindir=/usr/bin
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  local hver=20220109
  local hdir=harmonics-dwf-${hver}
  local hfile=${hdir}-free.tcd

  # install harmonics file
  install -D -m0644 $srcdir/$hdir/$hfile "$pkgdir/usr/share/$pkgname/$hfile"

  # config file
  install -D -m0644 $srcdir/${pkgname}.conf $pkgdir/etc/${pkgname}.conf

  # desktop file
  install -D -m0644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop

  # binary
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # icon
  install -D -m0644 iconsrc/icon_48x48_orig.png $pkgdir/usr/share/pixmaps/${pkgname}.png
}

# vim:set ts=2 sw=2 et:
