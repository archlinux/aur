# Maintainer: Sergey Slipchenko <faergeek@gmail.com>
pkgname=plymouth-lite-rbp-git
pkgver=r10.76e20e8
pkgrel=2
pkgdesc="Plymouth-lite patched and ready for Raspberry Pi"
arch=('armv7h')
url="https://github.com/T4d3o/Plymouth-lite"
license=('GPL2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/T4d3o/Plymouth-lite.git'
        'initcpio_hook'
        'initcpio_install')
md5sums=('SKIP'
         '86dcab222ab4be45fc96d2792ff91809'
         'e13f4e22ee8e28eef85028c9307bfc3f')

pkgver() {
  cd Plymouth-lite

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Plymouth-lite

  make
}

package() {
  cd Plymouth-lite

  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/lib/systemd/system/
  install -Dm0644 systemd/* $pkgdir/usr/lib/systemd/system/
  install -D -m644 "${srcdir}"/initcpio_hook "${pkgdir}"/usr/lib/initcpio/hooks/plymouth-lite
  install -D -m644 "${srcdir}"/initcpio_install "${pkgdir}"/usr/lib/initcpio/install/plymouth-lite
}
