# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Mufeed Ali <lastweakness@tuta.io>
pkgname=dialect
pkgver=1.4.1
pkgrel=3
pkgdesc="A translation app for GNOME."
arch=('any')
url="https://apps.gnome.org/app/com.github.gi_lom.dialect"
license=('GPL3')
depends=('gst-python' 'gtk3' 'libhandy' 'python-gobject' 'python-googletrans'
         'python-gtts' 'python-httpx')
makedepends=('git' 'gobject-introspection' 'meson')
checkdepends=('appstream-glib')
_commit=1a05970e43b4effe5239da8e6ad21078b99200a8
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
  git config submodule.po.url $srcdir/po
  git submodule update
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
