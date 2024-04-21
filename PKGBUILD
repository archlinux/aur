# Maintainer: Joakim Soderlund <joakim.soderlund@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgbase=mutter-dynamic-buffering
pkgname=(mutter-dynamic-buffering)
pkgver=46.1
pkgrel=1
pkgdesc="Window manager and compositor for GNOME (with dynamic triple/double buffering)"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  colord
  dconf
  fontconfig
  fribidi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop-4
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  gtk4
  harfbuzz
  iio-sensor-proxy
  lcms2
  libcanberra
  libcolord
  libdisplay-info
  libdrm
  libei
  libglvnd
  libgudev
  libice
  libinput
  libpipewire
  libsm
  libsysprof-capture
  libwacom
  libx11
  libxau
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxtst
  mesa
  pango
  pipewire
  pixman
  python
  startup-notification
  systemd-libs
  wayland
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
_checkdepends=(
  gnome-session
  python-dbusmock
  wireplumber
  zenity
)
source=(
  # Mutter tags use SSH signatures which makepkg doesn't understand
  "$pkgname::git+$url.git#tag=${pkgver/[a-z]/.&}"
  'mr1441.patch'
)
b2sums=('4acd4a192455890b12b2fc9b6553ed65bd2176307cd6c6683fc2ab476b7fa88f4b5e507a1209b3e900c68d94768f3cf749b4f5d87d25300b33a112182c8a62a7'
        'b85b4129a7e3c79a076650b804c01f801bdb89ce896546bdedb97e445b289ec2784f11bfd9a29d78e8830769938d42d108e7bdca9c97ec6fc867c2be53867a24')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/mr1441.patch"
}

build() {
  local meson_options=(
    -D docs=true
    -D egl_device=true
    -D installed_tests=false
    -D libdisplay_info=enabled
    -D wayland_eglstream=true
    -D tests=false
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson "$pkgname" build "${meson_options[@]}"
  meson compile -C build
}

_check() (
  export XDG_RUNTIME_DIR="$PWD/rdir" GSETTINGS_SCHEMA_DIR="$PWD/build/data"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  glib-compile-schemas "$GSETTINGS_SCHEMA_DIR"

  export NO_AT_BRIDGE=1 GTK_A11Y=none
  export MUTTER_DEBUG_DUMMY_MODE_SPECS="800x600@10.0"

  # Tests fail:
  # mutter:cogl+cogl/conform / cogl-test-offscreen-texture-formats-gles2
  # mutter:core+mutter/stacking / fullscreen-maximize
  ## https://gitlab.gnome.org/GNOME/mutter/-/issues/3343
  xvfb-run -s '-nolisten local +iglx -noreset' \
    mutter/src/tests/meta-dbus-runner.py --launch=pipewire --launch=wireplumber \
    meson test -C build --no-suite 'mutter/kvm' --no-rebuild \
    --print-errorlogs --timeout-multiplier 10 --setup plain ||:
)

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_mutter-dynamic-buffering() {
  conflicts=(mutter)
  provides=(mutter libmutter-14.so)

  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
