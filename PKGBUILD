pkgname=toxic-newgc-static-git
_pkgname=toxic
pkgdesc='CLI Frontend in ncurses for Tox'
license=('GPL3')
pkgver=0.7.0.r53.gcb21672
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
source=(
	"${pkgname}::git+https://github.com/JFreegman/toxic.git"
	"toxcore::git+https://github.com/JFreegman/toxcore.git"
)
sha512sums=('SKIP' 'SKIP')
install="${pkgname}.install"

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd toxcore

	autoreconf -if
	./configure --disable-ntox --disable-tests --disable-shared --prefix=$PWD
	make && make install
	find -name *.a

	cd ../$pkgname
	git checkout new_groupchats

	USER_CFLAGS=-I../toxcore/include USER_LDFLAGS=-L../toxcore/lib make PREFIX=/usr
}

package() {
	cd $pkgname
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
