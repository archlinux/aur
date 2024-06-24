# Maintainer: Campbell Jones <arch at serebit dot com>

pkgname='budgie-screenshot-applet'
pkgver='0.4.3.r0.gd92b06c'
pkgrel='4'
pkgdesc='A Budgie applet for taking and uploading screenshots to Imgur and Imagebin.'
arch=('i686' 'x86_64')
url="https://github.com/cybre/${pkgname}"
license=('GPL-2.0-or-later')
depends=('libpeas' 'budgie-desktop' 'libsoup' 'json-glib' 'gnome-desktop' 'graphviz')
makedepends=('git' 'intltool' 'meson' 'ninja' 'vala' 'gobject-introspection')
source=("$pkgname"::"git+https://github.com/cybre/budgie-screenshot-applet.git#tag=v${pkgver:0:5}")
sha256sums=('SKIP')
changelog='CHANGELOG'

pkgver () {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//g'
}

prepare () {
  cd "$pkgname"

  git cherry-pick -n 1886d97 # Fix GTK+3.24 compilation issues
  git cherry-pick -n 0e0c582 # Fixes compilation errors with Vala 0.44
}

build () {
  arch-meson "$pkgname" build
  meson compile -C build
}

package () {
  meson install -C build --destdir "$pkgdir"
}
