_reponame=cparser
pkgname="${_reponame}-git"
pkgver=r3832.4ebb0b8
pkgrel=1
pkgdesc='A c99 frontend to libfirm compiler library'
url="http://pp.ipd.kit.edu/firm/Index"
license=('GPL')
arch=('any')
depends=('libfirm-git')
makedepends=('git')
source=("${_reponame}::git+http://pp.ipd.kit.edu/git/${_reponame}.git")
md5sums=('SKIP')

pkgver() {
	cd "$_reponame"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_reponame"
	
	# cparser will automaticalle use system's libfirm if no libfirm folder is present
	rm -rf libfirm
	make
}

package() {
	cd "$_reponame"
	
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
