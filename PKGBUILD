# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-bsnes-git
pkgver=r543.a4800add
pkgrel=1
pkgdesc='Super Nintendo Entertainment System cores'
arch=('x86_64')
url='https://github.com/libretro/bsnes-libretro'
license=('GPL3')
groups=('libretro-unstable')
depends=('gcc-libs' 'glibc' 'libretro-core-info')
makedepends=('git')
provides=('libretro-bsnes')
conflicts=('libretro-bsnes')
source=('libretro-bsnes::git+https://github.com/libretro/bsnes-libretro')
sha256sums=('SKIP')

pkgver() {
  cd libretro-bsnes

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd libretro-bsnes

  sed 's/g++-4.9/g++/g' -i nall/Makefile
}

build() {
  cd libretro-bsnes

  for p in accuracy balanced performance; do
    make profile=${p}
  done
}

package() {
  cd libretro-bsnes

  install -dm 755 "${pkgdir}"/usr/{lib/libretro,share/libretro/info}
  for p in accuracy balanced performance; do
    install -m 644 out/bsnes_${p}_libretro.so "${pkgdir}"/usr/lib/libretro/
  done
}

# vim: ts=2 sw=2 et:
