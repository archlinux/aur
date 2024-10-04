# Maintainer: Atle Solbakken <atle@goliathdns.no>

pkgname=ngtcp2-git
pkgver=r4927.8ae7650c
pkgrel=1
pkgdesc="An effort to implement IETF QUIC protocol"
arch=('x86_64')
url="https://github.com/ngtcp2/ngtcp2"
license=('MIT')
depends=('gnutls')
optdepends=('quictls-openssl')
makedepends=('git')
checkdepends=('cunit')
provides=('ngtcp2' 'libngtcp2.so')
conflicts=('ngtcp2' 'libngtcp2' 'libngtcp2-git')
source=('git+https://github.com/ngtcp2/ngtcp2')
md5sums=('SKIP')

prepare() {
	cd ngtcp2

	git submodule update --init --depth 1
}

pkgver() {
	cd ngtcp2

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ngtcp2

	autoreconf -fisv

	WITH="--with-gnutls"
	if [ pacman -Q quictls-openssl > /dev/null 2>&1 ]; then
		WITH="$WITH --with-openssl"
	fi

	./configure \
      --prefix=/usr $WITH

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
