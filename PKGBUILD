# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=at-spi2-core-git
pkgname=(
  at-spi2-core-git
  at-spi2-core-docs-git
)
pkgver=2.51.90.r0.g977956ff9
pkgrel=1
pkgdesc="Protocol definitions and daemon for D-Bus at-spi"
url="https://gitlab.gnome.org/GNOME/at-spi2-core"
arch=(x86_64)
license=(GPL2)
depends=(
  dbus
  glib2
  gsettings-desktop-schemas
  libx11
  libxml2
  libxtst
  systemd
  xorg-xprop
  libei
  libxkbcommon
)
makedepends=(
  dbus-broker
  gi-docgen
  git
  gobject-introspection
  meson
  python-sphinx
)
checkdepends=(
  at-spi2-core
)
source=(${pkgname%-git}::"git+https://gitlab.gnome.org/GNOME/at-spi2-core.git")
b2sums=('SKIP')

pkgver() {
  cd at-spi2-core
  git describe --long | sed 's/^AT_SPI2_CORE_//;s/\([^-]*-g\)/r\1/;s/_/-/g;s/-/./g'
}

prepare() {
  cd at-spi2-core
}

build() {
  local meson_options=(
    -D default_bus=dbus-broker
    -D docs=true
  )

  arch-meson at-spi2-core build "${meson_options[@]}"
  meson compile -C build
}

check() {
  dbus-run-session meson test -C build --print-errorlogs
}

package_at-spi2-core-git() {
  optdepends=('dbus-broker: Alternative bus implementation')
  provides=(
    "${pkgname%-git}"
    "at-spi2-atk=$pkgver-$pkgrel"
    "atk=$pkgver-$pkgrel"
    libatk-1.0.so
    libatk-bridge-2.0.so
    libatspi.so
  )
  conflicts=(
    "${pkgname%-git}"
    'at-spi2-atk<=2.38.0-2'
    'atk<=2.38.0-2'
  )
  replaces=(
    'at-spi2-atk<=2.38.0-2'
    'atk<=2.38.0-2'
  )

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_at-spi2-core-docs-git() {
  pkgdesc+=" (documentation)"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
