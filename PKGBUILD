# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-screencast-vaapi
pkgver=42.4
pkgrel=2
epoch=1
pkgdesc="Next generation desktop shell (screencast records with VAAPI)"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr gjs gnome-bluetooth-3.0 upower gnome-session gtk4
         gnome-settings-daemon gsettings-desktop-schemas libcanberra-pulse
         libgdm libsecret mutter libnma unzip libibus gnome-autoar
         gnome-disk-utility libsoup3 libgweather-4 gst-plugins-base-libs)
makedepends=(gtk-doc gnome-control-center evolution-data-server
             gobject-introspection git meson sassc asciidoc bash-completion)
checkdepends=(xorg-server-xvfb)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration'
            'gst-plugins-good: Screen recording'
            'gst-plugin-pipewire: Screen recording')
conflicts=(gnome-shell gnome-shell-debug)
provides=(gnome-shell)
groups=(gnome)
options=(debug)
_commit=ca0a1c02152a95c3c0acb39d1f328d786d0d8c87  # tags/42.4^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        screencast-vaapi.patch)
sha256sums=('SKIP'
            'SKIP'
            'd57693c0f180405d280e17dafe447924e59e19c21cdae001b6c455af4be969f7')

pkgver() {
  cd gnome-shell
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gnome-shell

  git cherry-pick -n d32c03488fcf6cdb0ca2e99b0ed6ade078460deb # https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/5585
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
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  export XDG_RUNTIME_DIR

  meson test -C build --print-errorlogs
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  depends+=(libmutter-10.so)
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 et:
