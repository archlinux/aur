# Maintainer: shulhan <ms@kilabit.info>
pkgname=rescached-git
pkgver=4.4.2.r9.gd35cf24
pkgrel=1
pkgdesc="Resolver/DNS cache daemon"
arch=('i686' 'x86_64' 'armv7h')
url="https://kilabit.info/project/rescached/"
license=('GPL-3.0-only')

depends=('bash')
provides=('rescached')
makedepends=('git' 'go>=1.20')

_sourcedir=$pkgname
source=(
	"$pkgname::git+https://git.kilabit.info/rescached"
)

## For testing on local.
#_sourcedir=rescached-local
#source=(
#	"$_sourcedir::git+file:///home/ms/kilabit.info/_project/src/rescached/#branch=dev"
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
	cd "$_sourcedir"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_sourcedir"
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
	cd "$_sourcedir"
	make PREFIX="$pkgdir" install
	rm -rf ${pkgdir}/usr/share/rescached/
	install -Dm644 $srcdir/$pkgname/COPYING \
		"${pkgdir}/usr/share/licenses/rescached/COPYING"
}
