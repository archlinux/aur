# $Id$
# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

basename=gnome-shell
pkgname=$basename-xrdesktop-git
pkgver=3.36.0
pkgrel=1
conflicts=($basename)
pkgdesc="The next generation GNOME Shell - with patches for xrdesktop."
url="https://gitlab.freedesktop.org/xrdesktop"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gjs gnome-bluetooth gnome-session gnome-themes-extra libgdm
         mutter nm-connection-editor unzip xrdesktop-git libinputsynth-git gnome-autoar evolution-data-server python)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc vulkan-headers asciidoc)
optdepends=('gnome-control-center: System settings')
groups=(gnome)
provides=(gnome-shell=$pkgver)
source=($basename::"git+https://gitlab.freedesktop.org/xrdesktop/gnome-shell.git#branch=3.36.0-xrdesktop"
        "git+https://git.gnome.org/browse/libgnome-volume-control")

sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $basename
  grep -Po "(?<=^  version: ')((\d+\.)+\d+)" meson.build
}

prepare() {
  cd $basename

  # Move the plugin to our custom epiphany-only dir
  sed -i "s/'mozilla'/'epiphany'/g" meson.build

  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
}
  
build() {
  arch-meson $basename build -D gtk_doc=true --buildtype=release
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # Must exist; FS#37412
  mkdir "$pkgdir/usr/share/gnome-shell/modes"
}
