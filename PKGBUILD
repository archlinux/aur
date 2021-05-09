# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: William Termini <aur@termini.me>

pkgname=basiliskii-git
pkgver=r2667.4671258b
pkgrel=1
pkgdesc="Open Source 68k Macintosh Emulator"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://basilisk.cebix.net"
license=(GPL)
depends=(gtk2 sdl vde2)
makedepends=(git)
provides=(basiliskii)
conflicts=(basiliskii)
source=("git+https://github.com/cebix/macemu"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/basiliskii-unnecessary-AM_GNU_GETTEXT-in-configure.ac.patch")
sha256sums=('SKIP'
            '202aacbd70f290d6ba300d5fe727aa05af7bb9028bc7d0869575268be477481c')

pkgver() {
  cd macemu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd macemu
  patch -Np1 -i ../basiliskii-unnecessary-AM_GNU_GETTEXT-in-configure.ac.patch

  cd BasiliskII/src/Unix
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
  make DESTDIR="${pkgdir}" install
}
