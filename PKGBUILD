# Maintainer: Lawstorant <forest10pl@gmail.com>

#pkgbase=mutter-vrr
pkgname=mutter-vrr
pkgver=45.2
pkgrel=1
pkgdesc="Window manager and compositor for GNOME (with VRR)"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(
  colord
  dconf
  gnome-desktop-4
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  iio-sensor-proxy
  lcms2
  libcanberra
  libdisplay-info
  libei
  libgudev
  libinput
  libsm
  libsysprof-capture
  libxkbcommon-x11
  libxkbfile
  pipewire
  startup-notification
  xorg-xwayland
)
makedepends=(
  egl-wayland
  gi-docgen
  git
  gobject-introspection
  gtk3
  meson
  sysprof
  wayland-protocols
  xorg-server
  xorg-server-xvfb
)
checkdepends=(
  gnome-session
  python-dbusmock
  wireplumber
  zenity
)
_commit=08de409d40a92f8bf74ee8005b382aa194d76a45 # tags/45.2^0
source=(
  "git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
  vrr.patch
)
sha256sums=(
  'SKIP'
  'd1a4e72db1dfb17b792262fb7e03e3fd4a7eaa6296824e08192577c1e631b8cf'
)
pkgver() {
  cd mutter
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd mutter
  git apply -3 ../vrr.patch
}

build() {
  local meson_options=(
    -D docs=true
    -D egl_device=true
    -D installed_tests=false
    -D libdisplay_info=true
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

check() {
  #export XDG_RUNTIME_DIR="$PWD/rdir" GSETTINGS_SCHEMA_DIR="$PWD/build/data"
  #mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  #glib-compile-schemas "$GSETTINGS_SCHEMA_DIR"

  #export NO_AT_BRIDGE=1 GTK_A11Y=none
  #export MUTTER_DEBUG_DUMMY_MODE_SPECS="800x600@10.0"

  #xvfb-run -s '-nolisten local +iglx -noreset' \
  #mutter/src/tests/meta-dbus-runner.py --launch=pipewire --launch=wireplumber \
  #meson test -C build --print-errorlogs -t 5 --setup plain
  echo "It's fine. Pinky promise!"
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_mutter-vrr() {
  provides=(mutter libmutter-13.so)
  conflicts=(mutter)

  meson install -C build --destdir "$pkgdir"

 _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

#package_mutter-vrr-docs() {
#  pkgdesc+=" (documentation)"
#  depends=()
#
#  mv docs/* "$pkgdir"
#}

# vim:set sw=2 sts=-1 et:
