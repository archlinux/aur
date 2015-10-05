pkgname=libsolv
pkgver=0.6.14
pkgrel=1
pkgdesc="Library for solving packages and reading repositories"
arch=('i686' 'x86_64')
url="https://github.com/openSUSE/$pkgname"
license=('BSD')
depends=('expat' 'xz' 'zlib')
makedepends=('cmake' 'perl' 'python' 'rpm-org' 'ruby' 'swig')
optdepends=('perl: for perl bindings'
            'python: for python bindings'
            'ruby: for ruby bindings')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('3bacd80472e4c8d5dd66d22f435f9258')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release     \
	      -DCMAKE_INSTALL_PREFIX=/usr    \
	      -DUSE_VENDORDIRS=ON            \
	      -DARCHLINUX=1                  \
	      -DENABLE_APPDATA=ON            \
	      -DENABLE_ARCHREPO=ON           \
	      -DENABLE_BZIP2_COMPRESSION=OFF \
	      -DENABLE_COMPS=OFF             \
	      -DENABLE_CUDFREPO=OFF          \
	      -DENABLE_DEBIAN=ON             \
	      -DENABLE_HAIKU=OFF             \
	      -DENABLE_HELIXREPO=OFF         \
	      -DENABLE_LZMA_COMPRESSION=ON   \
	      -DENABLE_MDKREPO=OFF           \
	      -DENABLE_PERL=ON               \
	      -DENABLE_PUBKEY=OFF            \
	      -DENABLE_PYTHON=ON             \
	      -DENABLE_RPMDB=ON              \
	      -DENABLE_RPMDB_BYRPMHEADER=OFF \
	      -DENABLE_RPMMD=ON              \
	      -DENABLE_RUBY=ON               \
	      -DENABLE_SUSEREPO=OFF          \
	      ..
	make
}

check() {
	cd "$pkgname-$pkgver"/build
	make ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install
	if [[ "$CARCH" == "x86_64" ]]; then
		mv "$pkgdir/"usr/lib64/* "$pkgdir/"usr/lib
		rmdir "$pkgdir/"usr/lib64
	fi

	install -D -m644 ../LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
	install -D -m644 ../README      "$pkgdir/usr/share/doc/$pkgname/README"
	install -D -m644 ../BUGS        "$pkgdir/usr/share/doc/$pkgname/BUGS"
}

# vim: set ft=sh ts=4 sw=4 noet:
