# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.1.23
pkgrel=10
pkgdesc="Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms. "
arch=('i686' 'x86_64' 'aarch64')
makedepends=('cmake')
url="https://github.com/jedisct1/libaegis.git"
license=('MIT')
options=('!lto')

_commit=53d818915e42af4c89bf41f0d2f9408cf58f72b3
source=("git+https://github.com/jedisct1/libaegis.git#commit=${_commit}?signed/")
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('ede15ea37ff8d94cf5e491f635cd79d63369ae4978e53d8cf073829e95996885')
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
