# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=libretro-bsnes-git
pkgver=r457.1f9f61a
pkgrel=1
pkgdesc='bsnes libretro core'
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
            '6a70cd34b75217c1b7e23ebba16e13b80bbda1c2370b5f2fcd83a99bfdc5b3e0'
            '444ed721643530446ff7dd93ff0fec24e1f53eff3a93524b4649593ba23e2e2f'
            '42e4369171f6aba98d389f6b097a561e225b9fcd63f0587fd75f0e57b580198f')

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
