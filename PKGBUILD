# Maintainer: Joakim Soderlund <joakim.soderlund@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter-dynamic-buffering
pkgver=40.3
pkgrel=1
pkgdesc="A window manager for GNOME (with dynamic triple/double buffering)"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop upower
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-xwayland graphene libxkbfile)
makedepends=(gobject-introspection git egl-wayland meson xorg-server)
checkdepends=(xorg-server-xvfb pipewire-media-session)
provides=(mutter libmutter-8.so)
conflicts=(mutter)
groups=(gnome)
install=mutter.install
_commit=3f2c8f5f3b8f05bb09daeb7f12217394c9d8dd1c  # tags/40.3^0
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        'mr1441.patch')
sha256sums=('SKIP'
            '07d3c9d6740e509b79adc4ca93d31e655317758ac2526b104a0c5c7fa435ebf0')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/mr1441.patch"
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false \
    -D profiler=false \
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
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check_internal); _check_internal"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
