# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

_pkgname=mutter
pkgname=$_pkgname-x11-scaling
pkgver=41.1
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
checkdepends=(xorg-server-xvfb pipewire-session-manager python-dbusmock)
conflicts=($_pkgname)
provides=($_pkgname libmutter-9.so)
groups=(gnome)
_commit=8de96d3d7c40e6b5289fd707fdd5e6d604f33e8f  # tags/41.1^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        #https://salsa.debian.org/gnome-team/mutter/-/raw/91d9bdafd5d624fe1f40f4be48663014830eee78/debian/patches/x11-Add-support-for-fractional-scaling-using-Randr.patch)
        https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/bf134596c22abbb6dc70adb7844e6d391ea4cd80/x11-Add-support-for-fractional-scaling-using-Randr.patch)
sha256sums=('SKIP'
            '34463f4b17921fae3e75d7e1d862e4c170209eff35b2fc9fad376b8e14f3efb6')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # Add scaling support using randr under x11 (Marco Trevisan and Georg Wagner)
  git revert -n ef0f7084
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
  dbus-run-session xvfb-run -s '-nolisten local' \
    bash -c "$(declare -f _check); _check"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
