# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=basiliskii-emaculation-git
pkgver=r2893.a306262e
pkgrel=1
pkgdesc="Open Source 68k Macintosh Emulator"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="https://github.com/emaculation/macemu"
license=(GPL)
depends=(gtk2 sdl vde2)
makedepends=(git)
provides=(basiliskii)
conflicts=(basiliskii)
source=("emaculation-macemu::git+https://github.com/emaculation/macemu"
        "https://raw.githubusercontent.com/FabioLolix/AUR-artifacts/master/basiliskii-emaculation-fix-unnecessary-AM_GNU_GETTEXT-in-configure.ac.patch")
sha256sums=('SKIP'
            '75cd86143f1a7f069c506db7933d3498ef96b2d526701725904b4d24cd07c33e')

pkgver() {
  cd emaculation-macemu
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd emaculation-macemu
  patch -Np1 -i ../basiliskii-emaculation-fix-unnecessary-AM_GNU_GETTEXT-in-configure.ac.patch

  cd BasiliskII/src/Unix
  NO_CONFIGURE=1 ./autogen.sh
}

build() {
  cd emaculation-macemu/BasiliskII/src/Unix
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
  cd emaculation-macemu/BasiliskII/src/Unix
  make DESTDIR="${pkgdir}" install
}
