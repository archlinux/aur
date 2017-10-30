# Maintainer: Sergey Slipchenko <faergeek@gmail.com>
pkgname=plymouth-lite-rbp-git
pkgver=r10.76e20e8
pkgrel=1
pkgdesc="Plymouth-lite patched and ready for Raspberry Pi"
arch=('armv7h')
url="https://github.com/T4d3o/Plymouth-lite"
license=('GPL2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('plymouth-lite-rbp::git+https://github.com/T4d3o/Plymouth-lite.git'
        '01-change-systemd-unit.patch' 'initcpio_hook' 'initcpio_install')
md5sums=('SKIP'
         '709d24411c2fcd62b2eccbfc98010b25'
         '86dcab222ab4be45fc96d2792ff91809'
         'e13f4e22ee8e28eef85028c9307bfc3f')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -Np1 -i "$srcdir/01-change-systemd-unit.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
  mkdir -p $pkgdir/usr/lib/systemd/system/
  install -Dm0644 systemd/* $pkgdir/usr/lib/systemd/system/
  install -D -m644 "${srcdir}"/initcpio_hook "${pkgdir}"/usr/lib/initcpio/hooks/plymouth-lite
  install -D -m644 "${srcdir}"/initcpio_install "${pkgdir}"/usr/lib/initcpio/install/plymouth-lite
}
