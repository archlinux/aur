# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Librewish <librewish@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac
ENABLE_FLATPAK=1
ENABLE_SNAPD=1
ENABLE_APPINDICATOR=1
ENABLE_GNOME=0

pkgname=pamac-all
pkgver=9.5.12
pkgrel=1
_pkgfixver=$pkgver

pkgdesc="A Gtk3 frontend for libalpm (everything in one package - snap, flatpak, appindicator)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.22'
         'libnotify' 'desktop-file-utils' 'pacman>=5.2' 'gnutls>=3.4' 'git'
         'appstream-glib' 'archlinux-appstream-data')

optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome')
makedepends=('gettext' 'itstool' 'vala>=0.45' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc')
backup=('etc/pamac.conf')
conflicts=('pamac' 'pamac-gtk' 'pamac-cli' 'pamac-common' 'pamac-aur' 'pamac-aur-git')
provides=("pamac")
options=(!emptydirs)
install=pamac.install
source=(
        "pamac-$pkgver.tar.gz::$url/-/archive/v$pkgver/pamac-v$pkgver.tar.gz"
#        "https://gitlab.manjaro.org/applications/pamac/-/commit/83ac80d7.patch"
       ) 
sha256sums=('ede6c663f5409bcf194a7a001f5fc0f7cbc7e328ff415f13d63a5d111a26a9e9')
define_meson=''
if [ "${ENABLE_FLATPAK}" = 1 ]; then
  depends+=('flatpak')
  define_meson+=' -Denable-flatpak=true'
  provides+=('pamac-flatpak-plugin')
  conflicts+=('pamac-flatpak-plugin')
fi

if [ "${ENABLE_SNAPD}" = 1 ]; then
  depends+=('snapd' 'snapd-glib')
  define_meson+=' -Denable-snap=true'
  provides+=('pamac-snap-plugin')
  conflicts+=('pamac-snap-plugin')
fi

if [ "${ENABLE_APPINDICATOR}" = 1 ]; then
  depends+=('libappindicator-gtk3')
  define_meson+=' -Denable-appindicator=true'
  provides+=('pamac-tray-appindicator' )
  conflicts+=('pamac-tray-appindicator' 'pamac-aur-tray-appindicator-git')
fi

if [ "${ENABLE_GNOME}" = 1 ]; then
  define_meson+=' -Denable-fake-gnome-software=true'
  provides+=("pamac-gnome-integration" 'gnome-software')
  conflicts+=("pamac-gnome-integration" 'gnome-software')
fi

prepare() {
  cd "$srcdir/pamac-v$pkgver"
  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cd "$srcdir/pamac-v$pkgver"
  mkdir -p builddir
  cd builddir
  meson --buildtype=release \
        --prefix=/usr \
        --sysconfdir=/etc $define_meson
  # build
  ninja
}

package() {
  cd "$srcdir/pamac-v$pkgver/builddir"

  DESTDIR="$pkgdir" ninja install
}
# vim:set ts=2 sw=2 et:
