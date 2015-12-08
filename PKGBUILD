# Maintainer: Atte Virtanen <aten.email@gmail.com>
# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>
pkgname=scmccid
pkgver=5.0.35
pkgrel=1
pkgdesc="Binary driver for the SCM smart card readers"
arch=('i686' 'x86_64')
url="http://support.identive-group.com/downloads.php"
license=('custom')
depends=('pcsclite' 'libusb-compat')
backup=('usr/local/scm/ini/scmccid.ini')
install=$pkgname.install

source_i686=("http://support.identive-group.com/download.php?file=driver/${pkgname}_${pkgver}_linux.tar.gz")
source_x86_64=("http://support.identive-group.com/download.php?file=driver/${pkgname}_${pkgver}_linux_64bit.tar.gz")

md5sums_i686=('0487b1373865c740dda0dcd490cc5b83')
md5sums_x86_64=('a9500c36e78981534789c40a47af07b6')
sha1sums_i686=('2f3bd8365bc9ce6c1edc5d84aee955570903e0c8')
sha1sums_x86_64=('c9328f500a7c89c10cce18e3221d7e364d3534da')
sha256sums_i686=('791a80a1eeee6544d32e1dcaddb7383e6566a89b6f4a97ce0565dd8f274def65')
sha256sums_x86_64=('4857f7402fb585909622020e1007c81d1ebc3c71574d6f1a993e03e5431331e4')
sha384sums_i686=('1bdeabc2efa9c4e941a9f30de410d3fd5ce96a0fae0467ceecfea8ba273c58740fa4489c4c11bd5566f2d098f8fd3910')
sha384sums_x86_64=('b576393db70062833661b7aaeb957195afe05708031b575e52f9321fd4007543cd6a0f86e6c574e26bfe138a2a451d6d')
sha512sums_i686=('2c5d7a4fa0482945ab45f823d418c4bd58a0f04dde40b3986cbf71a92b299763d03d84e7cd56c30c63266685ce45f3b97411dfc99ea59484c8d5b8d700b2348c')
sha512sums_x86_64=('7bf09ed3ec62d4c2df9680238c02d60c876e27e58d85270618e770b55150bc4bd4add55d3f747e89bdc1685a4c6c6e1a12892772a44ca21023cffa0a6b1455e6')

package() {
	cd "$srcdir/${pkgname}_${pkgver}_linux"

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
