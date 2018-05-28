# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bolt
pkgver=0.4
pkgrel=1
pkgdesc="Thunderbolt 3 security system daemon"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/bolt/bolt"
license=('LGPL')
depends=('polkit' 'systemd')
makedepends=('asciidoc' 'meson')
checkdepends=('umockdev')
source=($pkgname-$pkgver.tar.gz::https://gitlab.freedesktop.org/$pkgname/$pkgname/repository/$pkgver/archive.tar.bz2)
sha256sums=('fd4d4bf0ddadff901db4560f1e52bec2657591f440079c3b76133bbdd9452c38')

build() {
  cd "${srcdir}"/$pkgname-$pkgver-b198f67bd9249eec37b5bf32b8dadccca38ce14d

  install -d ../build
  arch-meson ../build
  ninja -v -C ../build
}

check() {
  cd "${srcdir}"/$pkgname-$pkgver-b198f67bd9249eec37b5bf32b8dadccca38ce14d

  ninja -C ../build test
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver-b198f67bd9249eec37b5bf32b8dadccca38ce14d

  DESTDIR="${pkgdir}" ninja -C ../build install
# Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"
}
