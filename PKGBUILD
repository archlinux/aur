# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-tweaks-system-menu-git
_uuid=tweaks-system-menu@extensions.gnome-shell.fifi.org
pkgver=18.r11.g70dface
pkgrel=1
pkgdesc="GNOME Shell Extension to put Gnome Tweaks in the system menu."
arch=('any')
url="https://github.com/F-i-f/tweaks-system-menu"
license=('GPL-3.0-or-later')
depends=('gnome-shell<=1:44.6')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/F-i-f/tweaks-system-menu.git')
sha256sums=('SKIP')

pkgver() {
  cd tweaks-system-menu
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd tweaks-system-menu
  sed -i "s/home + '\/.local/'\/usr/g" meson.build meson-gse/meson.build.m4
}

build() {
  arch-meson tweaks-system-menu build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd tweaks-system-menu
  install -Dm644 "schemas/org.gnome.shell.extensions.tweaks-system-menu.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas"
}
