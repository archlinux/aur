# Maintainer: Vitaly Ankh (vitalyr) <vitalyankh@gmail.com>
# Contributor: jonathon <https://aur.archlinux.org/account/jonathon>
# Contributor: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>
# Contributor: Simon Gardling <titaniumtown@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgname=mutter-git
_pkgname=mutter
pkgver=42.1+r113+gd1a85c34c
pkgrel=1
pkgdesc="A window manager for GNOME."
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas
         libcanberra startup-notification zenity libsm gnome-desktop upower
         libxkbcommon-x11 gnome-settings-daemon libgudev libinput pipewire
         xorg-xwayland graphene libxkbfile)
makedepends=(gobject-introspection git egl-wayland meson xorg-server
             xorg-server-xvfb wayland-protocols)
conflicts=(mutter)
source=("git+https://gitlab.gnome.org/GNOME/mutter.git")
sha256sums=('SKIP')

prepare() {
  cd $_pkgname
}

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

prepare() {
  cd $_pkgname
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build \
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

  #pipewire &
  #_p1=$!

  #wireplumber &
  #_p2=$!

  #trap "kill $_p1 $_p2; wait" EXIT

  #meson test -C build --print-errorlogs -t 3
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

package_mutter() {
  provides=(mutter libmutter-10.so)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}

# vim:set sw=2 et:
