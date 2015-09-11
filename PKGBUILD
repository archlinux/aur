pkgname=libcomps
_commit=d86995b748419bf6ca36f1c7f233727736d2efd5
pkgver=0.1.7
pkgrel=1
pkgdesc="Comps XML file manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('expat' 'libxml2')
makedepends=('cmake' 'python')
checkdepends=('check')
optdepends=('python: for python bindings')
source=("$url/archive/$_commit/$pkgname-$pkgver.tar.gz")
md5sums=('59f37f86cd69d3ebeb700959aa606bdf')

prepare() {
	mv "$pkgname-$_commit" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
		  -Wno-dev                    \
	      ../libcomps
	make
}

check() {
	cd "$pkgname-$pkgver"/build
	make test
	make pytest
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install
	if [[ "$CARCH" == "x86_64" ]]; then
		mv "$pkgdir/"usr/lib64/* "$pkgdir/"usr/lib
		rmdir "$pkgdir/"usr/lib64
	fi

	install -D -m644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
