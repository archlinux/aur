# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributer: TommyTran732 <contact@tommytran.io>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-flatpak
pkgver=11.7.4.3.gc7efe92
_commit=c7efe923f980a3f5966f376bd6d6e6146539a970
pkgrel=1
epoch=1
_srcdir="$_pkgname-$pkgver"
pkgdesc="Pamac package manager library based on libalpm. With Flatpak support"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/${_pkgname}"
license=('GPL3')
depends=(
    'appstream'
    'archlinux-appstream-data'
    'dbus-glib'
    'flatpak'
    'git'
    'glib2'
    'gnutls'
    'json-glib'
    'libalpm.so=16'
    'libnotify'
    'libsoup3'
    'pacman'
    'polkit'
    'vte3'    
)
makedepends=(
    'asciidoc'
    'gettext'
    'git'
    'gobject-introspection'
    'intltool'
    'meson'
    'ninja'
    'vala'
)
provides=('libpamac')
conflicts=(
    'libpamac'
    'libpamac-aur'
    'libpamac-full'
    'libpamac-nosnap'
)
options=(!emptydirs !strip)
backup=('etc/pamac.conf')
install='pamac.install'
source=("git+${url}.git#commit=${_commit}")
sha256sums=('4b297f6195cc248107ca5f9f21325a0992ba5d1260c7fb077b6c65c44af302b4')

_srcdir="$_pkgname"

pkgver() {
	cd "$_srcdir"
	git describe --tags --abbrev=7 | sed 's/^v//;s/-/./g'
}

build() {
	arch-meson "$_srcdir" 'build' -Denable-appstream=true -Denable-flatpak=true -Denable-snap=false
	meson compile -C 'build'
}

package() {
	backup=('etc/pamac.conf')
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
