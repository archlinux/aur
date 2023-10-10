# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: Mark Wagie <mark@manjaro.org>
# Contributor: realqhc <https://github.com/realqhc>
# Contributor: Brett Alcox <https://github.com/brettalcox>

# Arch credits:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# Ubuntu credits:
# Robert Ancell: <https://salsa.debian.org/gnome-team/gnome-control-center>
# Marco Trevisan: <https://salsa.debian.org/gnome-team/mutter/-/blob/ubuntu/master/debian/patches/x11-Add-support-for-fractional-scaling-using-Randr.patch>

pkgname=gnome-control-center-x11-scaling
_pkgname=gnome-control-center
pkgver=45.0
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop with X11 fractional scaling patch"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL3)
arch=(x86_64)
depends=(
  accountsservice
  bolt
  cairo
  colord-gtk4
  cups-pk-helper
  dconf
  fontconfig
  gcr
  gdk-pixbuf2
  glib2
  gnome-bluetooth-3.0
  gnome-color-manager
  gnome-desktop-4
  gnome-online-accounts
  gnome-settings-daemon
  gnutls
  gsettings-desktop-schemas
  gsound
  gtk3
  gtk4
  hicolor-icon-theme
  krb5
  libadwaita
  libcolord
  libcups
  libepoxy
  libgnomekbd
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
)
checkdepends=(
  python-dbusmock
  python-gobject
  xorg-server-xvfb
)
optdepends=(
  'fwupd: device security panel'
  'gnome-remote-desktop: screen sharing'

  # Cannot be a depend because when gnome-shell checkdepends on
  # gnome-control-center depends on gnome-shell depends on libmutter-12.so, it
  # makes building gnome-shell against libmutter-13.so impossible
  'gnome-shell: multitasking panel'

  'gnome-user-share: WebDAV file sharing'
  'malcontent: application permission control'
  'networkmanager: network settings'
  'openssh: remote login'
  'power-profiles-daemon: power profiles'
  'rygel: media sharing'
  'system-config-printer: printer settings'
)
groups=(gnome)
conflicts=($_pkgname)
provides=($_pkgname)
_commit=e4d0d5abf9cb716cb01cda17751b162d4bfea5b0  # tags/45.0^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/master/gnome-control-center-45.0-display-Allow-fractional-scaling-to-be-enabled.patch"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/master/gnome-control-center-45.0-display-Support-UI-scaled-logical-monitor-mode.patch"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/8cafecb50c62f56dbe0a6cffb947b81aacbd4c41/pixmaps-dir.diff"
)
b2sums=('SKIP'
        'SKIP'
        '968494b571fa09217b45ac94e02e931b0761a73cfcadde879d7a5d66f5ccd420d521b39d2eaf6dcfcf77ac7edbf3e7e3cabee54323ab641f2dbf6c6a04b122e3'
        '7d0cd2fd2faa08ff5608b2e3965b6dafb829ff4de97c41b45a575126d926cb9c78197b0dc125e67d3007a5529559dbfba14039e64b658c788f7552af7c3146c1'
        '2a73d860ee17a40d847f9afc0e4be7f54b3bf8b67c133b6b61bffe83ca58de6542aea0ed96c8e4e104ee80e6089fb8c493048b95c6dae68f115826ce4984f315')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # Install bare logos into pixmaps, not icons
  git apply -3 ../pixmaps-dir.diff

  git submodule init subprojects/gvc
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update

  # Support UI scaled logical monitor mode (Marco Trevisan, Robert Ancell)
  patch -p1 -i "${srcdir}/gnome-control-center-45.0-display-Support-UI-scaled-logical-monitor-mode.patch"
  patch -p1 -i "${srcdir}/gnome-control-center-45.0-display-Allow-fractional-scaling-to-be-enabled.patch"
}

build() {
  local meson_options=(
    -D documentation=true
    -D malcontent=true
  )

  arch-meson $_pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  GTK_A11Y=none dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
