# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-bsnes-git
pkgver=r457.1f9f61a
pkgrel=3
pkgdesc='Super Nintendo Entertainment System cores'
arch=('i686' 'x86_64')
url='https://github.com/libretro/bsnes-libretro'
license=('GPL3')
groups=('libretro')
depends=('gcc-libs' 'glibc')
makedepends=('git')
source=('libretro-bsnes::git+https://github.com/libretro/bsnes-libretro'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bsnes_accuracy_libretro.info'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bsnes_balanced_libretro.info'
        'https://raw.githubusercontent.com/libretro/libretro-super/master/dist/info/bsnes_performance_libretro.info')
sha256sums=('SKIP'
            '0307d236776f5462dfa4fd7814b03dc7704cd66c1cc1e03a1dd5b1b978bb3fb8'
            '594296694dd0b99959253f8da066a83c9de17c1c260dcdd058d9b45dbeb8af61'
            '0cf91d9788336a9e62df448df20003a7b720a8e309eeb6a7f0f00293d4768fff')

pkgver() {
  cd libretro-bsnes

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
    install -m 644 ../bsnes_${p}_libretro.info "${pkgdir}"/usr/share/libretro/info/
  done
}

# vim: ts=2 sw=2 et:
