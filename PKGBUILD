# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=createrepo_c
pkgver=1.0.3
pkgrel=1
pkgdesc="A C implementation of createrepo, a tool to create yum repositories"
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/rpm-software-management/$pkgname"
depends=('bzip2' 'curl' 'drpm>=0.4.0' 'glib2' 'libmodulemd>=2.3.0'
         'libxml2' 'openssl' 'rpm-tools' 'sqlite>=3.6.18' 'xz' 'zchunk' 'zlib' 'zstd')
makedepends=('bash-completion' 'cmake>=3.13' 'doxygen'
             'pkg-config' 'python' 'python-setuptools' 'python-sphinx')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4f549ad1209c1b17973a805afc9b976c622769d4fc500fc2bb0bab4f2d2f07a0')

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

	cmake --build build
	cmake --build build --target doc
}

check() {
	cd "$pkgname-$pkgver"

	cmake --build build --target tests
	ctest --test-dir build --output-on-failure
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR="$pkgdir" cmake --install build

	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
