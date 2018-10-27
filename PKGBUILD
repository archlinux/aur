# Maintainer: friehmaen <fm@xers.de>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib2
_pkgname=asdcplib
pkgver=2.10.31
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format with IMF support"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('custom')
depends=('expat' 'openssl')

source=("http://download.cinecert.com/asdcplib/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('71623e8fc57ead6557f1df80ca374fef7e6f92a61b6f8a330d09f9fbeb96eb9b')

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

