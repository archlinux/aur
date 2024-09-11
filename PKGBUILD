# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.1.23
pkgrel=7
pkgdesc="Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms. "
arch=('i686' 'x86_64' 'aarch64')
makedepends=('cmake')
url="https://github.com/jedisct1/libaegis.git"
license=('MIT')
options=('!lto')

_commit=e42ab7aaed113b0876baacbc5b8158a3292fbe26
source=("git+https://github.com/jedisct1/libaegis.git#commit=${_commit}?signed/")
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('ec5a78adba280a2cdbcf81c9993df433eb2337ea1eba8cb13fa77e2c8505db2b')
provides=('libaegis')
conflicts=('libaegis')

pkgver() {
	cd "$srcdir/$pkgname"
        git describe --tags | sed -e 's/^v//g' -e 's/-g.*$//g' -e 's/-.*//g'
}

build() {
	cd "$srcdir/$pkgname"

        mkdir build
        cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr/ \
              -DCMAKE_C_FLAGS="$CFLAGS -DFAVOR_PERFORMANCE" \
              ..
        make
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        cd build
	make DESTDIR="$pkgdir" install
}
