# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgbase=gnome-shell-rounded-blur
pkgname=(
  gnome-shell-rounded-blur
  gnome-shell-rounded-blur-docs
)
provides=('gnome-shell')
conflicts=('gnome-shell')
options=(!debug)
pkgver=49.4
pkgrel=2
epoch=1
pkgdesc="GNOME Shell patched with rounded blur mask (ref. https://github.com/aunetx/blur-my-shell/issues/594#issuecomment-3317236854)"
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
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=664eba4c054ecc4a140f0ef01ae9297422b71fdc"
  "git+https://github.com/ptomato/jasmine-gjs.git#commit=856465dddbd92e82e574891e1ebc79e17d7b708a"
  "git+https://gitlab.gnome.org/GNOME/libshew.git#commit=ed782477cb5164320ae4f731d49bc5d475ab2a52"
  "Shell_BlurEffect__rounded_corners_mask.patch"
)
b2sums=('7e2079dab10382dd2df991504f712d2c1cc6696393990d1041073807fb7cba16fd561f5fda92dd3e974f37c33e41d957a67959c86076de6b9b97923d46358094'
        '535b45732b09204639930a88f6578f5d3e81239aed857c12cf084351a6ecd45fff262da6ff9f74ac48d1d7a92b1a90dbe708a4e8131f789aace7e27482220a9a'
        'ecbbb9ce5895cc1caed2ddef39c70b4768d78ea0a929ea932d4149f923f92650973cdaefc2aacc9063f2ccf4ec965b57a9698a286f9a6561e39ce2e579ae4522'
        'ec120324e4fe90fb8017847e5eda3c0b181b6609b78610b3a61ea106ee4d56d2b3bf243c3bc5d3ddd59fe55bb5ceed4f55b41f09626137027ed1c3e27930d082'
        '3bcb9a4271376dba7b11a0d59d5fb1db70b395188c0584c473d652971bfbcad2bc6dfa5202ff90ba6fccea58f5d87829d87b449d9370e310fb8c6580778efe81')

prepare() {
  # Inject gvc
  ln -s libgnome-volume-control gvc

  cd gnome-shell
  patch -p1 -i "$srcdir/Shell_BlurEffect__rounded_corners_mask.patch"
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

package_gnome-shell-rounded-blur() {
  depends+=(libmutter-17.so)
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

  install -Dm644 /dev/stdin "$pkgdir/usr/share/glib-2.0/schemas/30_org.archlinux.$pkgname.gschema.override" <<END
[org.gnome.mutter:GNOME]
experimental-features=['scale-monitor-framebuffer', 'variable-refresh-rate', 'xwayland-native-scaling']
END

  mkdir -p doc/usr/share
  mv {"$pkgdir",doc}/usr/share/doc
}

package_gnome-shell-rounded-blur-docs() {
  pkgdesc+=" (API documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
