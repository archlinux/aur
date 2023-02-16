# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: @xabbu <https://github.com/xabbu>
# Contributor: Stefano Capitani <stefano_at_manjaro_dot_org>
# Contributor: Mark Wagie <mark_at_manjaro_dot_org>
# Contributor: Jonathon Fernyhough
# Contributor: realqhc <https://github.com/realqhc>

# Archlinux credits:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

# Ubuntu credits:
# Marco Trevisan: <https://salsa.debian.org/gnome-team/mutter/-/blob/ubuntu/master/debian/patches/ubuntu/x11-Add-support-for-fractional-scaling-using-Randr.patch>

pkgname=mutter-x11-scaling
pkgver=43.3
pkgrel=2
pkgdesc="Window manager and compositor for GNOME with X11 fractional scaling patch"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(
  colord
  dconf
  gnome-desktop
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  lcms2
  libcanberra
  libgudev
  libinput
  libsm
  libsysprof-capture
  libxkbcommon-x11
  libxkbfile
  pipewire
  startup-notification
  xorg-xwayland
)
makedepends=(
  egl-wayland
  gi-docgen
  git
  gobject-introspection
  meson
  sysprof
  wayland-protocols
  xorg-server
)
checkdepends=(
  python-dbusmock
  wireplumber
  xorg-server-xvfb
  zenity
)
provides=(mutter libmutter-11.so)
conflicts=(mutter)
_commit=a63755bdad7d8bffdbbc649178d759c37dacce01  # tags/43.3^0
source=(
  "git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
  "https://salsa.debian.org/gnome-team/mutter/-/raw/fef244c14c8ef6c98a5355d901b34f9e2ea2fd4e/debian/patches/ubuntu/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  "https://raw.githubusercontent.com/puxplaying/mutter-x11-scaling/68b8b2c467f9c8451ffaf44fe9101d6508f56d06/Support-Dynamic-triple-double-buffering.patch"
)
b2sums=('SKIP'
        'fb1ab227fe232c348f644d9483f837205cb028c953aff175b20b312b666c61b86b5049ed793ea052d9990916657d3b20d547900d25b0b8d9229c7ef7a6834333'
        'ed9c3e2392fd7400d742302eadb97fda4ccb51d318f7a3a44c986aa89a41bb7feb498ce5c18835e280dfabca51941ee490440598f348fbd36ac135876277da36')

pkgver() {
  cd mutter
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd mutter

  # Fix broken focus handling with XWayland
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/2848
  git cherry-pick -n 12ce58dba4f96f6a948c1d166646d263253e3ee0

  # Add scaling support using randr under x11 and dynamic triple buffering support
  patch -p1 -i "${srcdir}/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  patch -p1 -i "${srcdir}/Support-Dynamic-triple-double-buffering.patch"
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false
  meson compile -C build
}

_check() (
  export XDG_RUNTIME_DIR="$PWD/rdir" GSETTINGS_SCHEMA_DIR="$PWD/build/data"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"
  glib-compile-schemas "$GSETTINGS_SCHEMA_DIR"

  pipewire &
  _p1=$!

  wireplumber &
  _p2=$!

  trap "kill $_p1 $_p2; wait" EXIT

  #meson test -C build --print-errorlogs -t 3 || :
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  meson install -C build --destdir "$pkgdir"
}
