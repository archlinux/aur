# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=gsp-alpm-git
pkgver=0.2.0.r17.g424bd72
pkgrel=1
pkgdesc='GNOME Software plugin for the packages of Arch Linux, through alpm-dbus'
arch=('x86_64')
url='https://gitlab.archlinux.org/ogarcia/gsp-alpm'
license=('GPL-2.0-or-later')
depends=('alpm-dbus' 'archlinux-appstream-data' 'glib2' 'glibc' 'gnome-software' 'libarchive' 'pacman' 'libalpm.so')
makedepends=('git' 'meson')
provides=('gsp-alpm')
conflicts=('gsp-alpm')
source=('gsp-alpm::git+https://gitlab.archlinux.org/ogarcia/gsp-alpm.git')
sha256sums=('SKIP')

pkgver() {
  cd gsp-alpm
  printf '%s.r%s.%s' "$(git describe --tags --abbrev=0 2>/dev/null || echo 0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson gsp-alpm build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" gsp-alpm/README.md
}
