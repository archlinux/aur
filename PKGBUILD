# Maintainer: Vladimir <vluzan@disroot.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgbase=mutter-native-xwayland
pkgname=(
  mutter-native-xwayland
  mutter-native-xwayland-devkit
  mutter-native-xwayland-docs
)
pkgver=51.1
pkgrel=2
pkgdesc="Window manager and compositor for GNOME (with opt-in native Xwayland scaling)"
url="https://github.com/wlroots/mutter-native-xwayland"
arch=(x86_64)
license=(GPL-2.0-or-later)
install=.INSTALL
depends=(
  at-spi2-core
  cairo
  colord
  dconf
  egl-wayland
  fontconfig
  fribidi
  gdk-pixbuf2
  glib2
  glibc
  glycin
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
  libgcc
  libgirepository
  libglvnd
  libgudev
  libinput
  libpipewire
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
  libxrandr
  mesa
  pango
  pipewire
  pixman
  python
  python-argcomplete
  python-dbus
  python-gobject
  startup-notification
  systemd-libs
  wayland
  xorg-xwayland
)
makedepends=(
  bash-completion
  gi-docgen
  git
  glib2-devel
  gobject-introspection
  meson
  python-docutils
  sysprof
  wayland-protocols
)
source=(
  # Mutter tags use SSH signatures which makepkg doesn't understand
  "git+https://gitlab.gnome.org/GNOME/mutter.git#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=b54bc5da25127ef416858a3ad92e57159ff565b3"
  "0001-xwayland-native-scaling-mode.patch"
)
b2sums=('0064caf6a85d9cb42d9544ad2dab31ef158a957d20d5a99aabe27f40986f128714f97a5cbe970c1aba1cb9c86f0b94f2f279a22072bbfefb9c0c7e715d7a411f'
        'f989bc2ceb52aad3c6a23c439df3bbc672bc11d561a247d19971d30cc85ed5d42295de40f8e55b13404ed32aa44f12307c9f5b470f2e288d1c9c8329255c43bf'
        '5f7e0d64d24fdcee14ed2bcd56c7e99d076b4840f1f09219964be99469217cd13b2e6fef9e9bf683132a6db497b65e79435b456fae05c3b964c2d47a76cbaa0d')

prepare() {
  cd mutter
  patch -Np1 -i "${srcdir}/0001-xwayland-native-scaling-mode.patch"
}

build() {
  local meson_options=(
    -D docs=true
    -D installed_tests=false
    -D tests=disabled
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  # Inject gvdb
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

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

package_mutter-native-xwayland() {
  provides=('mutter=51.1' libmutter-51.so)
  conflicts=('mutter')
  optdepends=(
    'bash-completion: Bash completions for gdctl'
    'mutter-native-xwayland-devkit: Mutter SDK, "MDK"'
  )

  meson install -C build --no-rebuild --destdir "$pkgdir"

  _pick devkit "$pkgdir"/usr/lib/mutter-devkit
  _pick devkit "$pkgdir"/usr/share/applications/org.gnome.Mutter.Mdk.desktop
  _pick devkit "$pkgdir"/usr/share/icons/hicolor/scalable/apps/org.gnome.Mutter.Mdk.Devel.svg
  _pick devkit "$pkgdir"/usr/share/icons/hicolor/scalable/apps/org.gnome.Mutter.Mdk.svg
  _pick devkit "$pkgdir"/usr/share/icons/hicolor/symbolic/apps/org.gnome.Mutter.Mdk-symbolic.svg

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-native-xwayland-devkit() {
  pkgdesc="GNOME Mutter Development Kit (native Xwayland scaling build)"
  provides=('mutter-devkit=51.1')
  conflicts=('mutter-devkit')
  depends=(
    cairo
    glib2
    glibc
    gtk4
    hicolor-icon-theme
    libadwaita
    libei
    libgcc
    libpipewire
    libxkbcommon
    mutter-native-xwayland
  )

  mv devkit/* "$pkgdir"
}

package_mutter-native-xwayland-docs() {
  pkgdesc+=" (documentation)"
  provides=('mutter-docs=51.1')
  conflicts=('mutter-docs')
  depends=()

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
