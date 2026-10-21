pkgname=ahwoo-bin
pkgver=2026.10.17.1348
pkgrel=1
pkgdesc='Launcher for Ahwoo games'
arch=('x86_64')
url='https://neutrino.ahwoo.com'
license=('LicenseRef-custom')
depends=('glibc' 'bash' 'fontconfig')
source=('https://neutrino.ahwoo.com/download/linux'
	    'ahwoo.png::https://neutrino.ahwoo.com/favicon.png')
sha256sums=('SKIP'
		    'SKIP')
options=(!strip)

pkgver() {
	cd "$srcdir/ahwoo"
	AHWOO_DISABLE_BOOTSTRAPPER_AUTO_UPDATE=1 ./ahwoo --version
}

package() {
	cd "$srcdir/ahwoo"

	install -d "$pkgdir/usr/bin"
	install -d "$pkgdir/usr/lib/ahwoo"

	install -Dm755 ahwoo "$pkgdir/usr/lib/ahwoo/"
	install -Dm644 libHarfBuzzSharp.so "$pkgdir/usr/lib/ahwoo/"
	install -Dm644 libSkiaSharp.so "$pkgdir/usr/lib/ahwoo/"
	cp -r Service "$pkgdir/usr/lib/ahwoo/"
	cp -r libexec "$pkgdir/usr/lib/ahwoo/"

	install -Dm644 "$srcdir/ahwoo.png" "$pkgdir/usr/share/pixmaps/ahwoo.png"

	install -Dm755 /dev/stdin "$pkgdir/usr/bin/ahwoo" << 'EOF'
#!/usr/bin/sh
export AHWOO_DISABLE_BOOTSTRAPPER_AUTO_UPDATE=1
exec /usr/lib/ahwoo/ahwoo "$@"
EOF

	install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ahwoo.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Ahwoo
Comment=Launcher for Ahwoo games
Exec=/usr/bin/ahwoo
Icon=ahwoo
Categories=Game;Launcher;
Terminal=false
EOF
}
