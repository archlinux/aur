# Contributor: Andrew Querol <andrew@querol.me>
# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

_name=gnome-browser-connector
pkgname=$_name-git
pkgver=42rc.r656.101c501
pkgrel=1
pkgdesc='Native browser connector for integration with extensions.gnome.org'
arch=(any)
url="https://wiki.gnome.org/Projects/GnomeShellIntegration"
license=(GPL3)
depends=(gnome-shell python-gobject)
makedepends=(meson git)
provides=(chrome-gnome-shell $_name)
replaces=(chrome-gnome-shell gs-chrome-connector)
conflicts=(chrome-gnome-shell gs-chrome-connector $_name)
source=(git+https://gitlab.gnome.org/nE0sIghT/$_name.git)
md5sums=('SKIP')

pkgver() {
  cd $_name
  #git describe | sed 's/^v//;s/-/+/g' 2> /dev/null
  printf "%s.r%s.%s" \
  	"$(python3 -c 'from gnome_browser_connector.version import __version__; print(__version__, end="");' | sed 's|\.||')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_name
}

build() {
  arch-meson $_name build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install --destdir="$pkgdir" -C build
}
