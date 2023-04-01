# Maintainer: éclairevoyant

_pkgname=shc
pkgname=shc-git
pkgver=4.0.3.r10.6495e11e
pkgrel=1
pkgdesc="Generic shell script compiler"
arch=(x86_64)
url="https://github.com/neurobin/$_pkgname"
license=(GPL3)
depends=(glibc)
makedepends=(git)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git blame -s -L"/^PACKAGE_VERSION=/,+1" configure | awk '{
		ver = gensub(/[^0-9.]/, "", "g", $3);
		"git rev-list --count "$1"..HEAD" | getline commit_count;
		print ver".r"commit_count"."$1
	}'
}

build() {
	cd $_pkgname
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir/" install
}
