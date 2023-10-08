# Maintainer:  Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# upstream patches:
# https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git
# https://github.com/debarshiray/gnome-terminal

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.48.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=(
  gsettings-desktop-schemas
  vte3
)
makedepends=(
  docbook-xsl
  gnome-shell
  libnautilus-extension
  meson
  yelp-tools
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
groups=(gnome-extra)
changelog=package.changelog
source=(
  https://gitlab.gnome.org/GNOME/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz
  transparency.patch
)
b2sums=(
  '2963043dba454f6927608c99513c38b33ef3a6cb733f420d477eda14abe571defe5c095461e6e0a195e4023a8a21b9c225a084a2b78b3cccd80a1f4ffa33866c'
  'da7f04a25f16fd9745d65c9b008d80f9f52ab1282eb8d49f7999997a0977f96c3f361b8af00b8109e5d096aef33d34f071891aab461e360e9ef2f32292e88c43'
)

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../transparency.patch
}

build() {
  local meson_options=(
    -D b_lto=false
  )

  arch-meson $_pkgname-$pkgver build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
