# Maintainer: kotontrion <kotontrion@tutanota.de>
pkgname=aylurs-gtk-shell-git
_pkgname=ags
pkgver=v1.3.0.r0.g364fde9
pkgrel=1
pkgdesc="Aylurs's Gtk Shell (AGS), An eww inspired gtk widget system."
arch=('x86_64')
url="https://github.com/Aylur/ags"
license=('GPL3')
makedepends=('git' 'meson' 'npm')
depends=('glib2' 'libpulse' 'glibc' 'typescript' 'gjs' 'gtk3' 'gtk-layer-shell' 'gobject-introspection' 'gnome-bluetooth-3.0' 'upower' 'networkmanager' 'libdbusmenu-gtk3')
conflicts=('aylurs-gtk-shell')
source=("git+${url}"
        "git+https://gitlab.gnome.org/BrainBlasted/gi-typescript-definitions#branch=nightly"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver(){
  cd $srcdir/$_pkgname
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  git submodule init
  git config submodule.gi-types.url "$srcdir/gi-typescript-definitions"
  git config submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd $srcdir/$_pkgname
  npm install
  arch-meson build
  meson compile -C build
}

package() {
  cd $srcdir/$_pkgname
  meson install -C build --destdir "$pkgdir"
}
