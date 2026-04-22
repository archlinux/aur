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
pkgver=3.60.0
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with background transparency"
url="https://gitlab.gnome.org/GNOME/gnome-terminal"
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
  glib2
  glibc
  gsettings-desktop-schemas
  gtk3
  hicolor-icon-theme
  libgcc
  libhandy
  libstdc++
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
  'c9825005a583d0f6b3ee4c9bb94d45ef0102af8eb9096894a5ae42df44d0a17264da0f69153ee67b3b9d4c062ba22c8ed9466ceb558dc9f111b5ea62b2e423f3'
  'ae0c227e62ba65e6b6ba465c88f6cf5497e1de0c2af4e5e31219b56c67860f8c814802a04112159f0ddaee1f2a8216097a50ee960863bcfdc5d083f953a60c39'
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
