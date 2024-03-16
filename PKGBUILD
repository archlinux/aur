# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=pamac
pkgname=${_pkgname}-nosnap
pkgver=11.7.1
pkgrel=2
_srcdir="$_pkgname-$pkgver"
pkgdesc="A Gtk3 frontend, Package Manager based on libalpm with AUR and Appstream support"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/$_pkgname"
license=('GPL3')
depends=(
    'desktop-file-utils'
    'gnutls'
    'gtk4'
    'libadwaita'
    'libhandy'
    'libnotify'
    'libpamac-nosnap' 
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
    'pamac-cli'
    'pamac-flatpak'
    'pamac-flatpak-gnome'
)
options=(!emptydirs)
source=("$url/-/archive/$pkgver/pamac-$pkgver.tar.gz")
sha256sums=('bdf93f7efde43a1d0fa9ef9cceea409691f1d5e42bbd4fb0f9b3e38e0cd0c22a')

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
