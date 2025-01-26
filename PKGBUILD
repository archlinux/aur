# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributer: TommyTran732 <contact@tommytran.io>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-flatpak
pkgver=11.7.1
_commit=9a9caef858a3d9314d927ff93f47b417ec965a95
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
    'libalpm.so=15'
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
sha256sums=('7de20f4f4a96b516d9cf9d548195ba7105d8ac838ae6a6aa3a765b42ebce8ae8')

_srcdir="$_pkgname"

pkgver() {
	cd "$_srcdir"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$_srcdir"
	sed -i "s|--vapidir=../vapi'|--vapidir=' + join_paths(meson.source_root(), 'vapi')|" 'src/meson.build'
}

build() {
	arch-meson "$_srcdir" 'build' -Denable-snap=false -Denable-flatpak=true -Denable-appstream=true
	meson compile -C 'build'
}

package() {
    backup=('etc/pamac.conf')
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
