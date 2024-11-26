# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: @xabbu <https://github.com/xabbu>
# Contributor: Stefano Capitani <stefano_at_manjaro_dot_org>
# Contributor: Mark Wagie <mark_at_manjaro_dot_org>
# Contributor: Jonathon Fernyhough
# Contributor: realqhc <https://github.com/realqhc>
# Contributor: Brett Alcox <https://github.com/brettalcox>
# Contributor: runsisi <https://github.com/runsisi>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Ubuntu patches:
# https://salsa.debian.org/gnome-team/mutter/-/tree/ubuntu/latest/debian/patches/ubuntu

pkgname=mutter-x11-scaling
pkgver=47.2
pkgrel=1
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
  glib2-devel
  gobject-introspection
  meson
  sysprof
  wayland-protocols
)
source=(
  # Mutter tags use SSH signatures which makepkg doesn't understand
  "git+$url.git#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=b54bc5da25127ef416858a3ad92e57159ff565b3"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/ba70d29f5d6b2dc6333fe2728ab056b12161bac9/x11-Add-support-for-fractional-scaling-using-Randr.patch"
)
b2sums=('7d46865b8a969a124c2482e7ede4f67c9fd8c30ddbb8bd3a43a74ef8fd646e4e85fb171419551aaa866b05908ac73c80be9c5ea121d31787e04382f04648f1e7'
        'f989bc2ceb52aad3c6a23c439df3bbc672bc11d561a247d19971d30cc85ed5d42295de40f8e55b13404ed32aa44f12307c9f5b470f2e288d1c9c8329255c43bf'
        'e64825f246d344a9226b3473d4368b8e27cc1348508342c82de3553581eb45d46505fdbf099c6fc7257ad2e65b20589d1bd8bb7965f7f7a7d4cc0cf5c8fa8ff6')

prepare() {
  cd mutter

  # Add scaling support using randr under x11
  patch -p1 -i "${srcdir}/x11-Add-support-for-fractional-scaling-using-Randr.patch"
}

build() {
  local meson_options=(
    -D docs=false
    -D egl_device=true
    -D installed_tests=false
    -D libdisplay_info=enabled
    -D tests=disabled
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  # Inject gvdb
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

package() {
  provides=(mutter libmutter-15.so)
  conflicts=(mutter)

  meson install -C build --destdir "$pkgdir"
}
