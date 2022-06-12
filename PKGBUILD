# Maintainer: CorvetteCole <aur@corvettecole.com>

_merge_requests_to_use=('1154')

pkgbase=mutter-vrr
pkgname=(mutter-vrr mutter-vrr-docs)
pkgver=42.2+r11+gcd52c57bc
pkgrel=1
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
_commit=cd52c57bc65a25363a25ee575b0c9d1d4e471ba8  # tags/42.2^11
source=("$pkgname::git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        'mr1154.patch')

sha256sums=('SKIP'
            '175a256b04383f5ceed0952a61d8faa7b469ee0acffaa9d63845c9b3cecd270b')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

pick_mr() {
  for mr in "${_merge_requests_to_use[@]}"; do
    if [ "$1" = "$mr" ]; then
      if [ "$2" = "merge" ] || [ -z "$2" ]; then
        echo "Downloading then Merging $1..."
        curl -O "https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/$mr.diff"
        git apply "$mr.diff"
      elif [ "$3" = "revert" ]; then
        echo "Reverting $1..."
        git revert "$2" --no-commit
      elif [ "$3" = "patch" ]; then
	if [ -e ../"$2" ]; then 
          echo "Patching with $2..."
          patch -Np1 -i ../"$2"
        else
          echo "Downloading $mr as $2 then patching..."
          curl -O "https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/$mr.diff" -o "$2"
          patch -Np1 -i "$2"
        fi
      else
        echo "ERROR: wrong argument given: $2"
      fi
      break
    fi
  done
}

prepare() {
  cd "$srcdir/$pkgname"
  pick_mr '1154' 'mr1154.patch' 'patch'
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
  provides=(mutter libmutter-10.so mutter-vrr)
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
