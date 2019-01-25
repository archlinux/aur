# Contributor: Ross Melin <rdmelin@gmail.com>
# Contributor: Tri Le <trile7@gmail.com>
# Contributor: libc <primehunter326@gmail.com>
# Contributor: Albert Nguyen <albertbmnguyen@yahoo.com>
# Contributor: Maxim Devaev <mdevaev@gmail.com>


pkgname=mjpg-streamer
pkgver=r67
pkgrel=2
pkgdesc="Stream mjpeg frames from a webcam via http"
url="https://github.com/jacksonliam/mjpg-streamer"
license=(GPL)
arch=(i686 x86_64 armv6h armv7h)
depends=(libjpeg)
makedepends=(gcc cmake)

_commit="f387bb44e6c087271b763b27da998bf2e06c4f5d"
source=("https://github.com/jacksonliam/mjpg-streamer/archive/$_commit.tar.gz")
sha1sums=("298ad7adebe3876b87d4e19f76e4d2425fd0c9ff")


build() {
	cd "$srcdir/mjpg-streamer-$_commit/mjpg-streamer-experimental"

	unset CPPFLAGS
	unset LDFLAGS
	unset CXXFLAGS
	unset CHOST
	unset CFLAGS

	[ -d _build ] || mkdir _build
	[ -f _build/Makefile ] || (cd _build && cmake -DPLUGIN_INPUT_OPENCV=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=$(CMAKE_BUILD_TYPE) ..)
	make -C _build
	cp _build/mjpg_streamer .
	find _build -name "*.so" -type f -exec cp {} . \;
}

package() {
	cd "$srcdir/mjpg-streamer-$_commit/mjpg-streamer-experimental"
	make DESTDIR="$pkgdir" install
}
