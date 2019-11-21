# $Id$
# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

basename=gnome-shell
pkgname=$basename-xrdesktop-git
pkgver=3.34.1
pkgrel=1
conflicts=($basename)
pkgdesc="The next generation GNOME Shell - with patches for xrdesktop."
url="https://gitlab.freedesktop.org/xrdesktop"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gnome-settings-daemon
         gnome-themes-extra gsettings-desktop-schemas libcanberra-pulse libcroco libgdm libsecret
         mutter nm-connection-editor unzip gstreamer libibus xrdesktop-git libinputsynth-git)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc vulkan-headers asciidoc)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell=$pkgver)
source=($basename::"git+https://gitlab.freedesktop.org/xrdesktop/gnome-shell.git#branch=3.34.1-xrdesktop"
        "git+https://git.gnome.org/browse/libgnome-volume-control")

sha256sums=('SKIP'
            'SKIP')
options=('debug' '!strip')

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
  arch-meson $basename build -D gtk_doc=true --buildtype=debug
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install

  # Must exist; FS#37412
  mkdir "$pkgdir/usr/share/gnome-shell/modes"
}
