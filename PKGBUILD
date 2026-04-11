# Maintainer: Julien Virey <julien.virey@gmail.com>
pkgname=rescached
pkgver=4.5.0
pkgrel=3
pkgdesc="Resolver/DNS cache daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://git.sr.ht/~shulhan/rescached"
license=('GPL-3.0-or-later')

depends=('glibc')
makedepends=('git' 'go>=1.20')

source=(
	"$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('a1b59454d1c3d5c7ca981d0248b2f1cdd6ac1d1f692befd725ce8560fe98c0ee')

backup=(
	'etc/rescached/block.d/.pgl.yoyo.org'
	'etc/rescached/block.d/.someonewhocares.org'
	'etc/rescached/block.d/.winhelp2002.mvps.org'
	'etc/rescached/rescached.cfg'
	'etc/rescached/localhost.pem'
	'etc/rescached/localhost.pem.key'
)

prepare() {
	cd "$pkgname-v$pkgver"
	export GOMODCACHE="${GOMODCACHE:-$srcdir/gomod}"
	go mod download -modcacherw
}

build() {
	cd "$pkgname-v$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	make

	# Clean up deps
  go clean -modcache
}

package() {
	cd "$pkgname-v$pkgver"
	make PREFIX="$pkgdir" install
	rm -rf ${pkgdir}/usr/share/rescached/
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/rescached/COPYING"
}
