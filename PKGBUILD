# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: Mark Wagie <mark@manjaro.org>
# Contributor: realqhc <https://github.com/realqhc>
# Contributor: Brett Alcox <https://github.com/brettalcox>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# Ubuntu patches:
# https://salsa.debian.org/gnome-team/gnome-control-center/-/tree/ubuntu/latest/debian/patches/ubuntu

pkgbase=gnome-control-center-x11-scaling
pkgname=(
  gnome-control-center-x11-scaling
  gnome-keybindings-x11-scaling
)
_pkgname=gnome-control-center
pkgver=48.0
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop with X11 fractional scaling patch"
url="https://apps.gnome.org/Settings/"
license=(GPL-2.0-or-later)
arch=(x86_64)
depends=(
  accountsservice
  bolt
  cairo
  colord-gtk4
  cups-pk-helper
  dconf
  fontconfig
  gcc-libs
  gcr-4
  gdk-pixbuf2
  glib2
  glibc
  gnome-bluetooth-3.0
  gnome-color-manager
  gnome-desktop-4
  gnome-online-accounts
  gnome-settings-daemon
  gnome-shell
  gnutls
  graphene
  gsettings-desktop-schemas
  gsound
  gst-plugins-good
  gtk4
  hicolor-icon-theme
  json-glib
  krb5
  libadwaita
  libcolord
  libcups
  libepoxy
  libgoa
  libgtop
  libgudev
  libibus
  libmalcontent
  libmm-glib
  libnm
  libnma-gtk4
  libpulse
  libpwquality
  libsecret
  libsoup3
  libwacom
  libx11
  libxi
  libxml2
  pango
  polkit
  smbclient
  sound-theme-freedesktop
  tecla
  udisks2
  upower
  wayland
)
makedepends=(
  docbook-xsl
  git
  glib2-devel
  meson
  modemmanager
)
checkdepends=(
  python-dbusmock
  python-gobject
  xorg-server-xvfb
)
source=(
  # GNOME Control Center tags use SSH signatures which makepkg doesn't understand
  "git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "git+https://gitlab.gnome.org/GNOME/libgxdp.git#commit=e68375c7aced97705953b8e3b30af9f17991153b"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/80b6d7518a30fb8244a4fa1b1ea447d221337c99/display-Allow-fractional-scaling-to-be-enabled.patch"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/80b6d7518a30fb8244a4fa1b1ea447d221337c99/display-Support-UI-scaled-logical-monitor-mode.patch"
)
b2sums=('47752f5a016cb60db862f704bd6e328f794927fcd78899bcb1a4aea0c4927826949246786eeca9e9367b8a5cc7531fe676a0550c05955233f278a35eafbd591e'
        'SKIP'
        '09bd02a627afffa49c11e4baec961878060d7710e852628c0e0d009d5bdc37eaa3cd1d5bbeea316f197197b9d88436ecf157ebaef41e01b66ad102e1f1c69fb2'
        '83ea0c8460a195ae202faa782a266c52000ddff046059cf93eb22aab871c92b3f4525b6ebb87e25c0f1b6cc541bffc6980db3f1e23352c2709a4cfa6ceea6fdb'
        '941d6c00d5d9d6ca0370854735f7272bbccf7aa9a272ab76c6f9a78641fde78ab1634d0764192b74772d710ec4e2c64ce0de2eceddeabc15ac7f7ce1532ef585')
validpgpkeys=(
  9B60FE7947F0A3C58136817F2C2A218742E016BE # Felipe Borges (GNOME) <felipeborges@gnome.org>
)

prepare() {
  cd $_pkgname

  git submodule init subprojects/gvc
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always -c protocol.allow=never submodule update

  # Support UI scaled logical monitor mode (Marco Trevisan, Robert Ancell)
  patch -p1 -i "${srcdir}/display-Support-UI-scaled-logical-monitor-mode.patch"
  patch -p1 -i "${srcdir}/display-Allow-fractional-scaling-to-be-enabled.patch"
}

build() {
  local meson_options=(
    -D documentation=true
    -D location-services=enabled
    -D malcontent=true
  )

  # Inject libgxdp
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  GTK_A11Y=none dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    meson test -C build --print-errorlogs
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

package_gnome-control-center-x11-scaling() {
  conflicts=($_pkgname)
  provides=($_pkgname)

  depends+=(gnome-keybindings-x11-scaling)
  optdepends=(
    'fwupd: device security panel'
    'gnome-remote-desktop: screen sharing'
    'gnome-user-share: WebDAV file sharing'
    'malcontent: application permission control'
    'networkmanager: network settings'
    'openssh: remote login'
    'power-profiles-daemon: power profiles'
    'rygel: media sharing'
    'system-config-printer: printer settings'
  )
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"
  _pick gkb usr/share/gettext/its/gnome-keybindings.*
  _pick gkb usr/share/gnome-control-center/keybindings
  _pick gkb usr/share/pkgconfig/gnome-keybindings.pc
}

package_gnome-keybindings-x11-scaling() {
  conflicts=(gnome-keybindings)
  provides=(gnome-keybindings)
  
  pkgdesc="Keybindings configuration for GNOME applications"
  depends=()

  mv gkb/* "$pkgdir"
}
