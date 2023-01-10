# Maintainer: James Read <contact@jread.com>
pkgname=olivetin
pkgver=2022.11.14
pkgrel=2
pkgdesc="Give safe and simple access to predefined shell commands from a web interface."
arch=('x86_64')
url="http://www.olivetin.app"
license=('GPL')
makedepends=('go'
	'git')
source=("$pkgname-$pkgver::git+https://github.com/OliveTin/OliveTin.git?tag=2022.11.14"
	"systemd-unit-usr-bin.patch")
noextract=()
md5sums=('SKIP'
	'SKIP')
validpgpkeys=()

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	patch OliveTin.service < "$srcdir/systemd-unit-usr-bin.patch"

}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make grpc
	make
} 

check() {
	cd "$srcdir/${pkgname}-${pkgver}"
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"

	mkdir -p $pkgdir/usr/bin/
	cp OliveTin $pkgdir/usr/bin/

	mkdir -p $pkgdir/etc/OliveTin/
	cp config.yaml $pkgdir/etc/OliveTin/

	mkdir -p $pkgdir/usr/lib/systemd/system/
	cp OliveTin.service $pkgdir/usr/lib/systemd/system/

	mkdir -p $pkgdir/var/www/olivetin/
	cp -r webui/* $pkgdir/var/www/olivetin/
}
