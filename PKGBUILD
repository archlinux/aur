# Maintainer: shulhan <ms@kilabit.info>
pkgname=rescached-git
pkgver=4.0.0.r6.g33b6afc
pkgrel=1
pkgdesc="Resolver/DNS cache daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/shuLhan/rescached-go"
license=('custom:BSD')

depends=('bash')
provides=('rescached')
makedepends=('git' 'go>=1.16')

source=(
	"$pkgname::git+https://github.com/shuLhan/rescached-go.git"
)
## For testing on local.
#source=(
#	"$pkgname::git+file:///home/ms/go/src/github.com/shuLhan/rescached-go"
#)
sha1sums=(
	'SKIP'
)

backup=(
	'etc/rescached/rescached.cfg'
	'etc/rescached/localhost.cert.pem'
	'etc/rescached/localhost.key.pem'
)

install=rescached.install

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	echo ">>"
	echo ">> cleaning ..."
	echo ">>"
	make clean
	echo ">>"
	echo ">> make ..."
	echo ">>"
	unset GOROOT
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	make || return 1
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir" install
	rm -f ${pkgdir}/usr/share/rescached/LICENSE
	rmdir ${pkgdir}/usr/share/rescached
	install -Dm644 $srcdir/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/rescached/LICENSE"
}
