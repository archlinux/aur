# Maintainer: Sharif Olorin <sio@tesser.org>

# FIXME: sort dependencies out properly rather than building a
#        statically-linked binary.

pkgname=orthanc
pkgver=0.8.6
pkgrel=3
pkgdesc="Open-source, lightweight DICOM server."
arch=("x86_64" "i686")
url="http://orthanc-server.com/"
license="custom:GPL3WithOpenSSLException"
source=("Orthanc-$pkgver.tar.gz::http://downloads.sourceforge.net/orthancserver/Orthanc-0.8.6.tar.gz")
depends=("util-linux")
makedepends=("python" "cmake" "mercurial" "unzip" "doxygen")

build() {
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr \
		-DSTATIC_BUILD=ON \
		-DCMAKE_BUILD_TYPE=Release \
		$srcdir/Orthanc-$pkgver
	make
	make doc
}

check() {
	./UnitTests
}

package() {
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	install -m 444 $srcdir/Orthanc-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname
	make install
	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/sbin/* $pkgdir/usr/bin
	rmdir $pkgdir/usr/sbin
}
sha256sums=('0668e23dbdf4aa12bf417cf22bfb7b50379797fc6b1132a582789289d1728e69')
