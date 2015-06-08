# Maintainer: Atte Virtanen <aten.email@gmail.com>
# Contributor: Cesar Alcalde <lambda512 _at_ gmail.com>
pkgname=scmccid
pkgver=5.0.33
pkgrel=1
pkgdesc="Binary driver for the SCM smart card readers"
arch=('i686' 'x86_64')
url="http://support.identive-group.com/downloads.php"
license=('custom')
depends=('pcsclite' 'libusb-compat')
backup=('usr/local/scm/ini/scmccid.ini')
install=$pkgname.install

source_i686=("http://support.identive-group.com/download.php?file=driver/${pkgname}_${pkgver}_linux_32bit_rel.zip")
source_x86_64=("http://support.identive-group.com/download.php?file=driver/${pkgname}_${pkgver}_linux_64bit_rel.zip")

md5sums_i686=('94a3c49bc601c932c4c8b5ca59dd95a2')
md5sums_x86_64=('ff294c1fd3dc08a00b6effe9f8bec014')
sha1sums_i686=('ae07f5f7ba3d3803bc128f32f4291c1bac2a809e')
sha1sums_x86_64=('88b4f45977717e71fdf4a56b419224b6cf0bd26c')
sha256sums_i686=('141d6582fe884a4eace6c2286759b17e68e1fd60d7ca993c966087f7b4fa67ba')
sha256sums_x86_64=('699706688d4c1a55b1099dbbc063d97984d4ccbf361106295072d2dfaea399d7')
sha384sums_i686=('20ede330731093bb18f54d5f89524211f877fde663d65f7f89405191787fea9d9184f1efdfc8df0a31b5f6a4fb8f8672')
sha384sums_x86_64=('118d079a19651941ec7a287d725c5215c82ce04266ef4ef6fe97d024fdcd554b9fda590aa92b0de8126de5a6f1bc206b')
sha512sums_i686=('20d2e97c66b60ab347bf4094fa4f909d131eeae612c80d2737ac1003387b8a37ab7168edb469578550fe21e110a181814effd6bbed076ff0d9873ab8f5806b39')
sha512sums_x86_64=('cd4c130ffd1ae9af7148d81c6d63f3ec7f6cf62942d43c3c11bec8c3094d00fb5abf7551e56f3ea700dc00fcd8e375a35cbc745a4b0f06b21600ce275f15dd81')

package() {
	case "$CARCH" in
		i686)   cd "$srcdir/${pkgname}_${pkgver}_linux_32bit_rel" ;;
		x86_64) cd "$srcdir/${pkgname}_${pkgver}_linux_64bit_rel" ;;
	esac

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
