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
pkgver=44.2
pkgrel=2
pkgdesc="Window manager and compositor for GNOME with X11 fractional scaling patch"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(
  colord
  dconf
  gnome-desktop-4
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
  gtk3
  meson
  sysprof
  wayland-protocols
  xorg-server
  xorg-server-xvfb
)
checkdepends=(
  python-dbusmock
  wireplumber
  zenity
)
provides=(mutter libmutter-12.so)
conflicts=(mutter)
_commit=e7ed2bf85700a2ff33b69826f6f0fff6e2f28e69  # tags/44.2^0
source=(
  "git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
  "https://salsa.debian.org/gnome-team/mutter/-/raw/82e4a2c864e5e238bd03b1f4ef05f737915dac8c/debian/patches/ubuntu/x11-Add-support-for-fractional-scaling-using-Randr.patch"
  "https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/raw/2291ffef7958c275347b0eab1ff37cd7267091a5/0001-tests-cogl-test-framebuffer-get-bits-should-fail-on-.patch"
)
b2sums=('SKIP'
        '84e297cbb96c2d58dc14bd5abfab8889e172e7466767afb83b4ce6071dd4d745656aeb955ccb933f0cf78bf46d92d6cbd2d79e41e6ae5b6a654832606c9e0e5f'
        'f4ed6920b4823bf3fc1ba0c6df56c8fbd930e0e36ed209430d04835edbc4b07f13dd3851102481b5aac176858093199921ff9e02f5723e9d786a1df8df83b539')

pkgver() {
  cd mutter
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd mutter
  
  # Revert commit that broke auto focus of opened windows from overview until upstream fixes it
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/2690
  # https://gitlab.gnome.org/GNOME/mutter/-/commit/3ac82a58c51a5c8db6b49e89a1232f99c79644cc?merge_request_iid=2878
  git revert -n 3ac82a58

  # Unbreak tests with Mesa 23.1
  # https://gitlab.gnome.org/GNOME/mutter/-/issues/2848
  git apply -3 ../0001-tests-cogl-test-framebuffer-get-bits-should-fail-on-.patch

  # Add scaling support using randr under x11
  patch -p1 -i "${srcdir}/x11-Add-support-for-fractional-scaling-using-Randr.patch"
}

build() {
  local meson_options=(
    -D docs=false
    -D egl_device=true
    -D installed_tests=false
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build "${meson_options[@]}"
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
