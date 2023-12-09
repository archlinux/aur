# Maintainer: Lawstorant <forest10pl@gmail.com>

pkgname=gnome-control-center-vrr
pkgver=45.2
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop (with VRR toggle)"
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
  'gnome-shell: multitasking panel'
  'gnome-user-share: WebDAV file sharing'
  'malcontent: application permission control'
  'networkmanager: network settings'
  'openssh: remote login'
  'power-profiles-daemon: power profiles'
  'rygel: media sharing'
  'system-config-printer: printer settings'
)
conflicts=(gnome-control-center)
provides=(gnome-control-center)
groups=(gnome)
_commit=cc5da95fecaeb5486435c54917edf9633addc02d  # tags/45.2^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "pixmaps-dir.diff"
  "734.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '6f9e9c8607b9a3b7efe5a17a98a9d1db8b7321d0d1b3bca30b45790bd438d91e'
  'bc61c282a1c4496b77e40463fe0644998928f627b112edf7e5a46114c3de93f4'
)

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "$srcdir"
  mv gnome-control-center gnome-control-center-vrr
  cd "$pkgname"

  # Install bare logos into pixmaps, not icons
  git apply -3 ../pixmaps-dir.diff

  # Apply the VRR MR
  patch -p1 <../734.patch

  git submodule init subprojects/gvc
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  local meson_options=(
    -D documentation=false
    -D malcontent=true
  )

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  GTK_A11Y=none meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
