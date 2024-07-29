# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.1.23
pkgrel=3
pkgdesc="Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms. "
arch=('i686' 'x86_64' 'aarch64')
makedepends=('cmake')
url="https://github.com/jedisct1/libaegis.git"
license=('MIT')
options=('!lto')

_commit=5a8a3fda707f7585bf35f11a544582cb2eefd208
source=("git+https://github.com/jedisct1/libaegis.git?commit=${_commit}?signed/"
https://github.com/jedisct1/libaegis/pull/11.patch)
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('SKIP'
            'f1d7e2d1757a4d82aac6bce201dd953d9fcace4af44b5a0c8a0e57d23b4969df')
provides=('libaegis')
conflicts=('libaegis')

prepare() {
	cd "$srcdir/$pkgname"
	patch -p1 -i ${srcdir}/11.patch
}

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
