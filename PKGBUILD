# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Mufeed Ali <lastweakness@tuta.io>
pkgname=dialect
pkgver=2.3.0
pkgrel=2
pkgdesc="A translation app for GNOME."
arch=('any')
url="https://apps.gnome.org/Dialect"
license=('GPL-3.0-or-later')
depends=(
  'gst-python'
  'libadwaita'
  'libsoup3'
  'python-dbus'
  'python-gobject'
  'python-gtts'
)
makedepends=('blueprint-compiler' 'git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
source=("git+https://github.com/dialect-app/dialect.git#tag=$pkgver"
        'git+https://github.com/dialect-app/po.git')
sha256sums=('da2f83db0e9ff2687600cdfd4b1b0930e0f406fce85b9dec3232f216bc3e8db3'
            'SKIP')

prepare() {
  cd "$pkgname"
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
