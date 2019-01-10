# based on https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/blob/dbc5b50d4be573129533e6a4d9aebd0d47405b26/PKGBUILD

# -- Arch credits
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>
# --

# Maintainer: Vitaly Ankh (vitalyr) <vitalyankh@gmail.com>
# Contributor: jonathon <https://aur.archlinux.org/account/jonathon>
# Contributor: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>
# Contributor: Simon Gardling <titaniumtown@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgbase=mutter-git
pkgname=(
  mutter-git
  mutter-docs-git
)
pkgver=46.0+r26+ga834eb5c9
pkgrel=1
pkgdesc="Window manager and compositor for GNOME"
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
checkdepends=(
  gnome-session
  python-dbusmock
  wireplumber
  zenity
)
source=('git+https://gitlab.gnome.org/GNOME/mutter.git')
b2sums=('SKIP')

pkgver() {
  cd mutter
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

build() {
  local meson_options=(
    -D docs=true
    -D egl_device=true
    -D installed_tests=false
    -D libdisplay_info=enabled
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

check() (
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

package_mutter-git() {
  provides=(mutter libmutter-14.so)
  conflicts=(mutter)

  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-docs-git() {
  provides=(mutter-docs)
  conflicts=(mutter-docs)
  pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}
