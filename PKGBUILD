# Copied from scmccid
# Contributor: Atte Virtanen <aten.email@gmail.com>
# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>

pkgname=scl011
pkgver=2.06
pkgrel=1
pkgdesc="Binary driver for the SCM SCL011 (nPA / German eID)"
arch=('i686' 'x86_64')
url="http://support.identive-group.com/downloads.php"
license=('custom')
depends=('pcsclite' 'libusb-compat' 'scmccid')
#backup=('usr/local/scm/ini/scmccid.ini')
install=$pkgname.install

source_i686=("http://support.identive-infrastructure.com/download/npa/${pkgname}_${pkgver}_linux_32bit.tar.gz")
source_x86_64=("http://support.identive-infrastructure.com/download/npa/${pkgname}_${pkgver}_linux_64bit.tar.gz")

sha256sums_i686=('136be4d6871320f8fe38e8a8c854f4246c00042fed3951fc776a32541cbaf24d')
sha256sums_x86_64=('45e81a507ee0d5dfdb8df4bb20341398aaad2d1c8b52765367dd04661dac92f6')

package() {
	if [ "$CARCH" = "x86_64" ]; then
		cd "$srcdir/${pkgname}_${pkgver}_linux_64bit"
	else
		cd "$srcdir/${pkgname}_${pkgver}_linux_32bit"
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
	cp ./proprietary/license $pkgdir/usr/share/licenses/$pkgname/LICENSE

	# Copy help to standard location
	# Contains instructions to customize the scmccid.ini
	mkdir -p $pkgdir/usr/share/doc/$pkgname
	cp ./ReadmeFirst.txt $pkgdir/usr/share/doc/$pkgname/
}
