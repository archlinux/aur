# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributer: TommyTran732 <contact@tommytran.io>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-flatpak
pkgver=11.7.2
pkgrel=1
_srcdir="$_pkgname-$pkgver"
pkgdesc="A GUI frontend for libalpm. With Flatpak support"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
#url="https://gitlab.manjaro.org/applications/$_pkgname"
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
#provides=(pamac)
provides=("${_pkgname}=${pkgver}-${pkgrel}")
conflicts=(
    'pamac'
    'pamac-aur'
    'pamac-all'
    'pamac-nosnap'
)
options=(!emptydirs)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c13d422bbdd9ced4c86de4a4921516b0ca69640440e18082ac29af87105e6829')

_srcdir="$_pkgname-$pkgver"

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
