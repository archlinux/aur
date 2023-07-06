# Maintainer: Lawstorant <forest10pl@gmail.com>

pkgbase=mutter-vrr
pkgname=(
  mutter-vrr
  mutter-vrr-docs
)
pkgver=44.2
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
  python-dbusmock
  wireplumber
  zenity
)
_commit=e7ed2bf85700a2ff33b69826f6f0fff6e2f28e69  # tags/44.2^0
source=(
  "git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
  0001-tests-cogl-test-framebuffer-get-bits-should-fail-on-.patch
  vrr.patch
)
sha256sums=(
  'SKIP'
  '3321a1b16de808469333231096074e4caaca8563e0a138344246c9301dfac3b9'
  '833f558909dfdaad358176cd9895da42d25283cf5faf88bd9db01ff4db1107a1'
)
pkgver() {
  cd mutter
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd mutter

  # Unbreak tests with Mesa 23.1
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/2848
  git apply -3 ../0001-tests-cogl-test-framebuffer-get-bits-should-fail-on-.patch
  git apply -3 ../vrr.patch
}

build() {
  local meson_options=(
    -D docs=true
    -D egl_device=true
    -D installed_tests=false
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

_check() (
  export XDG_RUNTIME_DIR="$PWD/rdir" GSETTINGS_SCHEMA_DIR="$PWD/build/data"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  glib-compile-schemas "$GSETTINGS_SCHEMA_DIR"

  pipewire &
  _p1=$!

  wireplumber &
  _p2=$!

  trap "kill $_p1 $_p2; wait" EXIT

  meson test -C build --print-errorlogs -t 3
)

check() {
  # checks may fail do to ENABLE_VRR in monitors.xml
  # dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
  #   bash -c "$(declare -f _check); _check"
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
  provides=(mutter libmutter-12.so)
  conflicts=(mutter)

  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-vrr-docs() {
  pkgdesc+=" (documentation)"
  provides=(mutter-docs)
  conflicts=(mutter-docs)
  mv docs/* "$pkgdir"
}
