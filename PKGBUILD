# Maintainer: Brian Crescimanno <brian_at_crescimanno_dot_com>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgbase=mutter-touchpad-scroll-patch
pkgname=(mutter-touchpad-scroll-patch)
pkgver=47.6
pkgrel=1
pkgdesc="Window manager and compositor for GNOME with slower default touchpad scrolling"
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

_gvdb_commit=2b42fc75f09dbe1cd1057580b5782b08f2dcb400

source=(
  # Mutter tags use SSH signatures which makepkg doesnt understand
  "$pkgname::git+$url.git#tag=${pkgver/[a-z]/.&}"
  "slowscroll.patch"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=$_gvdb_commit"
)
b2sums=('50d1b8efe93d6e3775a96bffac68768ba8a884b7a58f4cbfadd46e61d89f0c5cfda600955f116b399580b930ed2112f11b9eb6c17957fba93adaa4591dd7bd85'
        '0b2e17b6507bb551f635649c8b27aa48622d37436c33e83a989f3c787fbaacd0b2ca875b0fc8eb990996d293aa5961196616b011335cb7064635502db4732070'
        '56602cfb75d922a17dec7586a553f562218db7c36a07367454ccd00a234468d53869b423154c750a325a44c0b6d8871b998f54a9ef678240f06e2b3f6880e80e')

prepare() {
  cd "$srcdir/$pkgname"
  patch -p1 < "$srcdir/slowscroll.patch"
}

build() {
  local meson_options=(
    -D docs=true
    -D egl_device=true
    -D installed_tests=false
    -D libdisplay_info=enabled
    -D tests=disabled
    -D wayland_eglstream=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  # inject gvdb
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson $pkgname build "${meson_options[@]}"
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

package_mutter-touchpad-scroll-patch() {
  conflicts=(mutter)
  provides=(mutter libmutter-15.so)

  meson install -C build --destdir "$pkgdir"

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
