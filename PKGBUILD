# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-screencast-vaapi
_pkgname=gnome-shell
pkgver=44.1
pkgrel=3
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL)
depends=(
  accountsservice
  gcr-4
  gjs
  gnome-autoar
  gnome-session
  gnome-settings-daemon
  gsettings-desktop-schemas
  gtk4
  libadwaita
  libcanberra-pulse
  libgdm
  libgweather-4
  libibus
  libnma-gtk4
  libsecret
  libsoup3
  mutter
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
  'switcheroo-control: Multi-GPU support'
)
conflicts=(gnome-shell gnome-shell-debug)
provides=(gnome-shell)
groups=(gnome)
_commit=b0ca64e7775225b7c5d049571a44ef40bf516406  # tags/44.1^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "screencast-vaapi.patch"
)
b2sums=('SKIP'
        'SKIP'
        'bb2bba3fe590fddeca09d34df89871b0ba41f443e0c7ba22091f1a4b41eb80fd3e8d77b75d9e6dfa2e062e27f20741be2448e58447a30940fbb1ab6ea2e26ad2')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  patch -p1 < ../../screencast-vaapi.patch
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

  meson test -C build --print-errorlogs -t 3
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  depends+=(libmutter-12.so)
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
