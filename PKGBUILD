pkgname=gedit-plugins-git
_pkgname=gedit-plugins
pkgver=3.36.2+29+g84a7d07
pkgrel=1
pkgdesc="Collection of plugins for the gedit Text Editor"
url="https://wiki.gnome.org/Apps/Gedit/ShippedPlugins"
arch=(x86_64)
license=(GPL)
depends=('gedit' 'python-dbus' 'python-cairo')
makedepends=('vte3' 'libgit2-glib' 'gucharmap' 'gobject-introspection' 'vala' 'yelp-tools'
             'appstream-glib' 'git' 'meson')
optdepends=('gucharmap: for charmap plugin'
            'vte3: for embedded terminal'
            'libgit2-glib: for git plugin')
provides=('gedit-plugins')
conflicts=('gedit-plugins')
source=("git+https://gitlab.gnome.org/GNOME/gedit-plugins.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  python -m compileall -d /usr "$pkgdir/usr"
  python -O -m compileall -d /usr "$pkgdir/usr"
}
