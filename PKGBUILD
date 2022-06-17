# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=adsklicensing
pkgver=12.1.0.7121
pkgrel=1
pkgdesc='Autodesk License Checking Software'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('adlmapps>=25')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adsklicensing${pkgver}-0-0.x86_64.rpm"
		'adsklicensing.install')
sha256sums=('9056c8ca2d006bb19963dcdc5cbb649441611aa78b57ed1a5a4b86aa921f2100'
			'ab9da8ffde6480cd29a7235b3fe874b08b045ccab0e060e0af55499eb739f225')

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
	mv opt usr $pkgdir/
}
