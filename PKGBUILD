# Maintainer: hcra <hcra at u53r dot space>

pkgname=weborf-git
_pkgname="weborf"
pkgver=0.15
pkgrel=3
pkgdesc="Minimal HTTP server to share your files."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://ltworf.github.io/weborf/'
license=(GPL3)
makedepends=('pacman>=5.1' 'git' 'sudo' 'findutils')
conflicts=('weborf')
source=("git+https://github.com/ltworf/weborf.git#branch=master")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	autoreconf -f -i
	./configure --prefix=/usr --sysconfdir=/etc
	make VERSION="$pkgver"
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" VERSION="$pkgver" install
	cd "$pkgdir"
	find lib -type f -exec install -D {} usr/{} \;
	rm -r lib
}
