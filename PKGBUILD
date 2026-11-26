# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonplus
pkgver=0.6.9
pkgrel=1
pkgdesc="A modern compatibility tools manager"
arch=('x86_64' 'aarch64')
url="https://protonplus.vysp3r.com"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'json-glib'
  'libadwaita'
  'libarchive'
  'libgee'
  'libnotify'
  'libsoup3'
  'libyaml'
  'sdl3'
  'which'
)
makedepends=(
  'meson'
  'vala'
)
checkdepends=(
  'appstream'
  # 'dbus'
  'desktop-file-utils'
  # 'ttf-dejavu'
  # 'xorg-server-xvfb'
  # 'xorg-xauth'
)
optdepends=(
  'gamemode'
  'gamescope'
  'mangohud'
  'proton-autogen'
  'protontricks'
  'scopebuddy'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Vysp3r/ProtonPlus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d259e6f5ee04d20bf2adb80a0d1207a9b5dd9b77a1f7bbf8c0042535942f6583')

build() {
  arch-meson "ProtonPlus-$pkgver" build
  meson compile -C build
}

check() {

  # Unit tests cannot be run in chroot
  local meson_tests=(
    'Validate desktop file'
    'Validate appstream file'
    'Validate schema file'
  )
  meson test -C build "${meson_tests[@]}" --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
