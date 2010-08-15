# $Id$
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=jasper
pkgver=1.900.1
pkgrel=6
pkgdesc="A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard"
arch=('i686' 'x86_64')
url="http://www.ece.uvic.ca/~mdadams/jasper/"
license=('custom:JasPer2.0')
depends=('libjpeg' 'freeglut' 'libxi' 'libxmu' 'mesa')
makedepends=('unzip')
options=('!libtool')
source=(http://www.ece.uvic.ca/~mdadams/${pkgname}/software/${pkgname}-${pkgver}.zip jpc_dec.c.patch
        patch-libjasper-stepsizes-overflow.diff jasper-1.900.1-CVE-2008-3520.patch
        jasper-1.900.1-CVE-2008-3522.patch)
md5sums=('a342b2b4495b3e1394e161eb5d85d754' '36de7128eea6f701c1e2e13ce5bd8d37'\
         '24785d8eb3eea19eec7e77d59f3e6a25' '911bb13529483c093d12c15eed4e9243'\
         'ed441f30c4231f319d9ff77d86db2ef9')
sha1sums=('9c5735f773922e580bf98c7c7dfda9bbed4c5191' 'c1a0176a15210c0af14d85e55ce566921957d780'\
         'f298566fef08c8a589d072582112cd51c72c3983' '2483dba925670bf29f531d85d73c4e5ada513b01'\
         '0e7b6142cd9240ffb15a1ed7297c43c76fa09ee4')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	patch -Np1 < "${srcdir}/jpc_dec.c.patch"
	patch -Np1 < "${srcdir}/patch-libjasper-stepsizes-overflow.diff"
	patch -Np1 < "${srcdir}/jasper-1.900.1-CVE-2008-3520.patch"
	patch -Np1 < "${srcdir}/jasper-1.900.1-CVE-2008-3522.patch"

	./configure --prefix=/usr --mandir=/usr/share/man --enable-shared
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
