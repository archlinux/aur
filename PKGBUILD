# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bolt-git
pkgver=r537.0823d6f
pkgrel=1
pkgdesc="Thunderbolt 3 security system daemon"
arch=('i686' 'x86_64')
url="https://gitlab.freedesktop.org/bolt/bolt"
license=('LGPL')
depends=('polkit' 'systemd')
makedepends=('asciidoc' 'meson' 'git')
checkdepends=('umockdev')
conflicts=('bolt')
provides=('bolt')
source=(git+https://gitlab.freedesktop.org/bolt/bolt.git)
md5sums=('SKIP')

pkgver() {
  cd bolt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/bolt

  install -d build
  arch-meson build
  ninja -v -C build
}

check() {
  cd "${srcdir}"/bolt

  ninja -C build test
}

package() {
  cd "${srcdir}"/bolt

  DESTDIR="${pkgdir}" ninja -C build install
# Fixup mode to match polkit
  install -d -o root -g 102 -m 750 "${pkgdir}/usr/share/polkit-1/rules.d"
}
