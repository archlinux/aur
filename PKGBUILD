pkgname=toxic-newgc-static-git
_pkgname=toxic
pkgdesc='CLI Frontend in ncurses for Tox'
license=('GPL3')
pkgver=0.7.0.r30.ge73ac9b
pkgrel=1
depends=(
	'desktop-file-utils'
	'freealut'
	'libnotify'
	'curl'
	'qrencode'
	'libconfig'
	'libsodium'
	'libvpx'
	'opus'
)
makedepends=('git')
conflicts=($_pkgname)
provides=("$_pkgname-newgc")
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://tox.chat'
source=("${pkgname}::git+https://github.com/JFreegman/toxic.git")
sha512sums=('SKIP')
install="${pkgname}.install"

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	git checkout new_groupchats

	test -e toxcore || git clone https://github.com/JFreegman/toxcore.git
	cd toxcore
	autoreconf -if
	./configure --disable-ntox --disable-tests --disable-shared --prefix=$PWD
	make && make install
	find -name *.a

	cd ..
	USER_CFLAGS=-Itoxcore/include USER_LDFLAGS=-Ltoxcore/lib make
}

package() {
	cd $pkgname
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
