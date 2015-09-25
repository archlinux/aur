# Maintainer: Atte Virtanen <aten.email@gmail.com>
# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>
pkgname=scmccid
pkgver=5.0.34
pkgrel=1
pkgdesc="Binary driver for the SCM smart card readers"
arch=('i686' 'x86_64')
url="http://support.identive-group.com/downloads.php"
license=('custom')
depends=('pcsclite' 'libusb-compat')
backup=('usr/local/scm/ini/scmccid.ini')
install=$pkgname.install

source_i686=("http://support.identive-group.com/download.php?file=driver/${pkgname}_${pkgver}_linux_32bit_rel.tar.gz")
source_x86_64=("http://support.identive-group.com/download.php?file=driver/${pkgname}_${pkgver}_linux_64bit_rel.tar.gz")

md5sums_i686=('788e4b1eefd93cb20d8fa63cb48a4f80')
md5sums_x86_64=('f0338934bc758ea524435dc98d9c941f')
sha1sums_i686=('0f2e81bdcaf04690f7799fdbb73d89f3415a743f')
sha1sums_x86_64=('f45b99ffb617d0eac6537cb7153fd1b94f26c833')
sha256sums_i686=('eb2d07d4485e54d82d1d7c1161d4e72fbed1747ee5d786321a5195eff39cbbb4')
sha256sums_x86_64=('fe130c959a353e817c2104b0df8488d587b6279c6d8a286305867dadc2252b1a')
sha384sums_i686=('2b154e7fa864c16cff75b9d35ef3dd772aefe4fa9c2155786d4a5aa29a0e075c0593dfd32b7a7184fc6e09249bbeda38')
sha384sums_x86_64=('65570017d8c781e2cbfbf73a837d738f47b80be63f1a29c38631cd963d24d20ae2285df0a0d2521e0a4da96c8b76b1c3')
sha512sums_i686=('ccb5a851887d7da20ec36dde1ebd2134d42654e0ebd64e0a0b38e0f4cb47c9208a9ff31764f0f6762f12d0b003efe46f84c6e574f73535ef3da86d855b94dc60')
sha512sums_x86_64=('b82e588ba67c243ab44c23450d317f3b8f0e5a501b0183de7afb4c1b5d6a8e25ae9bdd1a28225f8157c2df0b43fa2bb165e07773ff51fb0e2aa280bbbcc7020c')

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
