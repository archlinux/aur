# Copied from scmccid
# Contributor: Atte Virtanen <aten.email@gmail.com>
# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>
# Maintainer: Andre Klitzing <aklitzing () gmail () com>

pkgname=sdi011
pkgver=5.0.18
pkgrel=1
pkgdesc="Binary driver for the SCM SDI011 (nPA / German eID)"
arch=('i686' 'x86_64')
url="http://support.identive-group.com/downloads.php"
license=('custom')
depends=('pcsclite' 'libusb-compat' 'scmccid')
#backup=('usr/local/scm/ini/scmccid.ini')
install=$pkgname.install

source_i686=("https://www.scm-pc-card.de/file/driver/Readers_Writers/SDI011_${pkgver}_linux_32bit.tar.gz")
source_x86_64=("https://www.scm-pc-card.de/file/driver/Readers_Writers/SDI011_${pkgver}_linux_64bit.tar.gz")

sha256sums_i686=('d581539a0038da62fa472eefe93e036e4385c93537a11854ddac634a6b1ff02a')
sha256sums_x86_64=('c1fe81367d159189f64a789700972e0d455871c8f7a6f436a9e614bd0066380e')

package() {
	cd "$srcdir/SDI011_${pkgver}_linux"

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
