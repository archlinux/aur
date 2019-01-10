# Maintainer: Bjoern Franke <bjo@nord-west.org>
# Contributor: egore911
pkgname=scmccid
pkgver=5.0.35
pkgrel=5
pkgdesc="Binary driver for the SCM smart card readers"
arch=('i686' 'x86_64')
url="http://support.identiv.com/products/"
license=('custom')
depends=('pcsclite' 'libusb-compat')
makedepends=('unzip')
backup=('usr/local/scm/ini/scmccid.ini')
install=$pkgname.install
source_x86_64=(https://scm-pc-card.de/file/driver/Readers_Writers/scmccid_5.0.35_linux_rel_64.tar.gz)
source_i686=(https://scm-pc-card.de/file/driver/Readers_Writers/scmccid_5.0.35_linux_rel.tar.gz)

sha256sums_i686=('791a80a1eeee6544d32e1dcaddb7383e6566a89b6f4a97ce0565dd8f274def65')
sha256sums_x86_64=('4857f7402fb585909622020e1007c81d1ebc3c71574d6f1a993e03e5431331e4')

package() {
	cd "scmccid_${pkgver}_linux"

	bundle_path=`pkg-config libpcsclite --variable=usbdropdir`

	# Installation of ini file
	# This path seems to be hardcoded in the driver. Maybe it can be modified with sed
	mkdir -p $pkgdir/usr/local/scm/ini
	cp -f scmccid.ini $pkgdir/usr/local/scm/ini/

	# Installation of the driver bundle(s)
	mkdir -p $pkgdir/$bundle_path
	cp -rf ./proprietary/*.bundle $pkgdir/$bundle_path
	chmod -R 755 $pkgdir/$bundle_path

	# Create symbolic link from open source pcscd bundle path
	mkdir -p $pkgdir/usr/local/pcsc/drivers

	cd ./proprietary
	for bundle in *.bundle; do
		ln -sf $bundle_path/$bundle $pkgdir/usr/local/pcsc/drivers/$bundle
	done
	cd ..

	# Copy license to standard location
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	cp ./proprietary/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# Copy help to standard location
	# Contains instructions to customize the scmccid.ini
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	cp ./ReadmeFirst.txt $pkgdir/usr/share/doc/$pkgname/
}
