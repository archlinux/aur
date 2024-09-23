# Maintainer: Ewout van Mansom (emansom) <ewout@vanmansom.name>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell-beta-performance
pkgver=47.0.r8.g8887c67
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
  libmutter-15.so
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
  python-docutils
)
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
provides=(gnome-shell gnome-shell=$pkgver gnome-shell=$epoch:$pkgver)
conflicts=(gnome-shell)
_shell_commit=8887c675037caeb33bab5995454561639c86a895
_libgnome_volume_control_commit=5f9768a2eac29c1ed56f1fbb449a77a3523683b6
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_shell_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=$_libgnome_volume_control_commit"
)
b2sums=('3c319752270e71b2085f7509a749ad229b5121774af9d8d5add7a78bfb759ae05cf00cd11f6f678aeccea18670914ca44ddb5503a4778fc3fdef23c315ec3b34'
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
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
