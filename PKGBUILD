# Maintainer: Fernando Guevara <admin@ebadoo.com>

pkgname=ebadoo-shell-extensions
pkgver=3.34.2
pkgrel=1
pkgdesc="Extensions for EBADOO shell, including classic mode"
url="https://wiki.gnome.org/Projects/GnomeShell/Extensions"
arch=(any)
license=(GPL)
makedepends=(meson git sassc js60)
depends=(ebadoo-desktop-schemas ebadoo-shell)
optdepends=('gnome-menus: applications menu extension')
groups=(ebadoo-desktop)
conflicts=(gnome-shell-extensions)
provides=(gnome-shell-extensions gnome-shell-extensions=$pkgver)
source=("git+https://gitlab.com/ebadoo/ebadoo-shell-extensions.git"
        "git+https://gitlab.gnome.org/GNOME/gnome-shell-sass.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  git submodule init
  git config --local submodule.data/gnome-shell-sass.url "$srcdir/gnome-shell-sass"
  git submodule update
}

build() {
  arch-meson $pkgname build -D extension_set=all -D classic_mode=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
} 
