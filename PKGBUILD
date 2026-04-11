# Maintainer: Médéric Boquien <mboquien@free.fr>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgbase=gnome-shell-multiseat
pkgname=(
  gnome-shell-multiseat
  gnome-shell-multiseat-docs
)
provides=(gnome-shell)
conflicts=(gnome-shell)
pkgver=50.0
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell with multiseat support"
url="https://gitlab.gnome.org/GNOME/gnome-shell"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  accountsservice
  at-spi2-core
  bash
  cairo
  dconf
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
  ibus
  json-glib
  libadwaita
  libcanberra-pulse
  libgcc
  libgdm
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
  libxext
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
  python-docutils
  sassc
)
source=(
  # GNOME Shell tags use SSH signatures which makepkg doesn't understand
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=d2442f455844e5292cb4a74ffc66ecc8d7595a9f"
  "git+https://github.com/ptomato/jasmine-gjs.git#commit=856465dddbd92e82e574891e1ebc79e17d7b708a"
  "git+https://gitlab.gnome.org/GNOME/libshew.git#commit=d16afc40412b565d2bbecf80335f54a19a978009"
  2230.patch
)
b2sums=('1dc5c04956466cf3d98498defdac415dbf54f2e49fd7f84e9c4e95ae20154a11a39101f834993d03ae306bad310787829e329f6420c3114a5ceadfc811a147cc'
        '8995bd33c011045c391169f044a46dbe42c55219d22fc1f52ec360b9cfb63b7b3a91bb07abb0f22ec7da39825a096bfa5fff9a5080d4d3919286156aeac392e5'
        'ecbbb9ce5895cc1caed2ddef39c70b4768d78ea0a929ea932d4149f923f92650973cdaefc2aacc9063f2ccf4ec965b57a9698a286f9a6561e39ce2e579ae4522'
        '7b39ef786d0af34f207c36c078fda5410848a5eceb84509b145184be1dbb994aeb3ffa70cb3de363a8460d59c140aafbdee8f74312cf2971a80cc5d485f1b829'
        '380852c5a52acd350157703fc0b9cb8c9be0d819c43daa0ab035899e6693e732478adba7747bfae73f135552d7b90e337864b328edf12b79aa25d638d058deff')

prepare() {
  # Inject gvc
  ln -s libgnome-volume-control gvc

  cd gnome-shell
  git apply -3 ../2230.patch  
}

build() {
  local meson_options=(
    -D gtk_doc=true
    -D tests=false
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  # Inject subprojects
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson gnome-shell build "${meson_options[@]}"
  meson compile -C build
}

package_gnome-shell-multiseat() {
  depends+=(libmutter-18.so)
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

package_gnome-shell-multiseat-docs() {
  pkgdesc+=" (API documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
