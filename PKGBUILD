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
pkgver=45.3
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
  gcr
  gdk-pixbuf2
  glib2
  glibc
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
_commit=4e107fa21250416812d64da8cf32946babb7728d  # tags/45.3^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/master/gnome-control-center-45.0-display-Allow-fractional-scaling-to-be-enabled.patch"
  "https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/master/gnome-control-center-45.0-display-Support-UI-scaled-logical-monitor-mode.patch"
  "https://gitlab.archlinux.org/archlinux/packaging/packages/gnome-control-center/-/raw/5549a8fdee89db942c46cae91a7e7dbfc8d41baf/0001-info-overview-Install-bare-logos-into-pixmaps-not-ic.patch"
  "https://gitlab.archlinux.org/archlinux/packaging/packages/gnome-control-center/-/raw/5549a8fdee89db942c46cae91a7e7dbfc8d41baf/0002-subprojects-Update-gvc-to-latest-commit.patch"
)
b2sums=('SKIP'
        'SKIP'
        '968494b571fa09217b45ac94e02e931b0761a73cfcadde879d7a5d66f5ccd420d521b39d2eaf6dcfcf77ac7edbf3e7e3cabee54323ab641f2dbf6c6a04b122e3'
        '7d0cd2fd2faa08ff5608b2e3965b6dafb829ff4de97c41b45a575126d926cb9c78197b0dc125e67d3007a5529559dbfba14039e64b658c788f7552af7c3146c1'
        'ae1401e0811658e10ff2317065aace8d4172530a322a4f71639737c6bc07621fdb9dae23ccabbee8a57cb00cadf93ea9c2cef2948aee432e2202dff070a95e4b'
        '587186a917094d98abb79adc031b463fb33d5f06f441b1895804510e13f83e8bfed2d9cebd6b013e2674f83c829cef4be97bda7dbd8d9ff5bf56d72235a0df6c')

pkgver() {
  cd $_pkgname
  git describe --tags | sed -r 's/\.([a-z])/\1/;s/([a-z])\./\1/;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $_pkgname

  # Install bare logos into pixmaps, not icons
  git apply -3 ../0001-info-overview-Install-bare-logos-into-pixmaps-not-ic.patch

  # Update libgnome-volume-control
  # Related to https://gitlab.archlinux.org/archlinux/packaging/packages/gnome-shell/-/issues/3
  git apply -3 ../0002-subprojects-Update-gvc-to-latest-commit.patch

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
}
