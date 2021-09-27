# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

_pkgname=mutter
pkgname=$_pkgname-x11-scaling
pkgver=40.5
pkgrel=1
pkgdesc="A window manager for GNOME (with X11 fractional scaling patch)"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(aarch64 x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop upower
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-xwayland graphene libxkbfile wayland-protocols)
makedepends=(gobject-introspection git egl-wayland meson xorg-server)
checkdepends=(xorg-server-xvfb pipewire-media-session)
conflicts=($_pkgname)
provides=($_pkgname libmutter-8.so)
groups=(gnome)
install=mutter.install
_commit=2b2b3ab8502a5bcc2436e169279d2421f6f1a605  # tags/40.5^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        https://salsa.debian.org/gnome-team/mutter/-/raw/91d9bdafd5d624fe1f40f4be48663014830eee78/debian/patches/x11-Add-support-for-fractional-scaling-using-Randr.patch)
sha256sums=('SKIP'
            '19de314590e3311563b11da3305d8e9c8ba1f859fe65db668ccd0457250a9ca5')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # Add scaling support using randr under x11 (Marco Trevisan)
  patch -p1 -i ../x11-Add-support-for-fractional-scaling-using-Randr.patch
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $_pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false \
    -D profiler=false
  meson compile -C build
}

_check() (
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

check() {
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
