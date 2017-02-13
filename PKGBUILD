# Copied from scmccid
# Contributor: Atte Virtanen <aten.email@gmail.com>
# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>

pkgname=scl011
pkgver=2.09
pkgrel=1
pkgdesc="Binary driver for the SCM SCL011 (nPA / German eID)"
arch=('i686' 'x86_64')
url="http://support.identiv.com/scl010-scl011/"
license=('custom')
depends=('pcsclite' 'libusb-compat' 'scmccid')
#backup=('usr/local/scm/ini/scmccid.ini')
install=$pkgname.install
source=("http://files.identiv.com/products/smart-card-readers/contactless/scl010-011/Linux_Driver_Ver${pkgver}.zip")
sha256sums=('82e4eea07b2df6d3629bb96245ef99a1f4ca7730ff20aa27bd583ffcba366246')

package() {
	cd "$srcdir/Linux Driver Ver${pkgver}"

	if [ "$CARCH" = "x86_64" ]; then
		tar xf sclgeneric_${pkgver}_linux_64bit.tar.gz
		cd "sclgeneric_${pkgver}_linux_64bit"
	else
		tar xf sclgeneric_${pkgver}_linux_32bit.tar.gz
		cd "sclgeneric_${pkgver}_linux_32bit"
	fi

	bundle_path=`pkg-config libpcsclite --variable=usbdropdir`

	# Installation of ini file
	# This path seems to be hardcoded in the driver. Maybe it can be modified with sed
	# mkdir -p $pkgdir/usr/local/scm/ini
	# cp -f scmccid.ini $pkgdir/usr/local/scm/ini/
	# already included in scmccid...

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
