# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: Mark Wagie <mark@manjaro.org>
# Contributor: realqhc <https://github.com/realqhc>
# Contributor: Brett Alcox <https://github.com/brettalcox>

# Arch credits:
# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# Ubuntu credits:
# Robert Ancell: <https://salsa.debian.org/gnome-team/gnome-control-center>
# Marco Trevisan: <https://salsa.debian.org/gnome-team/mutter/-/blob/ubuntu/master/debian/patches/x11-Add-support-for-fractional-scaling-using-Randr.patch>

pkgbase=gnome-control-center-x11-scaling
pkgname=(
  gnome-control-center-x11-scaling
  gnome-keybindings-x11-scaling
)
_pkgname=gnome-control-center
pkgver=46.1
pkgrel=5
pkgdesc="GNOME's main interface to configure various aspects of the desktop with X11 fractional scaling patch"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
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
)
makedepends=(
  docbook-xsl
  git
  meson
  modemmanager
  python
  python-packaging
)
checkdepends=(
  python-dbusmock
  python-gobject
  xorg-server-xvfb
)
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-control-center.git?signed#tag=$pkgver"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/4f2e5597f3af2694ed48d439d6c0cdd95d9e0315/display-Allow-fractional-scaling-to-be-enabled.patch"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/4f2e5597f3af2694ed48d439d6c0cdd95d9e0315/display-Support-UI-scaled-logical-monitor-mode.patch"
)
b2sums=('f066316f436f7d58b9341daa346bb173fbeee2a302a7b3f1b0db878aabd2deb20c736b5a08beef7612f4366bbc84a82a2fee12dc1ff39344cc5f493e2b099677'
        'SKIP'
        'aa18237b6d8133405dc67740dd995a80b57f474e0976c7fd0d69883223c04d12673d452cf90be39232363abeff827beaf57b1183da4d15768df7b331a144c5ff'
        'ffb66f54504ffb81d32a07383527864fb4ee7ad3b5d7af55682607f3c09addec08485156bda7bac56088304d20720914958103cd492f270b59fcad47875b3a5b')
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
    -D documentation=false
    -D location-services=enabled
    -D malcontent=true
  )

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

  depends+=(gnome-keybindings)
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
