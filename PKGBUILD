# Maintainer: TommyTran732
# https://gitlab.manjaro.org/packages/extra/pamac

pkgname=pamac-flatpak-gnome
pkgver=10.2.0
pkgrel=1
_pkgfixver=$pkgver

pkgdesc="A Gtk3 frontend for libalpm (with AUR, Flatpak, AppIndicator support, and GNOME integration)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('libnotify' 'libpamac-flatpak' 'libhandy' 'libappindicator-gtk3' 'git' 'fakeroot' 'pkgconf')
makedepends=('gettext' 'itstool' 'vala>=0.45' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc')
conflicts=('pamac' 'pamac-cli' 'pamac-gtk' 'pamac-qt' 'pamac-classic' 'pamac-aur' 'pamac-aur-git' 'pamac-all' 'pamac-all-git' 'pamac-flatpak' 'gnome-software' 'pamac-tray-appindicator')
provides=('pamac' 'gnome-software')
options=(!emptydirs)
install=pamac.install
source=("pamac-$pkgver.tar.gz::$url/-/archive/v$pkgver/pamac-v$pkgver.tar.gz") 
sha256sums=('d553ead69b27b94f039816e7faca462b01883778db39a55cc6cd579bd22a7b4b')

prepare() {
  cd "$srcdir/pamac-v$pkgver"
  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cd "$srcdir/pamac-v$pkgver"
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc -Denable-flatpak=true -Denable-appindicator=true -Denable-fake-gnome-software=true --buildtype=release
  ninja
}

package() {
  cd "$srcdir/pamac-v$pkgver/builddir"
  DESTDIR="$pkgdir" ninja install
}