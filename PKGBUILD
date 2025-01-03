# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
_pkgname=rasaeroii
pkgname=$_pkgname-bin
pkgver=1.0.2.0
pkgrel=1
pkgdesc="Rogers Aeroscience RASAero Aerodynamic Analysis and Flight Simulation Software"
arch=('any')
url="https://rasaero.com/"
license=('LicenseRef-unknown')
depends=(wine bash)
makedepends=(msitools icoutils)
source=("https://rasaero.com/dloads/RASAero_II_Setup_Version_$pkgver.zip"
	"user_manual.pdf::https://rasaero.com/dloads/RASAero%20II%20Users%20Manual.pdf"
	"RASAeroII.desktop"
	"rasaeroii.sh")
sha256sums=('932e6ad7ad20d89f96594d0324dddc2a30a63324ddbb0c043dbce9a0bb56bef6'
            'f43769678ddef8bbffb48f0bd1c6dbcd1e4a50f8659d6db8e968e9d20b4e6709'
            '9efc9608bc22f9242e7f027ce7c85e0a407f2e152dfb882c29b0ef9151e32463'
            '9d7d3378536dd87b6346fc00cb602e68a045fdf33479cf9e2f735905c6b2fd12')
provides=($_pkgname)
conflicts=($_pkgname)

prepare() {
	mkdir -p "$pkgname-$pkgver"
	msiextract --directory "$srcdir/$pkgname-$pkgver" "$srcdir/RASAero II Setup Version $pkgver.msi"
	cd "$pkgname-$pkgver"
	icotool -x Rocket.ico
}

package() {
	install -Dm0755 "rasaeroii.sh" "$pkgdir/usr/bin/rasaeroii"
	install -Dm0644 "user_manual.pdf" "$pkgdir/usr/share/doc/$_pkgname/user_manual.pdf"
	install -Dm0644 "RASAeroII.desktop" "$pkgdir/usr/share/applications/RASAeroII.desktop"

	SHARE_FOLDER="$pkgdir/usr/share/$_pkgname"
	install -dm0755 "$SHARE_FOLDER"

	cd "$srcdir/$pkgname-$pkgver"
	# User files, examples etc
	install -Dm0644 -t "$SHARE_FOLDER/data" \
		"User's Personal Data Folder/RASAero II/LSD.xml" \
		"User's Personal Data Folder/RASAero II/rasp.eng"
	find "User's Personal Data Folder/RASAero II/Examples" -type f -exec \
		install -Dm0644 -t "$SHARE_FOLDER/data/Examples" {} \;
	# The two example files that are in the root directory for unknown reasons
	install -Dm0644 -t "$SHARE_FOLDER/data/Examples" \
		'AeroPac104KStageOne&Two-2.CDX1' \
		'AeroPac104KStageOne&Two.rkt'

	# Application icon
	install -Dm0644 "Rocket_1_256x256x32.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"

	# Program files
	install -Dm0755 -t "$SHARE_FOLDER/bin" \
		"RASAero II.exe" \
		FarPoint.Win.Input.dll \
		LineControls.dll \
		MACTrackBarLib.dll \
		ZedGraph.dll
}
