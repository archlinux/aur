# Maintainer: SanskritFritz (gmail)
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=crates
pkgver=0.7.1
pkgrel=7
_commit=7eef3f61362903fb06fb6609bd001fef22e6c93f

pkgdesc="Challenging and fun three dimensional puzzle game."
url="https://github.com/octaspire/crates"
license=('GPL')
arch=('x86_64')
depends=('lua51' 'mesa' 'libgl' 'sdl_mixer')
makedepends=('cmake')
backup=("usr/share/crates/resources/config.lua")
source=("https://github.com/octaspire/crates/archive/$_commit.zip" "crates.desktop")

build() {
  cd "$srcdir/$pkgname-$_commit"
  mkdir -p build
  cd build
  # https://github.com/octaspire/crates/issues/3
  cmake .. -DCMAKE_EXE_LINKER_FLAGS="-lm" -DLUA_INCLUDE_DIR="/usr/include/lua5.1"
  make
}

package() {
  cd "$srcdir/$pkgname-$_commit"
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

md5sums=('1bd8a585f8e22b0dc8a1df140ab9661c'
         '22b3dc83195f5d05d175e6298123d496')
