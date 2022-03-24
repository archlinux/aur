# Maintainer: Lubosz Sarnecki <lubosz.sarnecki@collabora.com>
# Maintainer: Christoph Haag <christoph.haag@collabora.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

basename=gnome-shell
pkgname=$basename-xrdesktop-git
pkgver=41.5
pkgrel=1
epoch=1
conflicts=($basename)
pkgdesc="Next generation desktop shell - with patches for xrdesktop."
url="https://gitlab.freedesktop.org/xrdesktop"
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gtk4
         gnome-settings-daemon gnome-themes-extra gsettings-desktop-schemas
         libcanberra-pulse libgdm libsecret mutter nm-connection-editor unzip
         gstreamer libibus gnome-autoar gnome-disk-utility gst-plugin-pipewire
         xrdesktop-git libinputsynth-git)
makedepends=(gtk-doc gnome-control-center evolution-data-server
             gobject-introspection git meson sassc asciidoc bash-completion)
checkdepends=(xorg-server-xvfb)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
provides=(gnome-shell=$pkgver)
install=gnome-shell.install
source=("git+https://gitlab.freedesktop.org/xrdesktop/gnome-shell.git#branch=41.5-xrdesktop"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        # https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/2078
        "https://gitlab.gnome.org/GNOME/gnome-shell/-/commit/65450a836ee9e0722a2d4c3327f52345eae293c6.patch")
sha256sums=('SKIP'
            'SKIP'
            '9ccd84e3996568cdfd76d23e00954665898848da84b91f1936d5aee723b18ead')

pkgver() {
  cd $basename
  grep -Po "(?<=^  version: ')((\d+\.)+\d+)" meson.build
}

prepare() {
  cd $basename

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update

  git am -3 --no-commit "$srcdir/65450a836ee9e0722a2d4c3327f52345eae293c6.patch"
}

build() {
  arch-meson $basename build -D gtk_doc=true --buildtype=release
  meson compile -C build
}

package() {
  depends+=(libmutter-9.so)
  meson install -C build --destdir "$pkgdir"
}
