# Maintainer: jujudusud <jujudusud@gmail.com>
pkgname=mod-app-git
pkgver=0.0.1.r155.gf2f1c2f
pkgrel=3
pkgdesc="Desktop application of the MOD interface and backend, natively integrated in the OS"
arch=('x86_64')
url="https://github.com/moddevices/mod-app"
license=('GPL3')
depends=('jack2' 'lilv' 'lv2' 'python' 'python-pyqt5' 'hicolor-icon-theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/moddevices/${pkgname%-git}.git"
	'mod-host::git+https://github.com/moddevices/mod-host.git'
	'mod-ui::git+https://github.com/moddevices/mod-ui.git')
md5sums=('SKIP'
	 'SKIP'
	 'SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.mod-host.url $srcdir/$pkgname/source/modules
	git config submodule.mod-ui.url $srcdir/$pkgname/source/modules
	git submodule update
}

build() {
	cd "$srcdir/$pkgname"
	make 
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}