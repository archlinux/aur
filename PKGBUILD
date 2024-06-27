_reponame=cparser
pkgname="${_reponame}-git"
pkgver=r3947.51b173e6
pkgrel=4
pkgdesc='A c99 frontend to libfirm compiler library'
url="https://pp.ipd.kit.edu/firm/"
license=('GPL')
arch=('any')
depends=('libfirm-git')
makedepends=('git')
source=("${_reponame}::git+https://github.com/libfirm/cparser.git")
md5sums=('SKIP')
conflicts=('cparser')
provides=("cparser=${pkgver}")

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
