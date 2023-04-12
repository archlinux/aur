# Maintainer: parcimonic <aur-at_parcimonic-dot_me>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgbase=mutter-auto-rotation
pkgname=mutter-auto-rotation
provides=(libmutter-11.so mutter)
conflicts=(mutter)
pkgver=43.4
pkgrel=1
pkgdesc="Window manager and compositor for GNOME, with touch-mode auto-rotation (reverts MR 1710)"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(
  colord
  dconf
  gnome-desktop
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
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
  meson
  sysprof
  wayland-protocols
  xorg-server
  xorg-server-xvfb
)
_commit=0e7506ff6d8e4940fc6654f2711e5decb23440dc  # tags/43.4^0

source=(
  "git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
  "0001-Revert-backends-native-Disable-touch-mode-with-point.patch"
)

sha256sums=(
  'SKIP'
  'b11e3e1c9a14b9d9a3941e4495f7f16cfe84c53c6b8e571df049546840a91a46'
)

pkgver() {
  cd mutter
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd mutter

  # Fix crash on resume from suspend
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/2570
  git cherry-pick -n c1ab3f39d73a041b488acf7296456840fa83c0da

  git apply ../0001-Revert-backends-native-Disable-touch-mode-with-point.patch
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D docs=true \
    -D installed_tests=false
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

_check_disabled() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
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

package() {
  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

# vim:set sw=2 sts=-1 et:
