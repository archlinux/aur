pkgname=sigma-amp-bin
pkgver=20220308
pkgrel=1
pkgdesc="Audio Assault Modern High Gain Amp Simulator Next Generation"
arch=('x86_64')
url="https://audioassault.mx/products/sigma"
license=('EULA')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
conflicts=('sigma-ex-amp-bin')
source=("Sigma EX Amp.desktop")
sha256sums=('81b5cfc2851b158188f60483a18c8f47fa6aa0d7a43d771e16ca6290c2e2ee04')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/SigmaExv105.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	unzip "SigmaExv105.zip"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Sigma EX" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/Sigma EX Linux/Sigma EX"/{IRs,MIDI,Presets} "$pkgdir/opt/Audio Assault/Sigma EX"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Sigma EX Linux/Sigma EX VST2.so" "$pkgdir/usr/lib/vst/Sigma EX.so"

    ## Install VST3 Plugin
    install -Dm755 "$srcdir/Sigma EX Linux/Sigma EX.vst3/Contents/x86_64-linux/Sigma EX.so" "$pkgdir/usr/lib/vst3/Sigma EX.vst3/Contents/x86_64-linux/Sigma EX.so"

    ## Install Standalone Binary
    cp "$srcdir/Sigma EX Linux/Sigma EX Standalone" "$pkgdir/usr/bin/Sigma EX Standalone"
    chmod +x "$pkgdir/usr/bin/Sigma EX Standalone"
    install -Dm644 "$srcdir/Sigma EX Amp.desktop" "$pkgdir/usr/share/applications/Sigma EX Amp.desktop"
}
