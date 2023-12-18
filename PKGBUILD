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
pkgver=3.50.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=(
  gsettings-desktop-schemas
  libhandy
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
  '70bc220b9090b61a41048f5b8ee3e4d91b41884b677eb597abb8392f5742a53ab847112ab63ef96577bf615b7d44cc37bb508ed420d08f7c282ee75613ae466b'
  '93132b1fce4a54e3b35ddb5549acbba17f69431c77a8dd1ea3148a9fd91bc3e56b5455e32c45af9bed430ea87e45aa5d5e8d62155c7dd08f1af1af044084a101'
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
