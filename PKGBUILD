# Maintainer: relrel <relrelbachar@gmail.com>
pkgname=scratch3
pkgver=3.17.1
pkgrel=1
pkgdesc="Create stories, games, and animations, share with others around the world"
arch=('any')
url="https://scratch.mit.edu/"
license=('BSD')
depends=(electron)
makedepends=(p7zip gendesk)
source=("https://downloads.scratch.mit.edu/desktop/Scratch%20$pkgver%20Setup.exe"
        "https://scratch.mit.edu/images/download/icon.png"
        "$pkgname"
        "$pkgname.xml")
noextract=("Scratch%20$pkgver%20Setup.exe")
sha512sums=('71f6dce077db24f3b372f9030bdeb2e25bccf85532bfe24ba0a04b523885d6f9afc334866079e10f8902c8f549cdb8a29eff8c34561d625061f296b373f40a0c'
            '66ec37746fa3fdc21c30a53050f73cd989b0da01edecb4dc75aadae8cb616a8913ff3ec0e4145d214b06548cf1a767eea1c1890a617e484db4da009867304a43'
            'd9dd01d52f91ded4ef033dcd22ed97e7bf3a2afc64b28b5c2d36efd095897953f0d93b7e5ec98905b970f99da2fa57b88e56e01cad54eec13af98e4786cb5bc7'
            '9d64101c6dc8eb961c130ed7b7bb3a49f482b02674d4fa28b45e836634bda8e02de3fdf84aab6291c2781597e494737a5ba29cbf7a9c7e1e110a3fcba87f6eb8')

prepare() {
	cd "$srcdir/"

	7za x -bd -y "Scratch%20$pkgver%20Setup.exe" resources/

	# Fix permissions
	chmod 755 resources/{,static/{,assets/}}

	gendesk -f -n \
		--name "Scratch 3" \
		--exec "$pkgname %f" \
		--mimetypes "application/x-$pkgname-project"
}

package() {
	install -Dm644 -t "$pkgdir/usr/share/$pkgname/" "$srcdir/resources/app.asar"
	cp -r "$srcdir/resources/static/" "$pkgdir/usr/share/$pkgname/"

	install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname.desktop"
	install -Dm644 -t "$pkgdir/usr/share/mime/packages/" "$srcdir/$pkgname.xml"

	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/72x72/apps/$pkgname.png"
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/72x72/mimetypes/x-$pkgname-project.png"
}
