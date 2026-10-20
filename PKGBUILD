pkgname=addwater-git
pkgver=1.3.r64.g09ca91a
pkgrel=1
pkgdesc="Installer and configuration tool for the Firefox GNOME theme (Git version)"
arch=('any')
url="https://github.com/largestgithubuseronearth/addwater"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'gtk4>=4.22'
  'libadwaita>=1.9.0'
  'libportal>=0.9.1'
  'libportal-gtk4>=0.9.1'
  'python'
  'python-gobject'
  'python-packaging'
  'python-requests'
)
makedepends=(
  'appstream'
  'desktop-file-utils'
  'gettext'
  'git'
  'glib2-devel'
  'libxml2'
  'meson'
)
provides=("addwater=${pkgver}")
conflicts=('addwater')
source=("addwater::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd addwater
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Use the current path helper after upstream removed utils.paths.
  sed -i \
    -e 's/from \.utils\.paths import LOG_DIR/from .model.paths import aw_cache_dir/' \
    -e 's/join(LOG_DIR, /join(aw_cache_dir(), "logs", /' \
    addwater/src/window.py
}

build() {
  arch-meson addwater build -Dprofile=default -Dtests=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"
}
