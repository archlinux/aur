# Maintainer: DanManN <dnahimov@gmail.com>
# Library package author: Timothy A. Davis <Davis@tamu.edu>

_author=GraphBLAS
__author=davis
_pkgname=LAGraph
__pkgname=lagraph
pkgname=$__pkgname-git
pkgver=22July2019.r134.g63a6fd7
pkgrel=1
pkgdesc="A library plus a test harness for collecting algorithms that use the GraphBLAS."
arch=('any')
url="https://github.com/$_author/$_pkgname"
license=('BSD')
depends=('graphblas')
makedepends=('cmake' 'git')
provides=("$__pkgname")
conflicts=("$__pkgname")
source=("git+https://github.com/$_author/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
	git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$_pkgname"
	(( NJOB=$(nproc)-1 )) || NJOB=1
	make library JOBS=$NJOB CMAKE_OPTIONS=-DCMAKE_INSTALL_PREFIX=/usr
}

package(){
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$__pkgname/LICENSE"
	cd "$pkgdir/usr"
	# mv lib64 lib
}
