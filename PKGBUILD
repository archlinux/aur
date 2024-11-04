# Maintainer: Masato TOYOSHIMA <phoepsilonix@phoepsilonix.love>

pkgname=libaegis
pkgver=0.1.24
pkgrel=1
pkgdesc="Portable C implementations of the AEGIS family of high-performance authenticated encryption algorithms. "
arch=('i686' 'x86_64' 'aarch64')
makedepends=('cmake')
url="https://github.com/aegis-aead/libaegis.git"
license=('MIT')
options=('!lto')

_commit=146c9d9894c7c42d7e77e24cc1965145a0d64983
source=("git+https://github.com/aegis-aead/libaegis.git#commit=${_commit}?signed/")
# mruby-Rakefile.patch
# h2o-libressl-3.6.2.patch
sha256sums=('72f75099d686e8d74f28c05f9633efef37b280bb89c69645a1222f59a20e2bd2')
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
