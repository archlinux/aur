# Maintainer: pvdp <pvpd at email dot com>
# Contributor: hcra <hcra at u53r dot space>

pkgname=qweborf-git
_pkgname="weborf"
pkgver=0.19.r2.g447d98d
pkgrel=1
pkgdesc="Minimal HTTP server to share your files - Qt frontend"
arch=(any)
url="https://ltworf.github.io/weborf"
license=('GPL3')
depends=('python' 'python-pyqt5' 'weborf-git' 'desktop-file-utils')
makedepends=('pacman>=5.1' 'git' 'sudo' 'python-setuptools')
conflicts=('qweborf')
source=("git+https://github.com/ltworf/weborf.git#branch=master")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"

	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname/qweborf"

	pyuic5 qweborf/main.ui > qweborf/main.py
	gzip   man/qweborf.1
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname/qweborf"

	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 0644 man/qweborf.1.gz "$pkgdir/usr/share/man/man1/qweborf.1.gz"
	install -Dm 0755 qweborf/qweborf "$pkgdir/usr/bin/qweborf"
	install -Dm 0755 integration/qweborf.desktop "$pkgdir/usr/share/applications/qweborf.desktop"
}
