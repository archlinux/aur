# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-tweaks-system-menu-git
_uuid=tweaks-system-menu@extensions.gnome-shell.fifi.org
pkgver=24.r0.g6dd8228
pkgrel=1
pkgdesc="GNOME Shell Extension to put Gnome Tweaks in the system menu."
arch=('any')
url="https://github.com/F-i-f/tweaks-system-menu"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/F-i-f/tweaks-system-menu.git'
        'git+https://github.com/F-i-f/meson-gse.git')
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd tweaks-system-menu
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd tweaks-system-menu
  git submodule init
  git config submodule.meson-gse.url "$srcdir/meson-gse"
  git -c protocol.file.allow=always submodule update

  sed -i "s/home + '\/.local/'\/usr/g" meson.build meson-gse/meson.build.m4
}

build() {
  arch-meson tweaks-system-menu build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  cd tweaks-system-menu
  install -Dm644 "schemas/org.gnome.shell.extensions.tweaks-system-menu.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  rm -r "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
