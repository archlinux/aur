# Maintainer: Ewout van Mansom (emansom) <ewout@vanmansom.name>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-beta-performance
pkgver=47.beta.r24.g36e42ba
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
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
  mutter
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
  sassc
)
_shell_commit=36e42badd099e6096c36e64928d195e76a0358f1
_libgnome_volume_control_commit=5f9768a2eac29c1ed56f1fbb449a77a3523683b6
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_shell_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=$_libgnome_volume_control_commit"
)
b2sums=('d8d02aa2f7e69fc94afc0535b65690d7e43536f7d504e9d347b74c34c16c36237e9b21c7c918ca4b84f95032e40e365226b462540aabe028040b36f71622d59c'
        'e31ae379039dfc345e8032f7b9803a59ded075fc52457ba1553276d3031e7025d9304a7f2167a01be2d54c5e121bae00a2824a9c5ccbf926865d0b24520bb053')

pkgver() {
  cd gnome-shell
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # Inject gvc
  ln -s libgnome-volume-control gvc
}

build() {
  local meson_options=(
    -D gtk_doc=false
    -D tests=false
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  # Inject gvc
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson gnome-shell build "${meson_options[@]}"
  meson compile -C build
}

package() {
  provides=(gnome-shell gnome-shell=$pkgver gnome-shell=$epoch:$pkgver)
  conflicts=(gnome-shell)
  depends+=(libmutter-15.so)
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
}

# vim:set sw=2 sts=-1 et:
