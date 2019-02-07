# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gedit-git
pkgver=3.31.90.r8.g1a527b41e
pkgrel=1
pkgdesc="GNOME Text Editor"
url="https://wiki.gnome.org/Apps/Gedit"
arch=(x86_64)
license=(GPL)
depends=(gtksourceview4 libpeas gspell python-gobject)
makedepends=(yelp-tools intltool vala gobject-introspection gnome-common git gtk-doc)
provides=(gedit)
conflicts=(gedit)
optdepends=('gedit-plugins: Additional features')
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gedit.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gedit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd gedit

  git submodule init
  git config --local submodule.libgd.url "$srcdir/libgd"
  git submodule update
}

build() {
  arch-meson gedit build -Ddocumentation=true
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
