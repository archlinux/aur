# Maintainer: pvdp <pvdp at email dot com>
# Contributor: hcra <hcra at u53r dot space>

pkgname=weborf-git
_pkgname="weborf"
pkgver=0.19.r2.g447d98d
pkgrel=1
pkgdesc="Minimal HTTP server to share your files"
arch=('any')
url="https://ltworf.github.io/weborf"
license=('GPL3')
depends=('openssl' 'file')
makedepends=('pacman>=5.1' 'git' 'sudo' 'findutils')
optdepends=('qweborf-git: graphical user interface')
conflicts=('weborf')
source=("git+https://github.com/ltworf/weborf.git#branch=master")
sha256sums=("SKIP")

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
