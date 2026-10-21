pkgname=ahwoo-bin
pkgver=2026.10.17.1348
pkgrel=1
pkgdesc='Launcher for Ahwoo games'
arch=('x86_64')
url='https://neutrino.ahwoo.com'
license=('LicenseRef-custom')
depends=('glibc' 'bash' 'fontconfig')
source=('Ahwoo.tar.gz::https://neutrino.ahwoo.com/download/linux'
	    'ahwoo.png::https://neutrino.ahwoo.com/favicon.png'
	    'version.json::https://install.ahwoo.com/linux-x64/tar/version.json')
sha256sums=('SKIP'
		    'SKIP'
		    'SKIP')
options=(!strip)

pkgver() {
	awk -F'"' '/version/ {print $4}' version.json
}

prepare() {
	cd "$srcdir"

	printf "\033[1;34m  ->\033[0m\033[1m Validating Ahwoo.tar.gz...\n"

	local expected_sha
	local actual_sha
	expected_sha=$(awk -F'"' '/sha256/ {print $4}' version.json)
	actual_sha=$(sha256sum "$srcdir/Ahwoo.tar.gz" | cut -d' ' -f1)

	if [ "$expected_sha" != "$actual_sha" ]; then
		printf "\033[1;31m==> ERROR:\033[0m\033[1m Ahwoo.tar.gz did not pass the validity check!\033[0m\n" >&2
		printf "    \033[1mExpected:\033[0m\033[1m %s\033[0m\n" "$expected_sha" >&2
		printf "    \033[1mActual:\033[0m\033[1m   %s\033[0m\n" "$actual_sha" >&2
		return 1
	fi

	printf "\033[1;32m==>\033[0m\033[1m Checksum verified successfully\033[0m\n"
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
