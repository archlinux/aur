# Maintainer: Ewout van Mansom (emansom) <ewout@vanmansom.name>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-beta-performance
pkgver=47.0.r18.g625965d
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
  python-docutils
)
provides=(mutter libmutter-15.so)
conflicts=(mutter)
_commit=625965d956a8818b77eadbdf0ae6e5edbf60b029
_gvdb_commit=b54bc5da25127ef416858a3ad92e57159ff565b3
source=(
  "mr1441.patch::$url/-/merge_requests/1441.patch"
  "git+$url.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=$_gvdb_commit"
)
b2sums=('c56646f64103e5be8fca94eabec0c59ec97f9c7cd3a40c145f9956c6ed8fc66e0edbecbfc9d5e9b47fff1b94f79c3d584cd57f84073e9413ea6a9a4e617d5b9b'
        '715b6f0ce750199a664369bdf549386b802d4e7c0d1cf24efc8dc260e0fb5c8b749f47d7f1f79c432aea2f37dce0482f6de7c8a54e68040ba2699ce4559a43da'
        'f989bc2ceb52aad3c6a23c439df3bbc672bc11d561a247d19971d30cc85ed5d42295de40f8e55b13404ed32aa44f12307c9f5b470f2e288d1c9c8329255c43bf')

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
    -D wayland_eglstream=true
    -D xwayland_initfd=enabled
    -D libdisplay_info=enabled
    -D installed_tests=false
    -D tests=disabled
    -D profiler=false
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  # Inject gvdb
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
