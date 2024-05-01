# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=adsklicensing
pkgver=14.0.0.10163
pkgrel=1
pkgdesc='Autodesk License Checking Software'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('adlmapps>=29')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adsklicensing${pkgver}-0-0.x86_64.rpm")
b2sums=('2a2967386ef08ad26c06ea472defb74b68d910cbbc3281125a041e4321d086f86dd8d850eea321bd823af824f63c780489524dc3901133d8498f47f79a4ad646')

options=(!strip)
install='adsklicensing.install'

prepare() {
	# Link service program in /usr/bin/
	mkdir -p usr/bin
	ln -s /opt/Autodesk/AdskLicensing/${pkgver}/AdskLicensingService/AdskLicensingService usr/bin/AdskLicensingService

	# Remove init service file
	rm opt/Autodesk/AdskLicensing/${pkgver}/AdskLicensingService/adsklicensing.el6.conf

	# Move systemd service file
	chmod 644 opt/Autodesk/AdskLicensing/${pkgver}/AdskLicensingService/adsklicensing.el7.service
	mkdir -p usr/lib/systemd/system
	mv opt/Autodesk/AdskLicensing/${pkgver}/AdskLicensingService/adsklicensing.el7.service \
		usr/lib/systemd/system/adsklicensing.service

	# Move font files
	mkdir -p usr/local/share/fonts
	mv opt/Autodesk/AdskLicensing/${pkgver}/AdskLicensingService/res/fonts usr/local/share/fonts/ArtifaktElement
}

package() {
	mv opt usr "$pkgdir/"
}
