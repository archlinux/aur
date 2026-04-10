# Maintainer: Dan Johansen <strit@archlinux.org>
# Co-Maintainer: smiley <smiley@aur.archlinux.org>

pkgname=greetd-qtgreet
pkgver=2.0.4
pkgrel=3
pkgdesc='Qt-based greeter for greetd'
arch=('x86_64' 'aarch64')
url='https://gitlab.com/marcusbritanicus/QtGreet'
license=('GPL-3.0-only')
install="$pkgname.install"
depends=(
  'greetd'
  'qt6-base'
  'qt6-wayland'
  'dfl-applications'
  'dfl-ipc'
  'dfl-login1'
  'dfl-utils'
  'dfl-wayqt'
  'mpv'
)
makedepends=(
  'meson'
  'ninja'
  'pkgconf'
)
optdepends=(
  'cage: lightweight compositor for running qtgreet'
  'hyprland: Wayland compositor for running qtgreet'
  'labwc: lightweight wlroots compositor for running qtgreet'
  'sway: example Wayland compositor for running qtgreet'
)
conflicts=(
  'greetd-qtgreet-git'
  'greetd-qtgreet-qt5-git'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/QtGreet-v$pkgver.tar.gz"
  'greetd-config.toml'
  'sway-config'
)
sha256sums=(
  'be7ead0355f9f3ee367c70bac659569c024679f1e1306535f6b0970ff0c438fc'
  '3c2cd9dcdf57ff30b996adc1c3075197e33f944ac0f662b0cee86e728d2b925f'
  '9c3e4ba5eeaacbce65880c1f8b801a4e6a8a65816fd1f38bce31a2be8aa8a3c4'
)

_srcdir="QtGreet-v$pkgver"

build() {
  local meson_options=(
    --prefix /usr
    --buildtype plain
    -Ddynpath=/var/lib/qtgreet
  )

  meson setup build "$_srcdir" "${meson_options[@]}"
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -Dm644 "$srcdir/greetd-config.toml" \
    "$pkgdir/usr/share/doc/$pkgname/examples/greetd-config.toml"
  install -Dm644 "$srcdir/sway-config" \
    "$pkgdir/usr/share/doc/$pkgname/examples/sway-config"
}
