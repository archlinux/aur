# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=createrepo_c
pkgver=0.17.2
pkgrel=1
pkgdesc="A C implementation of createrepo, a tool to create yum repositories"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/rpm-software-management/$pkgname"
depends=('curl' 'drpm>=0.4.0' 'glib2' 'libmodulemd>=2.3.0'
         'libxml2' 'rpm-tools' 'sqlite' 'zchunk' 'zlib')
makedepends=('bash-completion' 'cmake>=3.13' 'doxygen'
             'pkg-config' 'python' 'python-sphinx')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('3dfb6f7415f786603ee2fed20aad9065')

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DENABLE_DRPM=ON \
	      -DWITH_LIBMODULEMD=ON \
	      -DWITH_ZCHUNK=ON \
	      -Wno-dev

	make -C build
	make -C build doc
}

check() {
	cd "$pkgname-$pkgver"

	make -C build tests
	make -C build ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"

	make -C build DESTDIR="$pkgdir/" install

	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
