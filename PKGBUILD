# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Fabian Bornschein <fabiscafe-at-mailbox-dot-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-screencast-vaapi
_pkgname=gnome-shell
pkgver=45.4
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  accountsservice
  at-spi2-core
  bash
  cairo
  dconf
  gcc-libs
  gcr-4
  gdk-pixbuf2
  gjs
  glib2
  glibc
  gnome-autoar
  gnome-desktop-4
  gnome-session
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  gtk4
  hicolor-icon-theme
  json-glib
  libadwaita
  libcanberra-pulse
  libgdm
  libgirepository
  libglvnd
  libgweather-4
  libibus
  libical
  libnm
  libnma-gtk4
  libpipewire
  libpulse
  libsecret
  libsoup3
  libx11
  libxfixes
  mutter
  pango
  polkit
  systemd-libs
  unzip
  upower
)
makedepends=(
  asciidoc
  bash-completion
  evolution-data-server
  git
  gnome-control-center
  gobject-introspection
  gtk-doc
  meson
  sassc
)
checkdepends=(
  appstream-glib
  python-dbusmock
  xorg-server-xvfb
)
optdepends=(
  'evolution-data-server: Evolution calendar integration'
  'gnome-bluetooth-3.0: Bluetooth support'
  'gnome-control-center: System settings'
  'gnome-disk-utility: Mount with keyfiles'
  'gst-plugin-pipewire: Screen recording'
  'gst-plugins-good: Screen recording'
  'power-profiles-daemon: Power profile switching'
  'python-gobject: gnome-shell-test-tool performance tester'
  'python-simplejson: gnome-shell-test-tool performance tester'
  'switcheroo-control: Multi-GPU support'
)
conflicts=(gnome-shell gnome-shell-debug)
provides=(gnome-shell)
groups=(gnome)
_commit=58522920b5ae96d2b95dad0371ce13eb4bd955ce  # tags/45.4^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  screencast-vaapi.patch
  0001-subprojects-gvc-Bump-gvc-submodule-to-newest-commit.patch
)
b2sums=('SKIP'
        'SKIP'
        'bb2bba3fe590fddeca09d34df89871b0ba41f443e0c7ba22091f1a4b41eb80fd3e8d77b75d9e6dfa2e062e27f20741be2448e58447a30940fbb1ab6ea2e26ad2'
        'ee7b40aefdf751feaa661de6d0aed28efcd282250f41b25b6c0413bd75503bb2cd5413fce96d33336206448a777be04b701a4465e38c799e91328fb4197d011b')

pkgver() {
  cd $_pkgname
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # Update libgnome-volume-control
  # https://gitlab.archlinux.org/archlinux/packaging/packages/gnome-shell/-/issues/3
  git apply -3 ../0001-subprojects-gvc-Bump-gvc-submodule-to-newest-commit.patch

  patch -p1 < $srcdir/screencast-vaapi.patch
  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  local meson_options=(
    -D gtk_doc=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

_check() (
  export XDG_RUNTIME_DIR="$PWD/rdir"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"

  export NO_AT_BRIDGE=1 GTK_A11Y=none

  meson test -C build --print-errorlogs -t 3
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  depends+=(libmutter-13.so)
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
