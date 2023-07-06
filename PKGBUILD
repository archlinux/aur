# Maintainer: Lawstorant <forest10pl@gmail.com>

pkgname=gnome-control-center-vrr
pkgver=44.3
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop (with VRR toggle)"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL3)
arch=(x86_64)
depends=(
  accountsservice
  bolt
  colord-gtk4
  cups-pk-helper
  gcr
  gnome-bluetooth-3.0
  gnome-color-manager
  gnome-desktop-4
  gnome-online-accounts
  gnome-settings-daemon
  gnome-shell
  gsettings-desktop-schemas
  gsound
  gtk4
  libadwaita
  libgnomekbd
  libgtop
  libgudev
  libibus
  libmalcontent
  libmm-glib
  libnma-gtk4
  libpwquality
  smbclient
  sound-theme-freedesktop
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
_commit=6af9a48c3238114dab6480f1fb3bdc818dc4a647  # tags/44.3^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "pixmaps-dir.diff"
  "734.patch"
)
sha256sums=(
  'SKIP'
  'SKIP'
  '8695bc08c06026b7bfdd43941b4e07bb3ffbaa4e709be0b23ee138d24b6dbc8f'
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
  patch -p1 < ../734.patch

  git submodule init subprojects/gvc
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}


build() {
  local meson_options=(
    -D documentation=true
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
