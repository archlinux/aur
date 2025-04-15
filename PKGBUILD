# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributer: TommyTran732 <contact@tommytran.io>
# Contributer: Cassandra Watergate (saltedcoffii) <cassandrajwatergate@gmail.com>
# Contributer: LSUtigers3131

_pkgname=libpamac
pkgname=$_pkgname-flatpak
pkgver=11.7.3
_commit=29b31e251eb9eac3804955489c285851eb2aca97
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
sha256sums=('7a0e6abfa5f1ea1f1530301566aacb0acffaf95d93d36a6811dcd874460ca57d')

_srcdir="$_pkgname"

pkgver() {
	cd "$_srcdir"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

#prepare() {
#	cd "$_srcdir"
#	sed -i "s|--vapidir=../vapi'|--vapidir=' + join_paths(meson.source_root(), 'vapi')|" 'src/meson.build'
#}

build() {
	arch-meson "$_srcdir" 'build' -Denable-snap=false -Denable-flatpak=true -Denable-appstream=true
	meson compile -C 'build'
}

package() {
    backup=('etc/pamac.conf')
	meson install -C 'build' --destdir="$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
