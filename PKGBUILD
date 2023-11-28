# Maintainer: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: William Termini <aur@termini.me>

_pkgname=basiliskii
pkgname=${_pkgname}-git
pkgver=r3387.3d49e979
pkgrel=1
pkgdesc='Open Source 68k Macintosh Emulator'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://basilisk.cebix.net'
license=(GPL)
depends=('gtk2' 'sdl2' 'vde2')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/kanjitalk755/macemu")
sha256sums=('SKIP')

pkgver() {
  cd macemu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd macemu/BasiliskII/src/Unix
  NO_CONFIGURE=1 ./autogen.sh
}

build() {
  cd macemu/BasiliskII/src/Unix

  ./configure \
    --prefix=/usr \
    --enable-sdl-video \
    --enable-sdl-audio \
    --enable-jit-compiler \
    --with-bincue \
    --with-vdeplug

  make -j1
}

package() {
  cd macemu/BasiliskII/src/Unix
  make DESTDIR="$pkgdir" install
}
