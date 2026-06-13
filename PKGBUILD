# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgbase=gnome-shell-hdr-update
_pkgbase=gnome-shell
pkgname=(
  gnome-shell-hdr-update
  gnome-shell-hdr-update-docs
)
pkgver=50.2
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell (with patches)"
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
  mutter-hdr-update
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
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=0a4eda0cdc2deb352bebc70ec697c42af46094e4"
  "git+https://github.com/ptomato/jasmine-gjs.git#commit=856465dddbd92e82e574891e1ebc79e17d7b708a"
  "git+https://gitlab.gnome.org/GNOME/libshew.git#commit=d16afc40412b565d2bbecf80335f54a19a978009"
  0001-Fix-build-with-libical-4.patch
  "gnome-shell-hdr-screenshots.patch::https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/4223.patch"
)
b2sums=('7b58c5f0b1cd9d0207f7e7d71f4f201b5f0dea23a1c24f6726fd88f38cf5aef7f705d2138274eac16b8d85e6ca889d531c008f87001adfcaba1f2ea555276b26'
        'b3ff7babceb21522cbdc8f2d11b00fe7c83a820250629f79831b42c4802613aa116a0df58038c76d9948c452c27cd47eca7a0172f06800df571c90f8671c0b6c'
        'ecbbb9ce5895cc1caed2ddef39c70b4768d78ea0a929ea932d4149f923f92650973cdaefc2aacc9063f2ccf4ec965b57a9698a286f9a6561e39ce2e579ae4522'
        '7b39ef786d0af34f207c36c078fda5410848a5eceb84509b145184be1dbb994aeb3ffa70cb3de363a8460d59c140aafbdee8f74312cf2971a80cc5d485f1b829'
        'a27041bbe347c4f23bfa6a06f1fd523a907c95ad5c222b5f38fe159912844ae5e885869305ca692c5d668a37bb24ec395128ca097b35a7cda180e1bf0a6de2af'
        'SKIP')

prepare() {
  # Inject gvc
  ln -s libgnome-volume-control gvc

  cd $_pkgbase
  git apply -3 ../0001-Fix-build-with-libical-4.patch

  git apply -3 ../gnome-shell-hdr-screenshots.patch # HDR screen shots
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

  arch-meson $_pkgbase build "${meson_options[@]}"
  meson compile -C build
}

package_gnome-shell-hdr-update() {
  depends+=(libmutter-18.so)
  provides=(gnome-shell)
  conflicts=(gnome-shell)
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

package_gnome-shell-hdr-update-docs() {
  pkgdesc+=" (API documentation)"
  provides=(gnome-shell-docs)
  conflicts=(gnome-shell-docs)
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
