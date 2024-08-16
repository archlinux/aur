# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgbase=mutter-text-input-v1
pkgname=(
  mutter-text-input-v1
  mutter-text-input-v1-docs
)
pkgver=46.4
pkgrel=2
pkgdesc="Window manager and compositor for GNOME with text-input-v1 support"
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
  meson
  sysprof
  wayland-protocols
)
source=(
  # Mutter tags use SSH signatures which makepkg doesn't understand
  "git+$url.git#tag=${pkgver/[a-z]/.&}"
  "grab.patch::https://gitlab.gnome.org/GNOME/mutter/-/commit/a99e139a68bd4e5350033163dfd85b6ce6da92a2.patch"
  "text-input-v1.patch::$url/-/merge_requests/3751/diffs.patch"
)
b2sums=('fc21cb8e56728873196fba12ba7a0522aeb9d6e7f6204ac21ade4c632b081fe45e0633d1c072c2416d81faa0f6b63cb69b278ef7b440e2bfccaff775501d3028'
        '70b633145e51ccfba39d4a1baf65b31167f91d32c33adcce19dff67bc41deec7e4cd71e7d0d3fd5b85066da36eec11c2783f2fac9b5ec1fe49a0dbdfd4e8d3f5'
        'de33e73ea61a99bbe9ce7e37869d558c7602a381d301d59147f53acb483483a36c39dfabce05ee1414414abc8971430c8c597879fcc216be83f6588f5ff63f69')

prepare() {
  cd mutter
  git apply -3 ../grab.patch
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

package_mutter-text-input-v1() {
  provides=(mutter libmutter-14.so)
  conflicts=(mutter)

  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-text-input-v1-docs() {
  provides=(mutter-docs)
  conflicts=(mutter-docs)
  pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
