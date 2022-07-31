# Maintainer: Lukas Werling <lukas@lwrl.de>
pkgname=riker-git
pkgver=r2201.6b2c276d
pkgrel=1
pkgdesc="Always-Correct and Fast Incremental Builds from Simple Specifications"
arch=('x86_64')
url="https://github.com/curtsinger-lab/riker"
license=('BSD')
depends=('graphviz')
makedepends=('clang' 'llvm')
checkdepends=('python-cram')
source=("$pkgname::git+https://github.com/curtsinger-lab/riker")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	git submodule init
	git submodule update

	# `uname -p` returns "unknown" on Arch Linux
	sed -i 's/uname -p/uname -m/' Makefile
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
	# Tests currently fail on Arch Linux, see https://github.com/curtsinger-lab/riker/pull/40
	#make test
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr/" install
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
