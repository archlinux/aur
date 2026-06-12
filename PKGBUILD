# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgbase=mutter-hdr-update
pkgname=(
  mutter-hdr-update
  mutter-hdr-update-devkit
  mutter-hdr-update-docs
)
pkgver=50.2
pkgrel=2
pkgdesc="Window manager and compositor for GNOME (with patches)"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL-2.0-or-later)
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
  "git+$url.git#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git#commit=b54bc5da25127ef416858a3ad92e57159ff565b3"
  0001-wayland-Only-schedule-a-single-cursor-location-updat.patch
  "mutter-hdr.patch::https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/5068.patch"
  "0001-window-actor-Add-format-aware-paint_to_content-varia.patch::https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/5077.patch"
  "https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/5067.patch"
)
b2sums=('2987b5e207f0a12e94b035d5b913b8a76bc291be41a71669e977ead0f93cfbb3219c97aeb2475a97906e989353eb309abb2b80f683cc41074a042b81467e3a8c'
        'f989bc2ceb52aad3c6a23c439df3bbc672bc11d561a247d19971d30cc85ed5d42295de40f8e55b13404ed32aa44f12307c9f5b470f2e288d1c9c8329255c43bf'
        '57ff8454c7e33249a54cbc257b62cf9b2ddd49309c9616e815d4b7310cac2b0ca1a8a6c0dd191b36766c1cad2831848ea7e9880879010b9427138b8800fc506b'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd mutter

  # Fix log spam
  # https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/work_items/27
  # https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/5096
  git apply -3 ../0001-wayland-Only-schedule-a-single-cursor-location-updat.patch

  # HDR patches
  git apply -3 ../mutter-hdr.patch
  git apply -3 ../0001-window-actor-Add-format-aware-paint_to_content-varia.patch

  # Color pipeline
  git apply -3 ../5067.patch
}

build() {
  local meson_options=(
    -D docs=true
    -D egl_device=true
    -D installed_tests=false
    -D tests=disabled
    -D wayland_eglstream=true
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

package_mutter-hdr-update() {
  provides=(libmutter-18.so mutter)
  conflicts=(mutter)
  optdepends=(
    'bash-completion: Bash completions for gdctl'
    'mutter-devkit: Mutter SDK, "MDK"'
  )

  meson install -C build --destdir "$pkgdir"

  _pick devkit "$pkgdir"/usr/lib/mutter-devkit
  _pick devkit "$pkgdir"/usr/share/applications/org.gnome.Mutter.Mdk.desktop
  _pick devkit "$pkgdir"/usr/share/icons/hicolor/scalable/apps/org.gnome.Mutter.Mdk.Devel.svg
  _pick devkit "$pkgdir"/usr/share/icons/hicolor/scalable/apps/org.gnome.Mutter.Mdk.svg
  _pick devkit "$pkgdir"/usr/share/icons/hicolor/symbolic/apps/org.gnome.Mutter.Mdk-symbolic.svg

  _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-hdr-update-devkit() {
  pkgdesc="GNOME Mutter Development Kit"
  provides=(mutter-devkit)
  conflicts=(mutter-devkit)
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
    mutter
  )

  mv devkit/* "$pkgdir"
}

package_mutter-hdr-update-docs() {
  pkgdesc+=" (documentation)"
  provides=(mutter-docs)
  conflicts=(mutter-docs)
  depends=()

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
