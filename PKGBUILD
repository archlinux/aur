# Maintainer: Your Name <youremail@domain.com>
pkgname=tsmclient
pkgver=7.1.0
pkgrel=1
epoch=
pkgdesc="IBM Tivoli Storage Manager Client"
arch=('x86_64')
url="http://www-03.ibm.com/software/products/en/tivostormana/"
license=('proprietary')
depends=()
makedepends=(rpmextract)
checkdepends=()
optdepends=()
provides=()
conflicts=()
install=

source=(ftp://public.dhe.ibm.com/storage/tivoli-storage-management/maintenance/client/v7r1/Linux/LinuxX86/BA/v710/7.1.0.0-TIV-TSMBAC-LinuxX86.tar
	run.sh
	dsmcad.service)

sha1sums=('6e790443ebd4de883cf4b03c642621233978103e'
          'c4de331dc34a617a7957f164ef25e0f4baf69be9'
          'd4702d06339da46e998980e0d145e1f3e92f30aa')

prepare() {
	cd "$srcdir/"
	for rpmfile in *.rpm; do
		echo "Extracting '$rpmfile'"
		rpmextract.sh $rpmfile
	done

	# replace symlinks in usr/bin with symlinks to wrapper script
	# that correctly sets environment variables
	binaries=$(ls $srcdir/usr/bin/)
	rm $srcdir/usr/bin/*
	for bin in $binaries; do
		ln -s "/opt/tivoli/tsm/run.sh" "$srcdir/usr/bin/$bin" 
	done
}

package() {
	cd "$srcdir/"

	cp -r "$srcdir/etc" "$pkgdir/"
	cp -r "$srcdir/opt" "$pkgdir/"
	cp -r "$srcdir/usr" "$pkgdir/"

	ln -s "/opt/tivoli/tsm/client/lang/EN_US" "$pkgdir/opt/tivoli/tsm/client/ba/bin/EN_US"

	install -m 755 "$srcdir/run.sh" "$pkgdir/opt/tivoli/tsm/"
	install -Dm 644 "$srcdir/dsmcad.service" "$pkgdir/usr/lib/systemd/system/dsmcad.service"

	# Install ld.so.conf.d file so that shared libraries can be found
	#install -Dm 644 "$srcdir/tsmclient.conf" "$pkgdir/etc/ld.so.conf.d/tsmclient.conf"

}
