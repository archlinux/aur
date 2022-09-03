# Maintainer: TommyTran732
# https://gitlab.manjaro.org/packages/extra/pamac

#Set this flag to 0 if you want to use pamac-tray-icon-plasma
ENABLE_APPINDICATOR=1

pkgname=pamac-flatpak
pkgver=10.4.2
pkgrel=1
_pkgfixver=$pkgver

pkgdesc="A Gtk3 frontend for libalpm (with AUR, Flatpak and AppIndicator support)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('libnotify' 'libpamac-flatpak' 'libhandy' 'git' 'fakeroot' 'pkgconf')
makedepends=('gettext' 'itstool' 'vala>=0.45' 'meson' 'gobject-introspection' 'xorgproto' 'asciidoc')
conflicts=('pamac' 'pamac-cli' 'pamac-gtk' 'pamac-qt' 'pamac-classic' 'pamac-aur' 'pamac-aur-git' 'pamac-all' 'pamac-all-git' 'pamac-flatpak-gnome' 'pacmac-nosnap')
provides=('pamac')
options=(!emptydirs)
install=pamac.install
source=("pamac-$pkgver.tar.gz::$url/-/archive/v$pkgver/pamac-v$pkgver.tar.gz") 
sha256sums=('8b5b2298e16bcfc6fbdfbf2e2cd77cb9cd769d9faa503dd8fec35c18f37b52589ffda670dc9299a8f4962f039ba870007b4601a2610ac0fc298f64a4f8e67eeb')

prepare() {
  cd "$srcdir/pamac-v$pkgver"
  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cd "$srcdir/pamac-v$pkgver"
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc --buildtype=release -Denable-fake-gnome-software=true
  # build
  ninja
}

package() {
  cd "$srcdir/pamac-v$pkgver/builddir"

  DESTDIR="$pkgdir" ninja install
  # remove pamac-gnome-integration
  rm "$pkgdir/usr/bin/gnome-software"
  rm "$pkgdir/usr/share/applications/org.gnome.Software.desktop"
  rm "$pkgdir/usr/share/dbus-1/services/org.gnome.Software.service"

}
# vim:set ts=2 sw=2 et: