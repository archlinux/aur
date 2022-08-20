# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=pamac
pkgname=$_pkgname-nosnap
pkgver=10.4.2
pkgrel=1

pkgdesc="A Gtk3 frontend from Manjaro Linux for libalpm with AUR, flatpak, and appindicator support."
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('libnotify' 'libpamac-nosnap>=10.3.0' 'libhandy')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'fwupd: support firmware updates')
makedepends=('gettext' 'itstool' 'vala>=0.45' 'meson' 'gobject-introspection' 'xorgproto' 'asciidoc')
conflicts=('pamac' 'pamac-all' 'pamac-gtk' 'pamac-cli' 'pamac-common' 'pamac-aur' 'pamac-aur-git' 'pamac-flatpak' 'pamac-flatpak-gnome')
provides=('pamac')
options=(!emptydirs)
install=pamac.install
source=("$_pkgname-$pkgver.tar.bz2::$url/-/archive/v$pkgver/pamac-v$pkgver.tar.bz2")
sha512sums=('8b5b2298e16bcfc6fbdfbf2e2cd77cb9cd769d9faa503dd8fec35c18f37b52589ffda670dc9299a8f4962f039ba870007b4601a2610ac0fc298f64a4f8e67eeb')

prepare() {
  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" $srcdir/pamac-v$pkgver/src/version.vala
}

build() {
  arch-meson --buildtype=release -Denable-fake-gnome-software=true $srcdir/pamac-v$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  # remove pamac-gnome-integration
  rm "$pkgdir/usr/bin/gnome-software"
  rm "$pkgdir/usr/share/applications/org.gnome.Software.desktop"
  rm "$pkgdir/usr/share/dbus-1/services/org.gnome.Software.service"
}
