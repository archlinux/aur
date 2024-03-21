# Maintainer: shulhan <ms@kilabit.info>
pkgname=rescached-git
pkgver=4.4.2.r5.g842206e
pkgrel=1
pkgdesc="Resolver/DNS cache daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://git.sr.ht/~shulhan/rescached"
license=('GPL-3.0-or-later')

depends=('bash')
provides=('rescached')
makedepends=('git' 'go>=1.20')

source=(
	"$pkgname::git+https://git.sr.ht/~shulhan/rescached"
)
## For testing on local.
#source=(
#	"$pkgname::git+file:///.."
#)

sha1sums=(
	'SKIP'
)

backup=(
	'etc/rescached/block.d/.pgl.yoyo.org'
	'etc/rescached/block.d/.someonewhocares.org'
	'etc/rescached/block.d/.winhelp2002.mvps.org'
	'etc/rescached/rescached.cfg'
	'etc/rescached/localhost.pem'
	'etc/rescached/localhost.pem.key'
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
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	make || return 1
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir" install
	rm -rf ${pkgdir}/usr/share/rescached/
	install -Dm644 $srcdir/$pkgname/COPYING \
		"${pkgdir}/usr/share/licenses/rescached/COPYING"
}
