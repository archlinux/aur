# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
pkgname=rasaeroii
pkgver=1.0.2.0
pkgrel=2
pkgdesc="Rogers Aeroscience RASAero Aerodynamic Analysis and Flight
Simulation Software"
arch=('x86_64')
url="https://rasaero.com/"
license=('LicenseRef-unknown')
depends=(wine bash)
makedepends=(msitools)
source=("https://rasaero.com/dloads/RASAero_II_Setup_Version_$pkgver.zip"
	"user_manual.pdf::https://rasaero.com/dloads/RASAero%20II%20Users%20Manual.pdf"
	"rasaeroii.sh")
sha256sums=('932e6ad7ad20d89f96594d0324dddc2a30a63324ddbb0c043dbce9a0bb56bef6'
            'f43769678ddef8bbffb48f0bd1c6dbcd1e4a50f8659d6db8e968e9d20b4e6709'
            '7839cf24450e66832bc3f979c00cd36eb2af05d26afddba041c39f855154f453')

prepare() {
	mkdir -p "$srcdir/$pkgname-$pkgver"
	msiextract --directory "$srcdir/$pkgname-$pkgver" "$srcdir/RASAero II Setup Version $pkgver.msi"
}

package() {
	install -Dm0755 "rasaeroii.sh" "$pkgdir/usr/bin/rasaeroii"
	install -Dm0755 "user_manual.pdf" "$pkgdir/usr/share/doc/$pkgname/user_manual.pdf"

	SHARE_FOLDER="$pkgdir/usr/share/$pkgname"
	install -dm0755 "$SHARE_FOLDER"

	cd "$srcdir/$pkgname-$pkgver"
	# User files, examples etc
	find "User's Personal Data Folder/RASAero II" \
		-mindepth 1 -maxdepth 1 \
		-exec cp -rv "{}" "$SHARE_FOLDER" \;

	# Program files
	install -dm0755 "$SHARE_FOLDER/bin"
	find \
		-mindepth 1 -maxdepth 1 \
		-not -ipath "*User's Personal Data Folder*" \
		-exec cp -v "{}" "$SHARE_FOLDER/bin" \;

	chmod -R 0755 "$SHARE_FOLDER"
}
