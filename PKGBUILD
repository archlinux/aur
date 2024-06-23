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
pkgver=3.52.2
pkgrel=2
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
  python-packaging
  yelp-tools
)
optdepends=(
  "libnautilus-extension: Nautilus integration"
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
  '7ca64080b3bd420b27af3c98734214e53fdeff138caf2e4edb053f95debb815f8dfdb93e9e9e06bd207d3e5d4d66a2e6cd2c798387eea18fa2fd557321f7fdf0'
  'c0cc6062750624c69faa9380ba26a7983b432b2521cf4e86967f4818a84bf19d2acb97b842664d4b0fdc640c7a61a46684645be63555adb466e60a476f44b432'
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
