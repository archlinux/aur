# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributer: TommyTran732 <contact@tommytran.io>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-flatpak
pkgver=11.7.3
_commit=06c846c0310030ee45870b190359553b1c105f77
pkgrel=1
pkgdesc="A GUI frontend for libalpm. With Flatpak support"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
    'desktop-file-utils'
    'gnutls'
    'gtk4'
    'libadwaita'
    'libhandy'
    'libnotify'
    'libpamac-flatpak'
    'pamac-cli'
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
sha256sums=('d9df19c697a000de65514617545323ed7e7ada162aaceed6d91827d0775b9d56')

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
