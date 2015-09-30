# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=pms
pkgver=1.90.1
pkgrel=3
pkgdesc='DLNA compliant Upnp Media Server for the PS3, written in Java.'
arch=('i686' 'x86_64')
url='http://www.ps3mediaserver.org/'
license=('GPL2')
depends=('mplayer' 'ffmpeg' 'java-runtime' 'mencoder' 'libmediainfo' 'tsmuxer-ng')
makedepends=('unzip')
optdepends=('vlc: Internet video/audio support')
backup=('opt/pms/PMS.conf' 'opt/pms/WEB.conf')
source=("http://sourceforge.net/projects/ps3mediaserver/files/${pkgname}-${pkgver}-generic-linux-unix.tar.gz"
	'pms.desktop'
	'pms.service')
sha256sums=('e90b20e548f66514c66524634f8458d9d133846fa1fc2fcabdbab19907047311'
            '9fb77fef43221f6b9fa2cd8043e67d4cf61fd1181be28c0ac9bd33b4e6aa6bd5'
            '918809ca188072a41e34d719eb9b3f20eb04b4cd53d7d6b80b6ab9d328e22e5c')

package() {
	cd ${srcdir}/

	install -d -m0755 ${pkgdir}/opt/pms
	install -d -m0775 -g users ${pkgdir}/opt/pms/database
	install -d -m0755 ${pkgdir}/usr/bin

	rm ${pkgname}-${pkgver}/tsMuxeR
	ln -s /usr/bin/tsMuxeR ${pkgname}-${pkgver}/tsMuxeR

	cp -r ${pkgname}-${pkgver}/* ${pkgdir}/opt/pms/

	sed -i '2i PMS_HOME=/opt/pms\ncd ${PMS_HOME}' ${pkgdir}/opt/pms/PMS.sh
	ln -s /opt/pms/PMS.sh ${pkgdir}/usr/bin/ps3mediaserver

	chmod +x ${pkgdir}/opt/pms/PMS.sh

	unzip -q -u ${pkgname}-${pkgver}/pms.jar -d pms_jar
	install -D -m 0644 pms_jar/resources/images/clients/ps3.png ${pkgdir}/usr/share/pixmaps/pms.png
	install -D -m 0644 pms.desktop ${pkgdir}/usr/share/applications/pms.desktop
	install -D -m 0644 pms.service ${pkgdir}/usr/lib/systemd/system/pms@.service
}

