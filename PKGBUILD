# Maintainer: User0 <user0thenyancat@proton.me>
# Co-Maintainer: Speykious <spey.aur@speykious.dev>
pkgname=wavetracker
pkgver="1.1.2"
pkgrel=3
pkgdesc="A free and open source music-making software for Windows with experimental patches to run on Linux."
arch=('x86_64')
url="https://github.com/squiggythings/WaveTracker"
license=('GPL-2.0')
options=('!emptydirs')
depends=(
    "alsa-lib"
    "dotnet-runtime"
)
optdepends=(
	'pipewire-alsa:   audio output support if you use PipeWire'
	'pulseaudio-alsa: audio output support if you use PulseAudio'
)
makedepends=(
    "dotnet-runtime"
    "dotnet-sdk"
    "imagemagick"
)
source=(
    $pkgname-$pkgver.tar.gz::"https://github.com/squiggythings/WaveTracker/archive/refs/tags/v$pkgver.tar.gz"
    "wavetracker.desktop"
    "wavetracker.patch"
)
sha256sums=('f0d766f7aee61b0beb93371c6669fcbdd5115a330ad9e2735a5956b43e55d4aa'
            '80183916a649b243dc795f42e6354f0275e815a3ff5a237608167d6a9b9e7fac'
            '8ebf6557544cd045f36ba56aa5b8c2368633ddcce230e4cde0bc20e34cffa9f6')

prepare() {
	cd "$srcdir/WaveTracker-$pkgver"
	patch --quiet -p1 -i "$srcdir/wavetracker.patch"
	dotnet clean -v:q

	magick "WaveTracker/Icon.ico[0]" -define icon:auto-resize=256 -thumbnail 256x256 icon-256.png
	magick "WaveTracker/Icon.ico[0]" -define icon:auto-resize=128 -thumbnail 128x128 icon-128.png
	magick "WaveTracker/Icon.ico[0]" -define icon:auto-resize=32 -thumbnail 32x32 icon-32.png
	magick "WaveTracker/Icon.ico[0]" -define icon:auto-resize=16 -thumbnail 16x16 icon-16.png
}

build() {
	cd "$srcdir/WaveTracker-$pkgver"
	dotnet build \
	    --configuration Release -v:q \
	    --property WarningLevel=0
}

check() {
	cd "$srcdir/WaveTracker-$pkgver"
	dotnet test -v:q
}

package() {
	cd "$srcdir/WaveTracker-$pkgver"
	mkdir -p "$pkgdir/opt/WaveTracker"
	mkdir -p "$pkgdir/opt/net8.0"
	mkdir -p "$pkgdir/usr/local/bin"
	cp -r "WaveTracker/bin/Release/net8.0/" "$pkgdir/opt/"
	mv "$pkgdir/opt/net8.0" "$pkgdir/opt/WaveTracker"
	echo "
#!/bin/sh
export CURRENT_DIRECTORY="\$PWD"
cd /opt/WaveTracker/net8.0
./WaveTracker
cd "\$CURRENT_DIR"
	" > \
	    "wavetracker"
	install -Dm755 "./wavetracker" "$pkgdir/usr/local/bin/wavetracker"
	install -Dm644 "icon-256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/wavetracker.png"
	install -Dm644 "icon-128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/wavetracker.png"
	install -Dm644 "icon-32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/wavetracker.png"
	install -Dm644 "icon-16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/wavetracker.png"
	install -Dm644 "$srcdir/wavetracker.desktop" "$pkgdir/usr/share/applications/wavetracker.desktop"
}
