# Maintainer:  Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# upstream patches:
# https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git
# https://github.com/debarshiray/gnome-terminal

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.58.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(
  # Program
  GPL-3.0-or-later

  # Documentation
  CC-BY-SA-3.0
  GPL-3.0-only

  # Appstream-data
  GFDL-1.3-only
)
depends=(
  cairo
  dconf
  gcc-libs
  glib2
  glibc
  gsettings-desktop-schemas
  gtk3
  hicolor-icon-theme
  libhandy
  libx11
  pango
  util-linux-libs
  vte3
)
makedepends=(
  docbook-xsl
  glib2-devel
  gnome-shell
  libnautilus-extension
  meson
  yelp-tools
)
optdepends=(
  "libnautilus-extension: Nautilus integration"
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
changelog=package.changelog
source=(
  https://gitlab.gnome.org/GNOME/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz
  transparency.patch
)
b2sums=(
  'd96fb761a3f44b1c5783c8a2faa2d40a2a297d4d7c0de1d8518eeff7a0368d482095799fc3b8d51ca67bd4a7c07a32f6cfee809c137942af3b75f4dbe96f5b0f'
  'c246f80cc86a2ce1817eb67ae3506dfdc1925a19212159cc6b4ec85a1c80deecf1fc0be186925641266494c60fb5bc4ae44d67eb703a9ab54d0b4de799182ccf'
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
