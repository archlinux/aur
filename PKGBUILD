_reponame=libfirm
pkgname="${_reponame}-git"
pkgver=r18354.107ceb1
pkgrel=1
pkgdesc='A c-lib for graph-based IR, optimizations and code gen for compilers'
url="http://pp.ipd.kit.edu/firm/Index"
license=('GPL')
arch=('any')
makedepends=('git')
source=("${_reponame}::git+http://pp.ipd.kit.edu/git/${_reponame}.git" 
        libfirm.pc)
md5sums=('SKIP' '39a7ef0417669487524b95460962f6c7')
options=(staticlibs)

pkgver() {
	cd "$_reponame"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_reponame"
	
	make
}

package() {
	cd "$_reponame"
	
	make install PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 "../${_reponame}.pc" \
	               "${pkgdir}/usr/lib/pkgconfig/${_reponame}.pc"
}
