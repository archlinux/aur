# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Caleb Fontenot foley2431 (at) gmail.com

pkgname=pcsx-rearmed-git
pkgver=r1638.67c020ee
pkgrel=1
pkgdesc="Playstation 1 Emulator, optimized for ARM."
arch=(x86_64 aarch64 armv7h)
url=https://github.com/notaz/pcsx_rearmed
license=(GPL-2.0)
depends=(sdl12-compat alsa-lib libpng libpulse glibc zlib)
makedepends=(git zip)
source=("git+https://github.com/notaz/pcsx_rearmed.git"
        "git+https://github.com/notaz/libpicofe.git"
        "git+https://github.com/notaz/warm.git"
        "git+https://github.com/rtissera/libchdr.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/pcsx_rearmed"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/pcsx_rearmed"
  git submodule init
  git config submodule.frontend/libpicofe.url "${srcdir}/libpicofe"
  git config submodule.frontend/warm.url "${srcdir}/warm"
  git config submodule.libchdr.url "${srcdir}/libchdr"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/pcsx_rearmed"
  ./configure
  make rel $MAKEFLAGS
}

package() {
  cd "$srcdir/pcsx_rearmed"
  rm -v *.zip
  install -d $pkgdir/usr/bin
  install -d $pkgdir/opt/pcsx
  cp -rv pcsx_rearmed_*/* $pkgdir/opt/pcsx
  ln -s /opt/pcsx/pcsx ${pkgdir}/usr/bin/pcsx
}
