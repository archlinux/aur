# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>
# Contributor: LSUtigers3131
# https://gitlab.manjaro.org/packages/extra/pamac

_pkgname=pamac
pkgname=${_pkgname}-all
pkgver=10.5.1
pkgrel=1
_pkgfixver=$pkgver

pkgdesc="A Gtk3 frontend for libalpm (everything in one package - snap, flatpak, appindicator)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('libnotify' 'libpamac-full' 'libhandy')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome')
makedepends=('gettext' 'itstool' 'vala>=0.45' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc')
conflicts=('pamac' 'pamac-gtk' 'pamac-cli' 'pamac-common' 'pamac-aur' 'pamac-aur-git' 'pamac-flatpak' 'pamac-flatpak-gnome')
provides=("pamac=$pkgver-$pkgrel")
options=(!emptydirs)
install='pamac.install'
source=("pamac-$pkgver.tar.gz::$url/-/archive/v$pkgver/pamac-v$pkgver.tar.gz") 
sha256sums=('97dd93d2cf56999c7d96f08aeb18ab54b704adb41c7a2c6f856aa9e376986bc9')

_srcdir="$_pkgname-v$pkgver"

prepare() {
  cd "$_srcdir"
  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" 'src/version.vala'
}

build() {
  arch-meson "$_srcdir" 'build' -Denable-fake-gnome-software=false
  meson compile -C 'build'
}

package() {
  meson install -C 'build' --destdir "$pkgdir"
  install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
