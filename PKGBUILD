# Maintainer: Corey Bruce <cdfrosty at gmail dot com>

pkgname=sonic3air-bin
pkgver=v24.02.02.1
scriptver=1.0.2
pkgrel=5
arm64librel=1
pkgdesc='A fan-made widescreen remaster of Sonic 3 & Knuckles.'
arch=('x86_64' 'aarch64')
url='https://sonic3air.org/'
license=('GPL 3.0')
depends=('opengl-driver' 'sdl2' 'zenity' 'yad')
depends_aarch64=('box64')
provides=(sonic3air)
source=(
	"sonic3air_$pkgver.tar.gz::https://github.com/Eukaryot/sonic3air/releases/download/v24.02.02.0-stable/sonic3air_game.tar.gz"
	"https://gitlab.com/linuxbombay/sonic3air/sonic3air/-/archive/$scriptver/sonic3air-$scriptver.tar.bz2"
	"LICENSE.md"
	)
source_aarch64=("https://gitlab.com/linuxbombay/armlibpatches/sonic3air/$pkgver/-/raw/main/Sonic3Airx64-libs-$pkgver.tar.xz")	

sha256sums=('502c4ca9d5cb52db4a25b860b1003949d9ae0697f37f6368098346e67654bb16'
            '01560233215044ac87bc17f95c73eacad7e4c0a0111e3590f79b19ff364b532e'
            '4bff643c05c2396b7e2987721c2f77cd3921434a0a2511f4a3bf31fc53fd7d76')
sha256sums_aarch64=('77f45b48edd75ee6193542a44781dc0a9d376597f4cb55cee69fe4ae458f8da7')

package() {
        install -dm755 "$pkgdir/usr/share/games/Sonic3Air"
        install -Dm755 "$srcdir/sonic3air-$scriptver/sonic3air.png" "$pkgdir/usr/share/pixmaps/sonic3air.png"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/sonic3air/LICENSE.md"
	install -Dm644 "$srcdir/sonic3air-$scriptver/sonic3air.desktop" "$pkgdir/usr/share/applications/sonic3air.desktop"
	install -Dm755 "$srcdir/sonic3air-$scriptver/sonic3air" "$pkgdir/usr/bin/sonic3air"
	
	chmod -R 775 "$srcdir/sonic3air_game"
	mkdir -p "$pkgdir/usr/share/games/Sonic3Air/data" "$pkgdir/usr/share/games/Sonic3Air/bonus" "$pkgdir/usr/share/games/Sonic3Air/doc"
	cp -r "$srcdir/sonic3air_game/data"/* "$pkgdir/usr/share/games/Sonic3Air/data"
	cp -r "$srcdir/sonic3air_game/bonus"/* "$pkgdir/usr/share/games/Sonic3Air/bonus"
	cp -r "$srcdir/sonic3air_game/doc"/* "$pkgdir/usr/share/games/Sonic3Air/doc"
	cp -r "$srcdir/sonic3air_game/config.json" "$pkgdir/usr/share/games/Sonic3Air"
	cp -r "$srcdir/sonic3air_game/Manual.pdf" "$pkgdir/usr/share/games/Sonic3Air"
	cp -r "$srcdir/sonic3air-$scriptver/sonic3air.png" "$pkgdir/usr/share/games/Sonic3Air"
	cp -r "$srcdir/sonic3air_game/sonic3air_linux" "$pkgdir/usr/share/games/Sonic3Air/sonic3air"
	find "$srcdir/sonic3air_game" -type f -name "*.so" -exec cp {} "$pkgdir/usr/share/games/Sonic3Air" \;
	#x64 libs for Arm64
	if [ "$(uname -m)" = "aarch64" ]; then
           install -dm755 "$pkgdir/usr/lib/x86_64-linux-gnu/Sonic3Air"
           find "$srcdir" -type f -name "*.so.*" -exec cp -r {} "$pkgdir/usr/lib/x86_64-linux-gnu/Sonic3Air" \;
	   ln -sfn "/usr/lib/x86_64-linux-gnu/Sonic3Air/libstdc++.so.6.0.33" "$pkgdir/usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.33"
	   #lib Symlink
	   ln -sfn "/usr/lib/x86_64-linux-gnu/Sonic3Air/libstdc++.so.6" "$pkgdir/usr/lib/x86_64-linux-gnu/libstdc++.so.6"
           ln -sfn "/usr/lib/x86_64-linux-gnu/Sonic3Air/libc.so.6" "$pkgdir/usr/lib/x86_64-linux-gnu/libc.so.6"
           ln -sfn "/usr/lib/x86_64-linux-gnu/Sonic3Air/libgcc_s.so.1" "$pkgdir/usr/lib/x86_64-linux-gnu/libgcc_s.so.1"           
        fi	
}
