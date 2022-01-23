# Maintainer: Peter Weber <peter.weber@mailbox.org>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Fernando Fernandez <fernando@softwareperonista.com.ar>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# upstream patches:
# https://src.fedoraproject.org/cgit/rpms/gnome-terminal.git
# https://github.com/debarshiray/gnome-terminal

pkgname=gnome-terminal-transparency
_pkgname=gnome-terminal
pkgver=3.42.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator with background transparency"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=('vte3>=0.66.0' gsettings-desktop-schemas)
makedepends=(docbook-xsl libnautilus-extension gnome-shell yelp-tools meson)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
groups=(gnome)
changelog=package.changelog
source=(https://download.gnome.org/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
        transparency.patch
		build_fix_for_newer_meson.patch)
sha256sums=('8a9c8e5ef7a3a73b246a947e1190bb08ec98935af860cf0b3aa2fbf4606817a0'
            '54dd17bdfacee0b7da5ddb2628eae3d5d2bb931ed5666faa7af8fd6cba1c5ea1'
            '47ef721df168ba3e7e451df0669b01bec2ce3d553d4e59dcfb10462215470ba2')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../transparency.patch
  patch -Np1 -i ../build_fix_for_newer_meson.patch
}

build() {
  arch-meson $_pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
