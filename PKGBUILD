# Maintainer: Geeko <sheepsull@gmail.com>

pkgname=betterspades
pkgver=0.1.4
pkgrel=1
pkgdesc="Opensource game client for Ace Of Spades 0.75 protocol"
arch=('i686' 'x86_64')
url='https://github.com/xtreme8000/betterspades/'
license=('GPL3')
depends=('bash' 'hicolor-icon-theme' 'openal' 'glfw' 'enet' 'glew')
makedepends=('glfw' 'libdeflate' 'enet' 'cmake' 'unzip')
source=("https://github.com/xtreme8000/$pkgname/archive/v${pkgver}-beta.tar.gz"
        "http://aos.party/bsresources.zip"
        "$pkgname.desktop"
        "$pkgname"
        "dr_wav.h"
        "http.h"
        "ini.c"
        "ini.h"
        "libdeflate.h"
        "lodepng.cpp"
        "lodepng.h"
        "log.c"
        "log.h"
        "parson.c"
        "parson.h"
        "stb_truetype.h")
sha512sums=('b07f77a37ce0d8ccf8fb5ffef95ce60190d6d2c13f4c995f50a11a7f12c33a218484104fde989c80e7d0d9df6318115aa070cbe622e3dc83f1c2dd142344963e'
            '08723cd955e5fcc7481a426a9e9a53d978c58975d6b01f91f8bbe16b3a8b500b039cc67f0f2b9ca9974b5a0a49231eaea3a10bb779070cdda24032ebc8c65eb7'
            '45488d7196410a1bc9461de82ac28ac5335cb99babae5f8a4465539b196a4cbe9361aa1f8d7521289537aae6fdb2a8c5c2588b20f4fd5fe7c4484f9c9c8e285b'
            '5cac9e619faa2d83a3db76753b9bbea40d3c97de579701357d6d6472feb378bb4dca1ba389b132ae6187b0a15b2bc17d42fba331e0c653682827d09af0e231aa'
            '0785768bcc9e144a5bc0242dcabc495bbdd68209a4a66a15b4d75fab4a52f51f142323b12532aaf1dcc7eb579a2f49b9af6da7aaf742bb11be900c85135a7fe1'
            '3c969be87d409a27d2bcede6fb1986db8ea8dd89e78cd77490664dae5666e24fbce3a95df58d4ef4fc61bdb19edf63cde713addecbd106d2f3583bf9f62c296a'
            '67a6133d15ae2bad9438b6bf6c3f34c69435f7417c4211c82d584ef03172bbc5e6db3c786465b6c1386e7af2fe450a00a5cbfccc84c7cf719cd34d6052338ab6'
            '677772e898f3fbd140eb87296fa6c8ff7803531b465f182f7dfbd1a439546a9fa0e0cb35751c5c4d9cf856e427214f206f546de84110b9483aec9e75d99a382a'
            'e5678a7453d52b3e334052c178957281aa8bde17cbcff4d4ac177bdc50aa3dfb9d365e8e9537d8ee77ebf251d434edf1456a903c0d21f9c7f676ef52e1270b6a'
            'f01772eae519a803bbdc3919fe0efc2b354f58a95ad204ec9169bcec319e09c76d1d9426f4abc031bcf9a67d909162088fd1e0e6d8f61a0b267785345556486e'
            '52b908d5c100e00b8be07e3dd9c173bbd2e528b9fb5076cc2472addcd437b10e956d5c483cc4e2a531ec2f1f563277663befffbd02aa53530058a024cd6f8477'
            'f554243f4f681fdefa5721870b0448e873d61e2a6cd0b33acfd032adfdaca21f1b7071f736f079cf003c32915689793737d619949c2338ad246b26cc1d66ef7b'
            '0aa16593bbb4ba681ed31e2401aa941fd0c2132af3814aac44169e4ff62f37b38020ba2ecd6429b506b38e3ac1b70051d6164175356927441a22ab10f10eac84'
            'e5fa24527141c4bf44f33fb1d235f9a1fac00dd3d65278cfaeff80fd68d4f89acf95249f9ebf57cc0f6424bac5a9a8794d76e2614b8acc05798111711ad9fd5c'
            '79572d31c8309d9f2fef77a6c027328c216c90972b6de420e58fba0663344cdf7f1ff8affd7db654898a9976f573d93f517476203a231dd4832443c2cbc27660'
            'b1a14208296a4ca343c3f1ac4a889f635a97ace658d55aef93ac928722ac3ce7f5ee30a70bc8f0c0989510b4b1a732964fefd25e5dc232672432f53e7d182964')

prepare() {
	cd BetterSpades-${pkgver}-beta
	cp -v $srcdir/dr_wav.h src/
	mv src/dr_wav.h src/dr_wav.c
	mkdir src/lodepng/
	cp -v $srcdir/lodepng.h src/lodepng/
	cp -v $srcdir/lodepng.cpp src/lodepng/lodepng.c 
	cp -v /usr/lib/libdeflate.a libs
	cp -v $srcdir/libdeflate.h src
	cp -v $srcdir/ini.* src/
	cp -v $srcdir/http.h src/
	cp -v $srcdir/stb_truetype.h src/
	cp -v $srcdir/log.* src/
	cp -v $srcdir/parson.* src/
	cd build
	cmake ..
}

build() {
	cd $srcdir/BetterSpades-${pkgver}-beta/build
	make
	cp -v $srcdir/bsresources.zip bin/
	cd bin
	unzip -u bsresources.zip
	rm bsresources.zip
}

package() {
	cd $srcdir/BetterSpades-${pkgver}-beta/build/bin
	install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
	rm icon.png
	install -d "$pkgdir/opt/$pkgname"
	cp -a "$srcdir/BetterSpades-${pkgver}-beta/build/bin/." "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -d "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -d "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "$srcdir/BetterSpades-${pkgver}-beta/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
	install -Dm644 "$srcdir/BetterSpades-${pkgver}-beta/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	# Moving cache and config files to home dir to avoid crashes
	rm -rf "$pkgdir/opt/$pkgname/cache"
	ln -sf "/tmp/$pkgname/cache" "$pkgdir/opt/$pkgname/cache"
	ln -sf "/tmp/$pkgname/config.ini" "$pkgdir/opt/$pkgname/config.ini"
}
