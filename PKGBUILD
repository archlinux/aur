# Maintainer: friehmaen <fm@xers.de>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib2
_pkgname=asdcplib
pkgver=2.7.19
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format with IMF support"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('custom')
depends=('expat' 'openssl')

source=("http://download.cinecert.com/asdcplib/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('00613125d3dffee29ca94407053b1dace1decb8a')
md5sums=('f9290440d1645cc834cfb9fb5a337348')

prepare() {
	# --as-needed seems to break compatibility with libexpat, and configure step does not detect libexpat
	export LDFLAGS="${LDFLAGS//--as-needed,}"
}

build() {
	cd ${_pkgname}-${pkgver}

	# expat is required to open subtitle files
	./configure --prefix=/usr --enable-as-02 --with-expat
	make
}

package() {
	cd ${_pkgname}-${pkgver}
  
	make DESTDIR=${pkgdir} install

	#copy license file
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

