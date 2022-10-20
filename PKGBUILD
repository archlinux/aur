# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: LSUtigers3131
# https://gitlab.manjaro.org/packages/extra/pamac

_pkgname=pamac
pkgname=${_pkgname}-all
pkgver=10.4.2
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
install=pamac.install
source=("pamac-$pkgver.tar.gz::$url/-/archive/v$pkgver/pamac-v$pkgver.tar.gz") 
sha256sums=('1ec8fa2a555bb407aab473208d4c07363c0023e03c06475c3097c79b98aca856')

_srcdir="$_pkgname-v$pkgver"

prepare() {
  cd "$_srcdir"
  # adjust version string
  sed -i -e "s|\"$_pkgfixver\"|\"$pkgver-$pkgrel\"|g" 'src/version.vala'
}

build() {
  mkdir -p 'builddir'
  meson --prefix='/usr' --sysconfdir='/etc' --buildtype=release -Denable-fake-gnome-software=false \
    builddir "$_srcdir"
  # build
  meson compile -C 'builddir'
}

package() {
  meson install -C 'builddir' --destdir "$pkgdir"
  install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
