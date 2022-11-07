# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-screencast-vaapi
pkgver=43.1
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell (screencast records with VAAPI)"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr-4 gjs upower gnome-session gtk4
         gnome-settings-daemon gsettings-desktop-schemas libcanberra-pulse
         libgdm libsecret mutter libnma unzip libibus gnome-autoar
         gnome-disk-utility libsoup3 libgweather-4 gst-plugins-base-libs)
makedepends=(gtk-doc gnome-control-center evolution-data-server
             gobject-introspection git 'meson>=0.64' sassc asciidoc bash-completion)
checkdepends=(xorg-server-xvfb)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration'
            'gst-plugins-good: Screen recording'
            'gst-plugin-pipewire: Screen recording'
            'gnome-bluetooth-3.0: Bluetooth support'
            'power-profiles-daemon: Power profile switching')
conflicts=(gnome-shell gnome-shell-debug)
provides=(gnome-shell)
groups=(gnome)
options=(debug)
_commit=8b00255cc31814b09a35c9be38228d873676233e  # tags/43.1^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        screencast-vaapi.patch)
sha256sums=('SKIP'
            'SKIP'
            'c52281a39041cfd961b7347f6e4a76244e294fe2f8a442df1aaf8453e91149ea')

pkgver() {
  cd gnome-shell
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gnome-shell

  patch -p1 < ../../screencast-vaapi.patch
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

_check() (
  export XDG_RUNTIME_DIR="$PWD/runtime-dir"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"

  meson test -C build --print-errorlogs
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  depends+=(libmutter-11.so)
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
