# Maintainer: prg <prg@xannode.com>
pkgname=vecx-git
pkgver=v1.1.r0.gbe44a67
pkgrel=2
pkgdesc="SDL-based Vectrex console emulator"
arch=('x86' 'x86_64')
url="https://github.com/jhawthorn/vecx"
license=('unknown')
depends=(sdl sdl_gfx sdl_image)
makedepends=('git')
source=('git+https://github.com/jhawthorn/vecx.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  # Fix build on modern gcc
  sed -i 's/-O3/-fgnu89-inline -O3/g' Makefile
  # Load ROM from /usr/share/vecx
  sed -i 's/rom.dat/\/usr\/share\/vecx\/rom.dat/' osint.c
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -D -m 755 vecx $pkgdir/usr/bin/vecx
  install -D -m 644 rom.dat $pkgdir/usr/share/vecx/rom.dat
}

# vim: set ts=2 sw=2 tw=80 et :
