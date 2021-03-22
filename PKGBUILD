# $Id$
# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

basename=gnome-shell
pkgname=$basename-xrdesktop-git
pkgver=3.38.4
pkgrel=1
epoch=1
conflicts=($basename)
pkgdesc="Next generation desktop shell - with patches for xrdesktop."
url="https://gitlab.freedesktop.org/xrdesktop"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session
         gnome-settings-daemon gnome-themes-extra gsettings-desktop-schemas
         libcanberra-pulse libgdm libsecret mutter nm-connection-editor unzip
         gstreamer libibus gnome-autoar gnome-disk-utility gst-plugin-pipewire
         xrdesktop-git libinputsynth-git)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc asciidoc bash-completion)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
install=gnome-shell.install
provides=(gnome-shell=$pkgver)
source=($basename::"git+https://gitlab.freedesktop.org/xrdesktop/gnome-shell.git#branch=3.38.4-xrdesktop"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
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
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update
}
  
build() {
  arch-meson $basename build -D gtk_doc=true --libdir="lib"
  meson compile -C build
}

package() {
  depends+=(libmutter-7.so)
  DESTDIR="$pkgdir" meson install -C build
}
