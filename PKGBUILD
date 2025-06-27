# Maintainer: Rashid Salimov <anarchist772_at_yandex_dot_ru>

pkgname=mutter-fix_meta_frame_native_kms_update
pkgver=48.3.1
pkgrel=1
pkgdesc="Window manager for GNOME with issue fix: https://gitlab.gnome.org/GNOME/mutter/-/issues/4183"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL-2.0-or-later)
provides=(mutter libmutter-16.so)
conflicts=(mutter)

depends=(
  at-spi2-core
  cairo
  colord
  dconf
  egl-wayland
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
  libgirepository
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
  python-argcomplete
  python-gobject
  startup-notification
  systemd-libs
  wayland
  xorg-xwayland
)

makedepends=(
  gi-docgen
  git
  glib2-devel
  bash-completion
  gobject-introspection
  meson
  python-docutils
  sysprof
  wayland-protocols
)


source=(
  "fix_meta_frame_native_kms_update.patch"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=4758f6fb7f889e074e13df3f914328f3eecb1fd3"
  "git+https://gitlab.gnome.org/GNOME/mutter.git#tag=$pkgver"
)

sha256sums=(
  "8462709e22ab56e1b9a86232f63fdb6f0fb504883041e43f2d89d60e4766f6b5"
  "ebe771e60943547279fbf29acb6aea6346fc20df6388252f71bf2bf679d3a7a8"
  "d8680bc5c8724b8cdaca10434e950a2e4684cec000581e7bd179fa4cb384e3f2"
)

prepare() {
  cd "$srcdir/mutter"
  patch -p1 -i "$srcdir/fix_meta_frame_native_kms_update.patch"
}

build() {
  local meson_options=(
    -D docs=false
    -D egl_device=true
    -D installed_tests=false
    -D tests=disabled
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}