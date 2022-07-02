# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=drmdb-git
_pkgname=drmdb
pkgver=r123.96444f0746a3
pkgrel=1
pkgdesc='A Direct Rendering Manager database'
arch=('x86_64')
url='https://git.sr.ht/~emersion/drmdb'
license=('MIT')
makedepends=('git' 'go')
provides=('drmdb')
conflicts=('drmdb')
source=(
	"git+https://git.sr.ht/~emersion/drmdb"
	"drmdb.sysusers"
	"drmdb.service"
	"drmdb.tmpfiles"
)
sha256sums=(
	'SKIP'
	'7a83da6b3ad691f2b89fd104166187bb47deaf80cb20488d92f55887d6be5ce6'
	'709fa0be5ac627cd124950bce2e435f24bd9aabc26805ef0d412d15c521adaa8'
	'1fdeccbb6e8ef835c5c8529c1b9becd53c97f8d837d473570e4ff737f610a6a2'
)

pkgver() {
	cd "$srcdir/drmdb"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/drmdb"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make PREFIX=/usr
}

package() {
	cd "$srcdir/drmdb"
	make PREFIX=/usr DESTDIR=$pkgdir install
	install -Dm644 "$srcdir/drmdb.sysusers" "$pkgdir/usr/lib/sysusers.d/drmdb.conf"
	install -Dm644 "$srcdir/drmdb.service" "$pkgdir/usr/lib/systemd/system/drmdb.service"
	install -Dm644 "$srcdir/drmdb.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/drmdb.conf"
}
