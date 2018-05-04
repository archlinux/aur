# Maintainer: Bjoern Franke <bjo@nord-west.org>
# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>
pkgname=scmccid
pkgver=5.0.35
pkgrel=4
pkgdesc="Binary driver for the SCM smart card readers"
arch=('i686' 'x86_64')
url="http://support.identiv.com/products/"
license=('custom')
depends=('pcsclite' 'libusb0')
makedepends=('unzip')
backup=('usr/local/scm/ini/scmccid.ini')
install=$pkgname.install

source=("uTrust_Linux.zip::http://files.identiv.com/products/smart-card-readers/common-drivers/uTrust_Linux.tar.gz")

sha256sums=('3ca2bb8ffcfe964db33378c1c861405aad0bd68f15f517921c5c9b1f1455ac20')


package() {
	cd "$srcdir"
	unzip "scmccid_${pkgver}_linux.zip"
	if [ "$CARCH" = "x86_64" ]; then
		tar xvf "scmccid_${pkgver}_linux_64bit.tar.gz"
	else
		tar xvf "scmccid_${pkgver}_linux.tar.gz"
	fi
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
