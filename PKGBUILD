# Maintainer: Joakim Soderlund <joakim.soderlund@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-dynamic-buffering
pkgver=41.3
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
_commit=f51ad2911419ee2ab88b5548581227a57d0fd987  # tags/41.3^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        'backports.patch'
        'mr1441.patch')

sha256sums=('SKIP'
            '650e2d88bad9226be7cde62974b3a39a99d63156d0fe61df6bc54887481a1b51'
            'cf99896763558258f489ff0e9a1e8001f716d63b06366f740e044cc72a71d3e7')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/mr1441.patch"
  patch -p1 < "$srcdir/backports.patch"
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
