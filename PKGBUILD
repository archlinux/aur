# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=linux-think-firmware
pkgdesc="Extra firmwares for linux-think"
pkgver=0.3
pkgrel=1
arch=('i686','x86_64')
url="https://github.com/the-darkvoid/BrcmPatchRAM/"
license=('custom')
arch=('any')
makedepends=('make'
'git'
'zlib'
'lha')
conflicts=('aic94xx-firmware'
'wd719x-firmware')	     

source=('BCM20702A1_001.002.014.1483.1669_v5765.zhx'
'https://raw.githubusercontent.com/FadeMind/archpkgbuilds/master/AUR/customized/wd719x-firmware/pciscsi.exe'
'git://github.com/jessesung/hex2hcd.git#branch=master'
'http://download.adaptec.com/scsi/linux/aic94xx-seq-30-1.tar.gz'
'LICENSE.aic94xx')
noextract=('pciscsi.exe')

md5sums=('21bb923d4445d3ae395d3cc2f5d53190'
'c5f7dc52c96e606e403751a4c482d785'
'SKIP'
'1fed6c024581ee84f57db8aad51b7fb3'
'4a8e47177fbb1dda903b1e056a7bfedd')

prepare(){
  zlib-flate -uncompress < "${srcdir}/BCM20702A1_001.002.014.1483.1669_v5765.zhx" > "${srcdir}/BCM20702A1_001.002.014.1483.1669_v5765.hex"
  cd ${srcdir}/hex2hcd
  make
}

build() {

  lha xi pciscsi.exe pci-scsi.exe
  lha xi pci-scsi.exe nt/wd7296a.sys
  dd if=wd7296a.sys of=wd719x-risc.bin bs=1 skip=5760 count=14336
  dd if=wd7296a.sys of=wd719x-wcs.bin bs=1 skip=20096 count=514

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

  install -Dm644 $srcdir/wd719x-risc.bin $pkgdir/usr/lib/firmware/wd719x-risc.bin
  install -Dm644 $srcdir/wd719x-wcs.bin $pkgdir/usr/lib/firmware/wd719x-wcs.bin
}
