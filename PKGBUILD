# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: David Harrigan <dharrigan [@] gmail [dot] com>
# Contributor: Davide Depau <davide@depau.eu>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Andrew Nelless <andrew at nelless dot net>

pkgname='avro-cpp'
pkgver=1.12.0
pkgrel=1
arch=('x86_64')
pkgdesc="C++ implementation of the Apache Avro data serialization system"
url="https://avro.apache.org/"
license=('Apache')
groups=('avro')
depends=('boost-libs')
makedepends=('boost' 'cmake' 'snappy' 'fmt')

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/apache/avro/archive/refs/tags/release-${pkgver}.tar.gz)
sha256sums=('51832f9c2e81fa95addb74be627dac27b4883ec2c8627ec8471d99cfea787555')

build() {
	cd "$srcdir/avro-release-$pkgver/lang/c++"

	msg2 'Building...'
	mkdir -p build && cd build

	export CFLAGS+=" ${CPPFLAGS}"
	export CXXFLAGS+=" ${CPPFLAGS} -fpermissive"

	cmake .. \
		-DCMAKE_INSTALL_PREFIX:PATH=/usr \
		-DFETCHCONTENT_TRY_FIND_PACKAGE_MODE:STRING=ALWAYS \
		-DAVRO_USE_BOOST=ON \
		-Wno-dev
	make
}

check() {
	cd "$srcdir/avro-release-$pkgver/lang/c++"
	make test -C build/
}

package() {
	cd "$srcdir/avro-release-$pkgver/lang/c++"

	msg2 'Installing license...'
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/avro-cpp"

	msg2 'Installing...'
	make DESTDIR="$pkgdir/" install -C build/
}
