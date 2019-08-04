# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=ngtcp2-git
pkgver=r1467.2d150d1
pkgrel=1
pkgdesc="An effort to implement IETF QUIC protocol"
arch=(x86_64)
url="https://github.com/ngtcp2/ngtcp2"
license=('GPL')
makedepends=('git')
checkdepends=('cunit')
provides=('ngtcp2' 'libngtcp2.so')
conflicts=('ngtcp2')
source=('git+https://github.com/ngtcp2/ngtcp2')
md5sums=('SKIP')

pkgver() {
	cd ngtcp2

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ngtcp2

  # don't build the examples to avoid dependency on nghttp3
  # https://github.com/ngtcp2/ngtcp2/pull/140
  sed -i '/SUBDIRS/ s/examples//' Makefile.am
}

build() {
	cd ngtcp2

	autoreconf -fisv

	./configure \
      --prefix=/usr

	make
}

check() {
	cd ngtcp2

	make -k check
}

package() {
	cd ngtcp2

	make DESTDIR="$pkgdir" install
}
