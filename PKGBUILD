pkgname=air-impulse-loader-bin
pkgver=20220826
pkgrel=1
pkgdesc="Audio Assault AIR Impulse Response Loader Rack"
arch=('x86_64')
url="https://audio-assault.com/air.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("aIR Impulse Rack.desktop")
sha256sums=('fdb5066a6cf4d394a278d46d0c693db48c79d0e6a3427eb2b8af43a2d326bebb')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/aIRImpulseLinux.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/aIR" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/aIR"/{"Default IRs",IRlinks,Presets} "$pkgdir/opt/Audio Assault/aIR"

    ## Install VST Plugin
    install -Dm755 "$srcdir/aIR Impulse Rack VST2.so" "$pkgdir/usr/lib/vst/aIR Impulse Rack.so"

    ## Install VST3 Plugin
    install -Dm755 "$srcdir/aIR Impulse Rack.vst3/Contents/x86_64-linux/aIR Impulse Rack.so" "$pkgdir/usr/lib/vst3/aIR Impulse Rack.vst3/Contents/x86_64-linux/aIR Impulse Rack.so"

    ## Install Standalone Binary
    cp "$srcdir/aIR Impulse Rack Standalone" "$pkgdir/usr/bin/aIR Impulse Rack Standalone"
    chmod +x "$pkgdir/usr/bin/aIR Impulse Rack Standalone"
    install -Dm644 "$srcdir/aIR Impulse Rack.desktop" "$pkgdir/usr/share/applications/aIR Impulse Rack.desktop"
}
