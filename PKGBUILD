# based on https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/blob/dbc5b50d4be573129533e6a4d9aebd0d47405b26/PKGBUILD

# -- Arch credits
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>
# --

# Maintainer: Vitaly Ankh (vitalyr) <vitalyankh@gmail.com>
# Contributor: jonathon <https://aur.archlinux.org/account/jonathon>
# Contributor: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>
# Contributor: Simon Gardling <titaniumtown@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgbase=mutter-text-input-v1-git
pkgname=(
  mutter-text-input-v1-git
  mutter-docs-text-input-v1-git
)
pkgver=46.1+r166+g530659c64
pkgrel=2
pkgdesc="Window manager and compositor for GNOME"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(
  at-spi2-core
  cairo
  colord
  dconf
  fontconfig
  fribidi
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-desktop-4
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  gtk4
  harfbuzz
  iio-sensor-proxy
  lcms2
  libcanberra
  libcolord
  libdisplay-info
  libdrm
  libei
  libglvnd
  libgudev
  libice
  libinput
  libpipewire
  libsm
  libsysprof-capture
  libwacom
  libx11
  libxau
  libxcb
  libxcomposite
  libxcursor
  libxdamage
  libxext
  libxfixes
  libxi
  libxinerama
  libxkbcommon
  libxkbcommon-x11
  libxkbfile
  libxrandr
  libxtst
  mesa
  pango
  pipewire
  pixman
  python
  startup-notification
  systemd-libs
  wayland
  xorg-xwayland
)
makedepends=(
  egl-wayland
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  gtk3
  meson
  python-packaging
  sysprof
  wayland-protocols
)
source=('git+https://gitlab.gnome.org/GNOME/mutter.git'
        'text-input-v1.patch::https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3751/diffs.patch')
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd mutter
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd mutter
  git apply -3 ../text-input-v1.patch
}

build() {
  local meson_options=(
    -D docs=true
    -D egl_device=true
    -D installed_tests=false
    -D libdisplay_info=enabled
    -D tests=false
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson mutter build "${meson_options[@]}"
  meson compile -C build
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

package_mutter-text-input-v1-git() {
  provides=(mutter libmutter-14.so)
  conflicts=(mutter mutter-git)

  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-docs-text-input-v1-git() {
  provides=(mutter-docs)
  conflicts=(mutter-docs mutter-docs-git)
  pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}
