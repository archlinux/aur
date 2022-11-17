pkgname=rvxx-amp-bin
pkgver=20221117
pkgrel=1
pkgdesc="Audio Assault RVXX Aggressive Guitar Amplifier Next Generation"
arch=('x86_64')
url="https://audio-assault.com/rvxx.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
conflicts=('rvxx-ex-amp-bin')
source=("RVXX EX Amp.desktop")
sha256sums=('9cb4ea4e896f31d72324134cbabe47899020b92164ade82f18302bb78eb391cf')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/RVXX_EX_102.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/RVXX EX" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/RVXX EX Linux/RVXX EX"/{IRs,MIDI,Presets} "$pkgdir/opt/Audio Assault/RVXX EX"

    ## Install VST Plugin
    install -Dm755 "$srcdir/RVXX EX Linux/RVXX EX VST2.so" "$pkgdir/usr/lib/vst/RVXX EX.so"

    ## Install VST3 Plugin
    install -Dm755 "$srcdir/RVXX EX Linux/RVXX EX.vst3/Contents/x86_64-linux/RVXX EX.so" "$pkgdir/usr/lib/vst3/RVXX EX.vst3/Contents/x86_64-linux/RVXX EX.so"

    ## Install Standalone Binary
    cp "$srcdir/RVXX EX Linux/RVXX EX Standalone" "$pkgdir/usr/bin/RVXX EX Standalone"
    chmod +x "$pkgdir/usr/bin/RVXX EX Standalone"
    install -Dm644 "$srcdir/RVXX EX Amp.desktop" "$pkgdir/usr/share/applications/RVXX EX Amp.desktop"
}
