# Maintainer: Joakim Soderlund <joakim.soderlund@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-dynamic-buffering
pkgver=41.4
pkgrel=1
pkgdesc="A window manager for GNOME (with dynamic triple/double buffering)"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop upower
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-xwayland graphene libxkbfile libsysprof-capture)
makedepends=(gobject-introspection git egl-wayland meson xorg-server
             wayland-protocols sysprof)
checkdepends=(xorg-server-xvfb pipewire-media-session python-dbusmock)
provides=(mutter libmutter-9.so)
conflicts=(mutter)
groups=(gnome)
_commit=83a34957046c5b6bca609fda4b68c8c5d1276d14  # tags/41.4^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        'backports.patch'
        'mr1441.patch')

sha256sums=('SKIP'
            '4bfebf11fd10d2829977cb3c77491bcb9eaa7779f9fc72cdbf10cb0f56adc813'
            'cf99896763558258f489ff0e9a1e8001f716d63b06366f740e044cc72a71d3e7')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/mr1441.patch"
  patch -p1 < "$srcdir/backports.patch"

  # Make tests run
  sed -i '/catchsegv/d' meson.build
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false \
    -D tests=false
  meson compile -C build
}

_check_internal() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR

  pipewire &
  _p1=$!

  pipewire-media-session &
  _p2=$!

  trap "kill $_p1 $_p2; wait" EXIT

  meson test -C build --print-errorlogs
)

_check_disabled() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check_internal); _check_internal"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
