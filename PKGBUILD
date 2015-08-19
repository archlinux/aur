# Maintainer: Roman Rader <antigluk@gmail.com>
pkgname=vagga-bin

vagga_source_version() {
	curl -s http://files.zerogw.com/vagga/latest-testing.html | sed -e 's/<[^>]*>//g' -e 's/vagga-//g' -e 's/.tar.xz//g'
}
pkgver() {
	vagga_source_version | tr '-' '_'
}
pkgver=0.2.5_141_g18d8b61
pkgrel=2
pkgdesc="Vagga is a containerisation tool without daemons"
arch=('i686' 'x86_64')
url="http://vagga.readthedocs.org"
license=('MIT')
depends=('shadow' 'glibc-static')
makedepends=('git' 'make' 'cargo-bin')
checkdepends=()
optdepends=('linux-user-ns-enabled: kernel with CONFIG_USER_NS enabled')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=vagga.install
changelog=
source=()
noextract=()

prepare() {
	[ -d "$pkgname" ] && rm -r "$pkgname"
	mkdir "$pkgname"
	curl -O vagga.tar.xz "http://files.zerogw.com/vagga/vagga-`vagga_source_version`.tar.xz" | tar -xJ -C "$pkgname"
}

package() {
	cd "$pkgname"/vagga
	export DESTDIR="$pkgdir"
	export PREFIX=/usr

	install -d ${DESTDIR}${PREFIX}/bin
	install -d ${DESTDIR}${PREFIX}/lib/vagga
	install -m 755 vagga ${DESTDIR}${PREFIX}/lib/vagga/vagga
	install -m 755 apk ${DESTDIR}${PREFIX}/lib/vagga/apk
	install -m 755 busybox ${DESTDIR}${PREFIX}/lib/vagga/busybox
	install -m 755 alpine-keys.apk ${DESTDIR}${PREFIX}/lib/vagga/alpine-keys.apk
	ln -snf ../lib/vagga/vagga ${DESTDIR}${PREFIX}/bin/vagga
}
