# Maintainer: Nick Østergaard <oe.nick at gmail dot com>

pkgname=dsassistant
pkgver=2216
pkgrel=1
pkgdesc="Disk Station Assistant - An app to setup Synology DiskStations"
arch=('i686' 'x86_64')
url="http://www.synology.com/releaseNote_enu/Assistant.php"
license=('unknown')
depends=()
if test "$CARCH" == x86_64; then
	depends=("${depends[@]}" lib32-glibc lib32-glib2 lib32-libxt  lib32-libxext lib32-fontconfig lib32-libxrender)
fi
makedepends=(unzip)
source=(http://download.synology.com/download/ds/DSAssistant/${pkgname}_Linux_${pkgver}.zip
        SynologyAssistant.desktop
        dsassistant.png)
md5sums=('83dde169854c4ff9ef9dab048da6408c'
         '73e2c353c541bc79db01d40117d92133'
         '6b447bfb0e43256e2bf1d388a1b022d3')

build() {
  cd $srcdir

  mkdir -p ${pkgdir}/opt/dsassistant
  unzip -o dsassistant_Linux_${pkgver}.zip -d ${srcdir}
  tar zxvf ${srcdir}/linux/SynologyAssistant-4.0-${pkgver}.tar.gz -C ${pkgdir}/opt/dsassistant

	# Fix path for readlink
	sed -i "s%/bin/readlink%/usr/bin/readlink%g" ${pkgdir}/opt/dsassistant/SynologyAssistant/SynologyAssistant

  mkdir -p ${pkgdir}/usr/bin
  ln -sf /opt/dsassistant/SynologyAssistant/SynologyAssistant ${pkgdir}/usr/bin/SynologyAssistant
  ln -sf /opt/dsassistant/SynologyAssistant/SynologyAssistant ${pkgdir}/usr/bin/dsassistant

  install -Dm644 ${srcdir}/SynologyAssistant.desktop ${pkgdir}/usr/share/applications/SynologyAssistant.desktop
  install -Dm644 ${srcdir}/dsassistant.png ${pkgdir}/usr/share/pixmaps/dsassistant.png

  msg2 "Run it by 'SynologyAssistant' or 'dsassistant' when installed"
}
