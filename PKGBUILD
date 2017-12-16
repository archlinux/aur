# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bolt
pkgver=0.1
pkgrel=2
pkgdesc="Thunderbolt 3 security system daemon"
arch=('i686' 'x86_64')
url="https://github.com/gicmo/bolt"
license=('LGPL')
depends=('polkit' 'systemd')
makedepends=('asciidoc' 'meson')
checkdepends=('umockdev')
source=($pkgname-$pkgver.tar.gz::https://github.com/gicmo/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('2ded4b9b72fe8a53c25fd17fc1c356af8c59016a9b2bf19cf79dcc945c84402c')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -d ../build
  arch-meson ../build
  ninja -v -C ../build
}

check() {
  cd "${srcdir}"/$pkgname-$pkgver

  ninja -C ../build test
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  DESTDIR="${pkgdir}" ninja -C ../build install
# Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"
  install -d "${pkgdir}"/var/lib/thunderbolt
}
