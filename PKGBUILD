# Maintainer: DanielNak <daniel@tee.cat>
# Library package author: Timothy A. Davis <Davis@tamu.edu>

_author=GraphBLAS
__author=davis
_pkgname=LAGraph
__pkgname=lagraph
pkgname=$__pkgname-git
pkgver=r57.gdd3449877
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
	git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -d'.' -f 2,3 ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$_pkgname"
	(( NJOB=$(nproc)-1 )) || NJOB=1
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make JOBS=$NJOB
}

package(){
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$__pkgname/LICENSE"
	cd "$pkgdir/usr"
	# mv lib64 lib
}
