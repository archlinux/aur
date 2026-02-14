# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
pkgbase=libmanette-git
pkgname=(
  'libmanette-git'
  'libmanette-docs-git'
)
pkgver=0.2.11.r40.g1dc2f9c
pkgrel=1
pkgdesc="Simple GObject game controller library"
arch=('x86_64')
url="https://gnome.pages.gitlab.gnome.org/libmanette"
license=('LGPL-2.1-or-later')
depends=(
  'glib2'
  'glibc'
  'gtk4'
  'hidapi'
  'libadwaita'
  'libevdev'
  'libgcc'
  'libgudev'
)
makedepends=(
  'gi-docgen'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'meson'
  'vala'
)
source=('git+https://gitlab.gnome.org/GNOME/libmanette.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase%-git}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgbase%-git}"
}

build() {
  arch-meson "${pkgbase%-git}" build -D doc=true
  meson compile -C build
}

check() {
  meson test -C build --no-rebuild --print-errorlogs
}

package_libmanette-git() {
  provides=("${pkgname%-git}" 'libmanette-1.so')
  conflicts=("${pkgname%-git}")

  meson install -C build --no-rebuild --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_libmanette-docs-git() {
  pkgdesc+=" (documentation)"
  depends=()
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  mv doc/* "$pkgdir"
}
