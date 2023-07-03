# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
pkgname=rasaeroii
pkgver=1.0.2.0
pkgrel=1
pkgdesc="Rogers Aeroscience RASAero Aerodynamic Analysis and Flight
Simulation Software"
arch=('x86_64')
url="https://rasaero.com/"
license=('unknown')
depends=(wine)
makedepends=(msitools)
source=("https://rasaero.com/dloads/RASAero_II_Setup_Version_$pkgver.zip"
	"rasaeroii.sh")
sha256sums=('932e6ad7ad20d89f96594d0324dddc2a30a63324ddbb0c043dbce9a0bb56bef6'
            '7839cf24450e66832bc3f979c00cd36eb2af05d26afddba041c39f855154f453')

prepare() {
	mkdir -p "$srcdir/extracted"
	msiextract --directory "$srcdir/extracted" "$srcdir/RASAero II Setup Version $pkgver.msi"
}

package() {
	SHARE_FOLDER="$pkgdir/usr/share/rasaeroii"
	install -dm0755 "$SHARE_FOLDER"

	# User files, examples etc
	find "$srcdir/extracted/User's Personal Data Folder/RASAero II" \
		-mindepth 1 -maxdepth 1 \
		-exec cp -rv "{}" "$SHARE_FOLDER" \;

	# Program files
	install -dm0755 "$SHARE_FOLDER/bin"
	find "$srcdir/extracted" \
		-mindepth 1 -maxdepth 1 \
		-not -ipath "*User's Personal Data Folder*" \
		-exec cp -v "{}" "$SHARE_FOLDER/bin" \;

	chmod -R 0755 "$SHARE_FOLDER"

	# Run script
	install -Dm0755 "$srcdir/rasaeroii.sh" "$pkgdir/usr/bin/rasaeroii"
}
