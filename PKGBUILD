# Maintainer: friehmaen <fm@xers.de>
# Contributor: ianux <ianux@free.fr>

pkgname=asdcplib2
_pkgname=asdcplib
pkgver=2.7.18
pkgrel=1
pkgdesc="open source implementation of SMPTE and the MXF Interop “Sound & Picture Track File” format with IMF support"
arch=('i686' 'x86_64')
url="http://www.cinecert.com/asdcplib/"
license=('custom')
depends=('expat' 'openssl')

source=("http://download.cinecert.com/asdcplib/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('4772b4f0c4ab887f30e092b0a4f87dcc73ea36fd')
md5sums=('6180176e13dc0241437f8b2630433766')

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

