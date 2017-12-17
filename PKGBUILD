# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bolt-git
pkgver=r307.eb63510
pkgrel=1
pkgdesc="Thunderbolt 3 security system daemon"
arch=('i686' 'x86_64')
url="https://github.com/gicmo/bolt"
license=('LGPL')
depends=('polkit' 'systemd')
makedepends=('asciidoc' 'meson' 'git')
checkdepends=('umockdev')
conflicts=('bolt')
provides=('bolt')
source=(git+https://github.com/gicmo/bolt.git)
md5sums=('SKIP')

pkgver() {
  cd bolt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"

  install -d build
  arch-meson bolt build
  ninja -v -C build
}

check() {
  cd "${srcdir}"

  ninja -C build test
}

package() {
  cd "${srcdir}"

  DESTDIR="${pkgdir}" ninja -C build install
# Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"
}
