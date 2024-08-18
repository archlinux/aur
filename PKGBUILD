# Maintainer: Ewout van Mansom (emansom) <ewout@vanmansom.name>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-beta-performance
pkgver=47.beta.r131.gbd8db38
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
_commit=bd8db38460465c0e3f3512836bf0dac437097f00
source=(
  'mr1441.patch::https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1441.patch'
  "git+$url.git#commit=$_commit"
)
b2sums=('29e0ea8be2b5a684d13979024265bb4c558d59b7e3683c58b99fd00c187f9191d0d0ebab0c296950996809619981fe74d43c9259355e3a799c0572cfcb104b8f'
        'dfe5cf4ee1e648d2126713bec01cdaf0c8f2b59d010e3b7a2dd97783944bd0ffd8d38272d51db8dadf815142b995d655b6cc18a2435202f5e54a8864090728f6')

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
