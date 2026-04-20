# Maintainer: sfs sfslinux@gmail.com

pkgname=libsni-exporter-git
_upstream_name=libsni-exporter
pkgver=0.2.0.r3.g4d82354
pkgrel=1
pkgdesc='Lightweight GLib/GIO StatusNotifierItem/dbusmenu exporter as an alternative to libayatana-appindicator'
arch=('x86_64')
url='https://github.com/sfs-pra/libsni-exporter'
license=('MIT')
depends=('glib2')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'dbus')
provides=('libsni-exporter')
conflicts=('libsni-exporter')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_upstream_name}"

  local ver rev hash
  ver=$(sed -nE "s/^[[:space:]]*version:[[:space:]]*'([^']+)'.*/\1/p" meson.build | head -n1)
  rev=$(git rev-list --count HEAD)
  hash=$(git rev-parse --short HEAD)

  printf '%s.r%s.g%s' "${ver:-0.0.0}" "$rev" "$hash"
}

build() {
  cd "$srcdir/${_upstream_name}"
  meson setup build --prefix=/usr --buildtype=release --wrap-mode=nodownload
  meson compile -C build
}

check() {
  cd "$srcdir/${_upstream_name}"
  meson test -C build --print-errorlogs
}

package() {
  cd "$srcdir/${_upstream_name}"
  DESTDIR="$pkgdir" meson install -C build
}
