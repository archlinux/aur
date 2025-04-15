# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributer: TommyTran732 <contact@tommytran.io>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-flatpak
pkgver=11.7.2
_commit=71ced277e5931ccea2433ece291430481a2694ee
pkgrel=2
pkgdesc="A GUI frontend for libalpm. With Flatpak support"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=(
    'desktop-file-utils'
    'gnutls'
    'gtk4'
    'libadwaita'
    'libhandy'
    'libnotify'
    'libpamac-flatpak' 
)
optdepends=(
    'lxsession: needed for authentification in Xfce, LXDE etc.'
    'polkit-gnome: needed for authentification in Cinnamon, Gnome'
    'plymouth: offline upgrades'
)
makedepends=(
    'asciidoc'
    'gettext'
    'git'
    'gobject-introspection'
    'itstool'
    'meson'
    'ninja'
    'vala'
    'xorgproto'
)
provides=("pamac=$pkgver-$pkgrel")
conflicts=(
    'pamac'
    'pamac-aur'
    'pamac-all'
    'pamac-nosnap'
)
options=(!emptydirs)
source=("git+${url}.git#commit=${_commit}")
sha256sums=('b7166976642b21e9ce22c9f0a0b6a2708ffe4f1c91cf9ec3b52231d2eb13d66e')

#_srcdir="$_pkgname-$pkgver"

pkgver() {
  cd "$_pkgname"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$_pkgname"
	# adjust version string
	sed -i -e "s|\"$pkgver\"|\"$pkgver-$pkgrel\"|g" 'src/version.vala'
}

build() {
	arch-meson "$_pkgname" 'build' -Denable-fake-gnome-software=false
	meson compile -C 'build'
}

package() {
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_pkgname/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
