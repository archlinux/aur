#Based on https://gitlab.archlinux.org/archlinux/packaging/packages/gnome-shell/-/raw/main/PKGBUILD
# Maintainer: envolution
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgbase=gnome-shell-git
pkgname=(
  gnome-shell-git
  gnome-shell-docs-git
)
pkgver=47.0+r60+g50434f013
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell - git latest"
url="https://gitlab.gnome.org/GNOME/gnome-shell"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  accountsservice
  at-spi2-core
  bash
  cairo
  dconf
  gcc-libs
  gcr-4
  gdk-pixbuf2
  gjs
  glib2
  glibc
  gnome-autoar
  gnome-desktop-4
  gnome-session
  gnome-settings-daemon
  graphene
  gsettings-desktop-schemas
  gtk4
  hicolor-icon-theme
  json-glib
  libadwaita
  libcanberra-pulse
  libgdm
  libgirepository
  libglvnd
  libgweather-4
  libibus
  libical
  libnm
  libnma-gtk4
  libpipewire
  libpulse
  libsecret
  libsoup3
  libx11
  libxfixes
  mutter-git #we need mutter-clutter 16, currently only 15 in base mutter
  pango
  polkit
  systemd-libs
  unzip
  upower
  webkitgtk-6.0
)
makedepends=(
  asciidoc
  bash-completion
  evolution-data-server
  gi-docgen
  git
  glib2-devel
  gnome-keybindings
  gobject-introspection
  meson
  python-docutils
  sassc
)
source=(
  # GNOME Shell tags use SSH signatures which makepkg doesnt understand
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=5f9768a2eac29c1ed56f1fbb449a77a3523683b6"
)
b2sums=('SKIP'
        'e31ae379039dfc345e8032f7b9803a59ded075fc52457ba1553276d3031e7025d9304a7f2167a01be2d54c5e121bae00a2824a9c5ccbf926865d0b24520bb053')

pkgver() {
  cd gnome-shell
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  # Inject gvc
  ln -s libgnome-volume-control gvc
  cd gnome-shell
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D tests=false
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  # Inject gvc
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson gnome-shell build "${meson_options[@]}"
  meson compile -C build
}

package_gnome-shell-git() {
  provides=(gnome-shell)
  conflicts=(gnome-shell)
  depends+=(libmutter-16.so)
  optdepends=(
    'evolution-data-server: Evolution calendar integration'
    'gnome-bluetooth-3.0: Bluetooth support'
    'gnome-control-center: System settings'
    'gnome-disk-utility: Mount with keyfiles'
    'gst-plugin-pipewire: Screen recording'
    'gst-plugins-good: Screen recording'
    'power-profiles-daemon: Power profile switching'
    'python-gobject: gnome-shell-test-tool performance tester'
    'python-simplejson: gnome-shell-test-tool performance tester'
    'switcheroo-control: Multi-GPU support'
  )
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_gnome-shell-docs-git() {
  provides=(gnome-shell-docs)
  conflicts=(gnome-shell-docs)
  pkgdesc+=" (API documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:


