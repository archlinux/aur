# Maintainer: Ewout van Mansom (emansom) <ewout@vanmansom.name>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-beta-performance
pkgver=47.beta.r142.gd1750e5
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
  glib2-devel
  gobject-introspection
  meson
  sysprof
  wayland-protocols
)
_commit=d1750e5bdb6ed3db86223061150dfaf3026cf6b2
source=(
  "mr1441.patch::$url/-/merge_requests/1441.patch"
  "git+$url.git#commit=$_commit"
)
b2sums=('7f440dcc54b11f7cd39df53643ebacc5580b1d08bb87ebfa23cd5fb661480a819f47f77e40ac9723364c19721aa708f3449a416c9d3b3f0da992c1df3d2b99ec'
        '8e6a32a0f6ce2b4ca72ec999167a34f354ff5caf44b0d94b3b9db09503fa74e610932b4c27af80948b0a7bf5c3c50d2314c0e2bea9a59a1128ef15b9471af545')

pkgver() {
  cd mutter
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd mutter
  patch -Np1 -i ../mr1441.patch
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

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

package_mutter-beta-performance() {
  provides=(mutter libmutter-15.so)
  conflicts=(mutter)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
