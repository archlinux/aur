# Maintainer: sfs sfslinux@gmail.com

pkgname=wl-kbd-git
_upstream_name=wl-kbd
pkgver=0.1.0.r2.g2041ff7
pkgrel=1
pkgdesc='Wayland keyboard layout indicator with SNI tray icon'
arch=('x86_64')
url='https://github.com/sfs-pra/wl-kbd'
license=('MIT')
depends=('glib2' 'cairo' 'pango' 'wayland' 'libxkbcommon' 'libsni-exporter' 'wl-kbd-assets')
makedepends=('git' 'meson' 'ninja' 'pkgconf' 'gettext' 'dbus')
optdepends=('wl-kbd-config: keyboard settings GUI (launched from tray menu)')
provides=('wl-kbd')
conflicts=('wl-kbd')
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
