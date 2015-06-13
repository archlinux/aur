# Maintainer: SanskritFritz (gmail)
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=crates
pkgver=0.7.1
pkgrel=5
pkgdesc="Challenging and fun three dimensional puzzle game."
url="http://www.octaspire.com/crates/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('lua51' 'mesa' 'libgl' 'sdl_mixer')
makedepends=('cmake')
backup=(usr/share/crates/resources/config.lua)
source=(http://www.octaspire.com/$pkgname/$pkgname-$pkgver.tar.gz crates.desktop)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p build
  cd build
  # https://github.com/octaspire/crates/issues/3
  cmake .. -DCMAKE_EXE_LINKER_FLAGS="-lm" -DLUA_INCLUDE_DIR="/usr/include/lua5.1"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir"/usr/share/{crates,applications,pixmaps,man/man6}
  cp man/man6/crates.6 "$pkgdir/usr/share/man/man6/"
  cp -fR resources "$pkgdir/usr/share/crates/"
  install -m755 crates "$pkgdir/usr/share/crates"
  echo "#!/bin/bash" > "$pkgdir/usr/bin/crates.sh"
  echo "cd '/usr/share/crates/' && ./crates" >> "$pkgdir/usr/bin/crates.sh"
  chmod 755  "$pkgdir/usr/bin/crates.sh"
  install "$srcdir/crates.desktop" "$pkgdir/usr/share/applications"
  install "$srcdir/$pkgname-$pkgver/resources/images/crateslogo48x48x32.ico" "$pkgdir/usr/share/pixmaps/$pkgname.ico"
}

md5sums=('93b59c6134a4343d43f93aa211c3c485'
         '99cf4cb8b8b1c2fc285e0b6bbf957a35')
