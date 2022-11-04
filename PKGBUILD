# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

basename=gnome-shell
pkgname=$basename-xrdesktop-git
pkgver=43.0
pkgrel=1
epoch=1
conflicts=($basename)
pkgdesc="Next generation desktop shell - with patches for xrdesktop."
url="https://gitlab.freedesktop.org/xrdesktop"
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr-4 gjs upower gnome-session gtk4
         gnome-settings-daemon gsettings-desktop-schemas libcanberra-pulse
         libgdm libsecret mutter libnma unzip libibus gnome-autoar
         gnome-disk-utility libsoup3 libgweather-4 xrdesktop-git libinputsynth-git)
makedepends=(gtk-doc gnome-control-center evolution-data-server
             gobject-introspection git meson sassc asciidoc bash-completion)
checkdepends=(xorg-server-xvfb)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration'
            'gst-plugins-good: Screen recording'
            'gst-plugin-pipewire: Screen recording'
            'gnome-bluetooth-3.0: Bluetooth support')
groups=(gnome)
provides=(gnome-shell=$pkgver)
options=(debug)
_branch="43.0-xrdesktop"  # tags/43.0^0
source=("git+https://gitlab.freedesktop.org/xrdesktop/gnome-shell.git#branch=${_branch}"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gnome-shell
  grep -Po "(?<=^  version: ')((\d+\.)+\d+)" meson.build
}

prepare() {
  cd gnome-shell

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson gnome-shell build -D gtk_doc=true
  meson compile -C build
}

package() {
  depends+=(libmutter-11.so)
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

