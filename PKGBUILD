# Maintainer: Georg Wagner <puxplaying_at_gmail_dot_com>
# Contributor: Mark Wagie <mark@manjaro.org>
# Contributor: realqhc <https://github.com/realqhc>

# Arch credits:
# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# Ubuntu credits:
# Robert Ancell: <https://salsa.debian.org/gnome-team/gnome-control-center>
# Marco Trevisan: <https://salsa.debian.org/gnome-team/mutter/-/blob/ubuntu/master/debian/patches/x11-Add-support-for-fractional-scaling-using-Randr.patch>

pkgname=gnome-control-center-x11-scaling
_pkgname=gnome-control-center
pkgver=44.3
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop with X11 fractional scaling patch"
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
groups=(gnome)
conflicts=($_pkgname)
provides=($_pkgname)
_commit=6af9a48c3238114dab6480f1fb3bdc818dc4a647  # tags/44.3^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "display-Allow-fractional-scaling-to-be-enabled.patch::https://salsa.debian.org/gnome-team/gnome-control-center/-/raw/7da15e2567e77e1a589dc3135de2b4af119ecdde/debian/patches/ubuntu/display-Allow-fractional-scaling-to-be-enabled.patch"
  "display-Support-UI-scaled-logical-monitor-mode.patch::https://salsa.debian.org/gnome-team/gnome-control-center/-/raw/40a04c330a95e178463371bf8570d8e6258dd906/debian/patches/ubuntu/display-Support-UI-scaled-logical-monitor-mode.patch"
  "pixmaps-dir.diff::https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/8cafecb50c62f56dbe0a6cffb947b81aacbd4c41/pixmaps-dir.diff"
)
sha256sums=('SKIP'
            'SKIP'
            'f3c38a57880818101fe0fb05fbadea584ebd894df522984ec73810a244bb7043'
            '0afe763b4faa2f6cc2b7792fa2384682c8cf47a3ace1aab8f173cceca6eebfa6'
            '8695bc08c06026b7bfdd43941b4e07bb3ffbaa4e709be0b23ee138d24b6dbc8f')

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
  patch -p1 -i "${srcdir}/display-Support-UI-scaled-logical-monitor-mode.patch"
  patch -p1 -i "${srcdir}/display-Allow-fractional-scaling-to-be-enabled.patch"
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
  GTK_A11Y=none meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
