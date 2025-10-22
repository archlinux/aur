# based on https://gitlab.archlinux.org/archlinux/packaging/packages/mutter/-/blob/645a95f3cf9eec182c8bb61b8ea573d389967729/PKGBUILD

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

pkgbase=mutter-git
pkgname=(
  mutter-git
  mutter-devkit-git
  mutter-docs-git
)
pkgver=49.1+r25+g5d357fccec
pkgrel=1
pkgdesc="Window manager and compositor for GNOME"
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
  gcc-libs
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
  libgirepository
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
  "git+$url.git"
)
b2sums=(
  'SKIP'
)

pkgver() {
  cd mutter
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd mutter
  meson subprojects download gvdb
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

package_mutter-git() {
  provides=(mutter libmutter-18.so)
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

package_mutter-devkit-git() {
  provides=(mutter-devkit)
  conflicts=(mutter-devkit)
  pkgdesc="GNOME Mutter Development Kit"
  depends=(
    gcc-libs
    glib2
    glibc
    gtk4
    hicolor-icon-theme
    libadwaita
    libei
    libpipewire
    mutter
  )

  mv devkit/* "$pkgdir"
}

package_mutter-docs-git() {
  provides=(mutter-docs)
  conflicts=(mutter-docs)
  pkgdesc+=" (documentation)"
  depends=()

  mv docs/* "$pkgdir"
}
