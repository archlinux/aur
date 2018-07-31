# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=createrepo_c
pkgver=0.11.1
pkgrel=1
pkgdesc="A C implementation of createrepo, a tool to create yum repositories"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/rpm-software-management/$pkgname"
depends=('curl' 'drpm' 'glib2' 'libxml2' 'rpm-org' 'sqlite' 'zlib')
makedepends=('bash-completion' 'cmake' 'doxygen'
             'python' 'python-sphinx')
checkdepends=('python-nose')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('eaf3f3224c265c996bee5f63109e30da')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build

	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      ..

	make
	make doc
}

check() {
	cd "$pkgname-$pkgver"/build
	make tests
	make ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install
	if [[ $CARCH == x86_64 ]]; then
		mv "$pkgdir/"usr/lib64/* "$pkgdir/"usr/lib
		rmdir "$pkgdir/"usr/lib64
	fi

	install -Dp -m644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
