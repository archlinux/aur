# Maintainer: CorvetteCole <aur@corvettecole.com>

pkgbase=mutter-vrr
pkgname=(mutter-vrr mutter-vrr-docs)
pkgver=42.4
pkgrel=4
pkgdesc="A window manager for GNOME (with VRR)"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-xwayland graphene libxkbfile libsysprof-capture)
makedepends=(gobject-introspection git egl-wayland meson xorg-server
             wayland-protocols sysprof gi-docgen)
checkdepends=(xorg-server-xvfb pipewire-session-manager python-dbusmock)
optdepends=('gnome-control-center-vrr: VRR settings integration')
_commit=9a25838e4e3f705b69b7f2e0bf22e970d8829f1f  # tags/42.4
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        '42.4.patch')

sha256sums=('SKIP'
            '193e7b0e0a927a87e58bd7f68a2aa551f313be5f7da8f20930b30bd0db0059af')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/42.4.patch"
  # patch -p1 < "$srcdir/mr2464.patch"
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D docs=true \
    -D installed_tests=false
  meson compile -C build
}

_check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR
  local _pipewire_session_manager=$(pacman -Qq pipewire-session-manager)

  pipewire &
  _p1=$!

  $_pipewire_session_manager &
  _p2=$!

  trap "kill $_p1 $_p2; wait" EXIT

  meson test -C build --print-errorlogs -t 3
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_mutter-vrr() {
  provides=(mutter libmutter-10.so)
  conflicts=(mutter)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"
  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-vrr-docs() {
  provides=(mutter-docs)
  conflicts=(mutter-docs)
  pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}
