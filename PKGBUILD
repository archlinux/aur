# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>
_pkgname=freetuxtv
pkgname=$_pkgname-git
pkgver=0.6.8.r45.gc5781e5
pkgrel=2
pkgdesc="Internet television and radio player"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/freetuxtv/freetuxtv"
license=('GPL3')
depends=('vlc')
makedepends=(
	'cmake'
	'curl'
	'gdk-pixbuf2'
	'git'
	'glib2'
	'glibc'
	'gtk3'
	'intltool'
	'libnotify'
	'ninja'
	'pango'
	'sqlite'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/^freetuxtv-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build -G Ninja \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=(
		'libcurl.so'
		'libgdk-3.so'
		'libgdk_pixbuf-2.0.so'
		'libgio-2.0.so'
		'libglib-2.0.so'
		'libgobject-2.0.so'
		'libgtk-3.so'
		'libnotify.so'
		'libpango-1.0.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
