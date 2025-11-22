# Maintainer: Totchi Lagawi <chatnoir420 at gmx dot com>

pkgname=seed
pkgver=0.4.6
pkgrel=1
pkgdesc=" A cross-platform launcher for the Flax game engine"
arch=('x86_64')
url="https://github.com/MineBill/Seed"
license=('BSD-3-Clause')
depends=(libgit2)
optdepends=('dotnet-sdk: Dotnet 8 SDK'
            'vulkan-driver: Vulkan graphics driver'
            'portaudio: PortAudio audio driver'
            'libpulse: PulseAudio audio driver'
            'jack: JACK audio driver')
makedepends=(sed)
source=(https://github.com/MineBill/Seed/releases/download/v$pkgver/Seed.AppImage)
sha256sums=('76bab15bf86f1091367d2652c6641c38273e103fd7bb3abab682c7cf4bdc320c')

prepare() {
	chmod u+x Seed.AppImage
	./Seed.AppImage --appimage-extract
}

package() {
	cd "$srcdir/squashfs-root"
	install -Dm755 usr/bin/Launcher "$pkgdir/opt/seed/Launcher"
	install -Dm755 usr/bin/libHarfBuzzSharp.so "$pkgdir/opt/seed/libHarfBuzzSharp.so"
	install -Dm755 usr/bin/libSkiaSharp.so "$pkgdir/opt/seed/libSkiaSharp.so"
	sed -i 's/Exec=.*/Exec=\/opt\/seed\/Launcher/g' Seed.desktop
	sed -i 's/Icon=.*/Icon=seed/g' Seed.desktop
	install -Dm644 Seed.desktop "$pkgdir/usr/share/applications/seed.desktop"
	install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
