# Maintainer: Atte Virtanen <aten.email@gmail.com>
# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>
pkgname=scmccid
pkgver=5.0.35
pkgrel=2
pkgdesc="Binary driver for the SCM smart card readers"
arch=('i686' 'x86_64')
url="http://support.identiv.com/products/"
license=('custom')
depends=('pcsclite' 'libusb0')
makedepends=('unzip')
backup=('usr/local/scm/ini/scmccid.ini')
install=$pkgname.install

source=("uTrust_Linux.zip::http://files.identiv.com/products/smart-card-readers/contact/scr3310v2/uTrust_Linux.tar.gz")

md5sums=('bef37fdc480a357396652492200ac91d')
sha1sums=('e4b9681b486cdb108a3d24433cdd063861e9be6e')
sha256sums=('3ca2bb8ffcfe964db33378c1c861405aad0bd68f15f517921c5c9b1f1455ac20')
sha384sums=('6a50d6182139ca85ac4cf61b6ebf5104aab442426714c530c67d950f8a9c3e8bc3a30f197f7a73fa548b0a937c4d8b52')
sha512sums=('b96fb39af2c6b43d2d54ac62c27aee50f3418c91dcd0bc061250af2f7e4edea52d7a66e82a91ac4aa8e92b160d7e7a57d44e372daeea8c484b02672f41999b36')

package() {
	cd "$srcdir"
	unzip "scmccid_${pkgver}_linux.zip"
	if [ "$arch" = "x86_64" ]; then
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
