# Maintainer: Ewout van Mansom (emansom) <ewout@vanmansom.name>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-beta-performance
pkgver=47.rc.r15.gf68cd63
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
_commit=f68cd634b9f95a673f358b52bb2ac5728f257fc6
source=(
  "mr1441.patch::$url/-/merge_requests/1441.patch"
  "git+$url.git#commit=$_commit"
)
b2sums=('343186ecf7ecd688fd1b3c18c646a558b17d8b535d23505574d7dcb223201b95b4af12311fce927873240f855471c04fbc73277c2fb900ba4106a1240741a8cb'
        '193d4817870b7abc921d84c98a9ccd654ff273ae97a8b3f111469284de0116ce670c09c8b22ccbc3b93d90207bb794f53754d9b6f25dfe06da2ec8dc07561a89')

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
