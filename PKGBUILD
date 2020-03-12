# Maintainer: Matthijs Tadema <M dot J dot Tadema at pm dot me>
pkgname=hole2-git
pkgver=v2.004pre.r24.ba82cfc
pkgrel=2
pkgdesc="Analyzes the pore dimensions of ion channels"
arch=('x86_64')
url='https://github.com/osmart/hole2'
license=('Apache')
depends=('gcc-libs')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/osmart/hole2.git'
	"${pkgname%-git}.patch")
md5sums=('SKIP'
         '6443d83cc884f733094dddba7b279314')
# Compiling didn't work for me on multiple processors
MAKEFLAGS=${MAKEFLAGS/-j[0-9]*/-j1}

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/${pkgname%-git}.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}/src"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	bash tarball.sh
	mkdir -p $pkgdir/opt/
	cd $pkgdir/opt/
	tar -xf ${srcdir}/${pkgname%-git}/"${pkgname%-git}-`uname`-`uname -m`.tar.gz"
	rm ${srcdir}/${pkgname%-git}/"${pkgname%-git}-`uname`-`uname -m`.tar.gz"
}
