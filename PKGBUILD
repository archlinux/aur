# Maintainer: kotontrion <kotontrion@tutanota.de>

pkgname=libastal-powerprofiles-git
_pkgname=powerprofiles
pkgver=r785.4e455bb
pkgrel=1
provides=(astal-power-profiles libastal-power-profiles libastal-power-profiles.so=0-64)
pkgdesc="Library and cli to control upowerd powerprofiles"
arch=(x86_64)
license=(LGPL-2.1-only)
url="https://github.com/Aylur/astal"
depends=(
  glib2
  glibc
  json-glib
)
makedepends=(
  meson
  git
  gobject-introspection
  vala
)
groups=("libastal")
source=("git+${url}.git" "skip_valadoc.patch")
sha256sums=('SKIP'
            '9b1927662393f1bc6aeae81bb4d48a60ac0180b7ebd5f9d7a489db3621895be3')

pkgver() {
  cd astal
  #git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd astal 
    patch -Np1 -i ../skip_valadoc.patch
}


build() {
  cd astal/lib/$_pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd astal/lib/$_pkgname
  meson install -C build --destdir "$pkgdir"
}

