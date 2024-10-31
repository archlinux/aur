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
pkgver=47.1.1
pkgrel=2
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
  "git+https://gitlab.gnome.org/GNOME/gnome-control-center.git?signed#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/9908feab583115670991929d4334601f43fcf786/display-Allow-fractional-scaling-to-be-enabled.patch"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/c3a04acf0cd0f9f48c938c6b34b391d9aedb2b58/display-Support-UI-scaled-logical-monitor-mode.patch"
)
b2sums=('1edf322c66ca62986bfe79c0e4cd9552aaa937d124552f49769d406cdf9a1219ea4c74a72b6a48e6b6ca9c8c50e6b58a67bf43ae33b9f254f6b06fba4142af8c'
        'SKIP'
        '7f580b64e491d4dd4ee89da00d0e98cd50780dee1d1a4665e54e3e6f46d9c3291d1695e3f2920e7c5686f2f57fa4bbb430d56dda4ad87f8046990f3f2db4cecb'
        '85002082e967f63284a1b95a0f2dc19590a46c1711ebf6ed934094a85a4a1b20c1336e9b6e9a0e37b5235bbe217ee0b6851a06bcc1e282242a0676b9080a0eac')
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

