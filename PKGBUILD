# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=passbook-git
pkgver=0.8.r36.g750825d
pkgrel=2
pkgdesc="Password manager for GNOME"
arch=('any')
url="https://wiki.gnome.org/Apps/Passbook"
license=('GPL-3.0-or-later')
depends=(
  'gtk3'
  'libsecret'
  'python-cairo'
  'python-gobject'
)
makedepends=(
  'git'
  'gobject-introspection'
  'meson'
)
checkdepends=('appstream-glib')
optdepends=('python-pykeepass: Support for keepass files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/gnumdk/passbook.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
