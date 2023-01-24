# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Librewish <librewish@gmail.com>
# https://gitlab.manjaro.org/packages/extra/pamac
_pkgname=pamac
pkgname=pamac-all-git
pkgver=10.4.3.r0.gd314d70
pkgrel=1
_pkgfixver=10.4.3
epoch=1

pkgdesc="A Gtk3 frontend for libalpm (everything in one package - snap, flatpak, appindicator)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('libnotify' 'libpamac-full' 'libhandy')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome')
makedepends=('gettext' 'itstool' 'vala>=0.45' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc')
conflicts=('pamac' 'pamac-gtk' 'pamac-cli' 'pamac-common' 'pamac-aur' 'pamac-aur-git' 'pamac-flatpak' 'pamac-flatpak-gnome' 'pamac-all')
provides=("$pkgname")
options=(!emptydirs)
install=pamac.install
source=(git+https://gitlab.manjaro.org/applications/$_pkgname.git)
sha256sums=('SKIP')

_srcdir="$_pkgname"
pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

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
