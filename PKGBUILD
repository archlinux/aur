# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-tweaks-system-menu-git
_gitname=tweaks-system-menu
pkgver=16.r10.g997e071
pkgrel=1
pkgdesc="GNOME Shell Extension to put Gnome Tweaks in the system menu."
arch=('any')
url="https://github.com/F-i-f/tweaks-system-menu"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/F-i-f/tweaks-system-menu.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  sed -i "s/home + '\/.local/'\/usr/g" meson.build meson-gse/meson.build.m4
}

build() {
  arch-meson "$_gitname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  _uuid="${_gitname}@extensions.gnome-shell.fifi.org"

  cd "$srcdir/$_gitname"
  install -Dm644 "schemas/org.gnome.shell.extensions.$_gitname.gschema.xml" -t \
    "$pkgdir/usr/share/glib-2.0/schemas"

  rm -rf "$pkdgir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
