# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Hoàng Văn Khải <hvksmr1996 at gmail dot com>
pkgname=dialect-git
pkgver=2.2.0.r6.g9975da9
pkgrel=1
pkgdesc="A translation app for GNOME."
arch=('any')
url="https://apps.gnome.org/Dialect"
license=('GPL-3.0-or-later')
depends=('dbus-python' 'gst-python' 'libadwaita' 'libsoup3' 'python-gobject' 'python-gtts')
makedepends=('blueprint-compiler' 'git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dialect-app/dialect.git'
        'git+https://github.com/dialect-app/po.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.po.url "$srcdir/po"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
