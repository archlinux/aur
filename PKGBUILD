# Contributor: Patrick McCarty <pnorcks at gmail dot com>

pkgname=createrepo_c
pkgver=1.1.0
pkgrel=1
pkgdesc="A C implementation of createrepo, a tool to create yum repositories"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
url="https://github.com/rpm-software-management/$pkgname"
depends=('bzip2' 'curl' 'drpm>=0.4.0' 'glib2' 'libmodulemd>=2.3.0'
         'libxml2' 'openssl' 'rpm-tools' 'sqlite>=3.6.18' 'xz' 'zchunk' 'zlib' 'zstd')
makedepends=('bash-completion' 'cmake>=3.13' 'doxygen'
             'pkg-config' 'python' 'python-setuptools' 'python-sphinx')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('28c8be5c14ea8f4902228c228454b4c4ca5ec6639171509e997f7efd481ee6db')

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DENABLE_BASHCOMP=ON \
	      -DENABLE_DRPM=ON \
	      -DENABLE_PYTHON=ON \
	      -DWITH_LEGACY_HASHES=ON \
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
