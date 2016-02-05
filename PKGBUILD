# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=linux-think-firmware
pkgdesc="Extra firmwares for linux-think"
pkgver=0.2
pkgrel=1
arch=('i686','x86_64')
url="https://github.com/the-darkvoid/BrcmPatchRAM/"
license=('custom')
arch=('any')
makedepends=('make'
	     'git'
	     'zlib')
conflicts=('aic94xx-firmware')	     

source=('BCM20702A1_001.002.014.1483.1669_v5765.zhx'
	'git://github.com/jessesung/hex2hcd.git#branch=master'
	'http://download.adaptec.com/scsi/linux/aic94xx-seq-30-1.tar.gz'
	'LICENSE.aic94xx')

md5sums=('21bb923d4445d3ae395d3cc2f5d53190'
	 'SKIP'
	 '1fed6c024581ee84f57db8aad51b7fb3'
	 '4a8e47177fbb1dda903b1e056a7bfedd')

prepare(){
	zlib-flate -uncompress < "${srcdir}/BCM20702A1_001.002.014.1483.1669_v5765.zhx" > "${srcdir}/BCM20702A1_001.002.014.1483.1669_v5765.hex"
	cd ${srcdir}/hex2hcd
	make
}

build() {
	bsdtar xvf aic94xx_seq-30-1.noarch.rpm
	chmod 644  "${srcdir}/lib/firmware/aic94xx-seq.fw"
}

package(){
	cd ${srcdir}
	./hex2hcd/hex2hcd BCM20702A1_001.002.014.1483.1669_v5765.hex BCM20702A1-0a5c-21e6.hcd > build.log
	install -D -m644 "${srcdir}/BCM20702A1-0a5c-21e6.hcd" "${pkgdir}/usr/lib/firmware/brcm/BCM20702A1-0a5c-21e6.hcd"
	install -Dm644 ${srcdir}/lib/firmware/aic94xx-seq.fw ${pkgdir}/usr/lib/firmware/aic94xx-seq.fw
        install -Dm644 ${srcdir}/LICENSE.aic94xx ${pkgdir}/usr/share/doc/${pkgname}/LICENSE.aic94xx
        install -Dm644 ${srcdir}/README-94xx.pdf ${pkgdir}/usr/share/doc/${pkgname}/README-94xx.pdf
}
