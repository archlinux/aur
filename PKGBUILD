# Maintainer: Julien Virey <julien.virey@gmail.com>
pkgname=rescached
pkgver=4.4.4
pkgrel=2
pkgdesc="Resolver/DNS cache daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://git.sr.ht/~shulhan/rescached"
license=('GPL-3.0-or-later')

depends=('glibc')
makedepends=('git' 'go>=1.20')

source=(
	"$pkgname-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('0d7d98e7e711a1fcb059c4cc714d783c2c06d87466f5d83289258f325f0204a4')

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
	export GOPATH="${srcdir}/go"
	go mod download
}

build() {
	cd "$pkgname-v$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	make

	# Make sure go path is writable so it can be cleaned up
	chmod -R u+w "${srcdir}/go"
}

package() {
	cd "$pkgname-v$pkgver"
	make PREFIX="$pkgdir" install
	rm -rf ${pkgdir}/usr/share/rescached/
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/rescached/COPYING"
}
