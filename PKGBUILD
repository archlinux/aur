# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=adsklicensing
pkgver=16.2.5.15199
pkgrel=1
pkgdesc='Autodesk License Checking Software'
arch=('x86_64')
url="https://www.autodesk.com/"
license=('custom')
depends=('adlmapps>=29' 'adskidentitymanager>=1.18' 'openssl-1.1')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adsklicensing${pkgver}-0-0.x86_64.rpm")
b2sums=('8860c7b2060c343e62c9c3a95c93316f64fcafcaec65385d7552b65f62d652d41cdc5bc5e5d927928d201755f68f48c5c55ec16210bfc858164bad848d005c75')

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

	# Link the expected cert location
	mkdir -p etc/pki/tls/certs
	ln -s /etc/ssl/certs/ca-certificates.crt etc/pki/tls/certs/ca-bundle.crt

	# Create the CER directory
	mkdir -p var/lib/Autodesk/CER
}

package() {
	mv etc opt usr var "$pkgdir/"
}
