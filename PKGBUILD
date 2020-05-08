# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gedit-git
pkgver=3.37.1.r60.g3385da8ee
pkgrel=1
pkgdesc="GNOME Text Editor"
url="https://wiki.gnome.org/Apps/Gedit"
arch=(i686 x86_64 armv7h aarch64)
license=(GPL)
depends=(gtksourceview4 gsettings-desktop-schemas libpeas gspell python-gobject dconf 'tepl>5.0.0')
makedepends=(yelp-tools vala gobject-introspection git gtk-doc meson)
optdepends=('gedit-plugins: Additional features')
provides=(gedit)
conflicts=(gedit)
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
  arch-meson gedit build -D gtk_doc=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
