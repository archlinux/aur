# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Mario Blättermann <mariobl@gnome.org>

pkgname=wmcube
pkgver=1.0.2
pkgrel=1
pkgdesc="3D objects tumbling about representing CPU load"
arch=('i686' 'x86_64')
url="https://www.dockapps.net/wmcube"
license=('GPL-3.0-only')
options+=('!debug')
depends=('libxpm' 'libx11' 'glibc' 'libdockapp')
source=("https://www.dockapps.net/download/$pkgname-$pkgver.tar.gz" 
    "01-use_libdockapp.patch" 
    "02-no_root_chown.patch" 
    "03-fix-pre-ansi-function-declarations.patch")
md5sums=('a81939fc13043ce8f95365a6c2ad27ce' 
    '53d49d5268117f1d3448c5a3c685c8d7' 
    'f36ef952fe4f29b8f70ed6cb70c4b3fd' 
    'eb10671e2b7169ee1e3e2c01dfaf8247')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch --verbose -Np2 -d "wmcube" < "$srcdir/01-use_libdockapp.patch"
    patch --verbose -Np2 -d "wmcube" < "$srcdir/02-no_root_chown.patch"
    patch --verbose -Np2 -d "wmcube" < "$srcdir/03-fix-pre-ansi-function-declarations.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  make CFLAGS+=-std=gnu17
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  install -Dv -m 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dv -m 644 $pkgname.1 "$pkgdir/usr/share/man/$pkgname.1"

  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  install -v -m 644 3D-objects/* "$pkgdir/usr/share/$pkgname"
}
