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
pkgver=44.4
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
_commit=abc71ea659f7c3efece766edb0365c78cc4b3df5  # tags/44.4^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  "display-Allow-fractional-scaling-to-be-enabled.patch::https://salsa.debian.org/gnome-team/gnome-control-center/-/raw/7da15e2567e77e1a589dc3135de2b4af119ecdde/debian/patches/ubuntu/display-Allow-fractional-scaling-to-be-enabled.patch"
  "display-Support-UI-scaled-logical-monitor-mode.patch::https://salsa.debian.org/gnome-team/gnome-control-center/-/raw/40a04c330a95e178463371bf8570d8e6258dd906/debian/patches/ubuntu/display-Support-UI-scaled-logical-monitor-mode.patch"
  "pixmaps-dir.diff::https://raw.githubusercontent.com/puxplaying/gnome-control-center-x11-scaling/8cafecb50c62f56dbe0a6cffb947b81aacbd4c41/pixmaps-dir.diff"
)
b2sums=('SKIP'
        'SKIP'
        '828fd901dab24a9741989201f314514c2b19676ce43b7b4b474bf5e850ec84e7adf448ca08654b26b887ec3f7fb6089b41d67871bc5ce85281a57c784e31ead1'
        'a7c10136b40ebd9e14eb21e3b1b65066d3e35524f7b1256f0a44094c39d8631ac8aa4e549e72cb096f43ac6f1e4853cc6935354b6c382989779189139be7d58f'
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
