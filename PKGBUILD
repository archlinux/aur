# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributer: TommyTran732 <contact@tommytran.io>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-flatpak
pkgver=11.7.4
_commit=188905011b64f385c72c5c8f795237bf894390fa            
pkgrel=1
pkgdesc="A GUI frontend for libalpm. With Flatpak support"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
    'libadwaita'
    'libhandy'
    'libnotify'
    'libpamac-flatpak'
    'pamac-cli'
)
optdepends=(
	'mate-polkit: authentication agent for Mate'
	'polkit-gnome: legacy authentication agent for Gnome'
	'polkit-kde-agent: authentication agent for KDE'
	'polkit-qt5: Qt5 based authentication agent'
	'plymouth: offline upgrades'
)
makedepends=(
    'asciidoc'
    'git'
    'gobject-introspection'
    'meson'
    'vala'
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
sha256sums=('465f0bfa3aa0ac536c9838ffc934f2ee9bbf0ee403ed202fa86ce2ecfd601707')

#_srcdir="$_pkgname-$pkgver"
_srcdir="$_pkgname"

pkgver() {
  cd "$_srcdir"
  git describe --tags --abbrev=7 | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$_srcdir"
	# adjust version string
	sed -i -e "s|\"$pkgver\"|\"$pkgver-$pkgrel\"|g" 'src/version.vala'
}

build() {
	arch-meson "$_srcdir" 'build' -Denable-fake-gnome-software=false
	meson compile -C 'build'
}

package() {
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
