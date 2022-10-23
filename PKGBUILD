# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mufeed Ali <lastweakness@tuta.io>
pkgname=dialect
pkgver=2.1.1
pkgrel=1
pkgdesc="A translation app for GNOME."
arch=('any')
url="https://apps.gnome.org/app/com.github.gi_lom.dialect"
license=('GPL3')
depends=('dbus-python' 'gst-python' 'libadwaita' 'libsoup3' 'python-gobject' 'python-gtts')
makedepends=('blueprint-compiler' 'git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
_commit=23fb32d1eb538c9a56360fa24b5db06d85234fb1  #tags/2.1.1^0
source=("git+https://github.com/dialect-app/dialect.git#commit=$_commit"
        'git+https://github.com/dialect-app/po.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule init
  git config submodule.po.url "$srcdir/po"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
