# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: @xabbu <https://github.com/xabbu>
# Contributor: Stefano Capitani <stefano_at_manjaro_dot_org>
# Contributor: Mark Wagie <mark_at_manjaro_dot_org>
# Contributor: Jonathon Fernyhough
# Contributor: realqhc <https://github.com/realqhc>
# Contributor: Brett Alcox <https://github.com/brettalcox>
# Contributor: runsisi https://github.com/runsisi

# Archlinux credits:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Ubuntu credits:
# Marco Trevisan: <https://salsa.debian.org/gnome-team/mutter/-/blob/ubuntu/master/debian/patches/ubuntu/x11-Add-support-for-fractional-scaling-using-Randr.patch>

pkgname=mutter-x11-scaling
pkgver=46.0
pkgrel=2
pkgdesc="Window manager and compositor for GNOME with X11 fractional scaling patch"
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
provides=(mutter=$pkgver libmutter-14.so)
conflicts=(mutter)
source=(
  # Mutter tags use SSH signatures which makepkg doesn't understand
  "git+https://gitlab.gnome.org/GNOME/mutter.git#tag=$pkgver"
  "https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/raw/7a54f849bdbe1b61c54a615dd51c7d9ec0e36131/0001-drm-buffer-gbm-Do-not-call-ensure_fb_id-from-lock_fr.patch"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/a3b0d22d435cac6a2ce4e9fef9ebcd994639c9b4/x11-Add-support-for-fractional-scaling-using-Randr.patch"
)
b2sums=('04a14854c8ec2668a340b241102b7b2ebbc0387a9771a5bd2c2366419ee08e7ebb308f2288f4a64b9d08053e1897eb514a46802584d1590f8bcebde4a613afaa'
        'fed7d496b658a43b306e62a57c817c54990e8764103eae5479b8a96fbdf25da1ae6028126aa3cccda6239ff1f0c4e69bbe6f12e29804651c1a7b6ca40d6bf36c'
        'c1b433d089bc63de2e7a4dc7e134d98639bc060d2219c67e6a17739281d526c30157963fdc13ee9aa021132d81e2f807bfda539536fb1f1de13e8c39b7ca28f9')

prepare() {
  cd mutter

  # Add scaling support using randr under x11
  patch -p1 -i "${srcdir}/x11-Add-support-for-fractional-scaling-using-Randr.patch"

  # https://gitlab.gnome.org/GNOME/mutter/-/issues/3389
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3674
  git apply -3 ../0001-drm-buffer-gbm-Do-not-call-ensure_fb_id-from-lock_fr.patch
}

build() {
  local meson_options=(
    -D docs=false
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

package() {
  meson install -C build --destdir "$pkgdir"
}
