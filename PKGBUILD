pkgname=blacksun-amp-bin
pkgver=2.0.0
pkgrel=2
pkgdesc="Audio Assault An Extremely Versatile Amp"
arch=('x86_64')
url="https://audioassault.mx/products/blacksun"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Blacksun Amp.desktop")
sha256sums=('59120cde3f90875b18db7e27761bb3eb95dd4d0e64eecd6729e6706269a8ce89')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/Blacksun+Installers+v1.zip"
	_80sPack="`xdg-user-dir DOWNLOAD`/80's Hard Rock.zip"
	_BasSic="`xdg-user-dir DOWNLOAD`/BasSick Tones.zip"
	_EMP="`xdg-user-dir DOWNLOAD`/Extreme Metal Presets.zip"
	_MMP="`xdg-user-dir DOWNLOAD`/Modern Rock-Metal.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	ln -srf "${_80sPack}" "$srcdir/`basename "${_80sPack}"`"
	ln -srf "${_BasSic}" "$srcdir/`basename "${_BasSic}"`"
	ln -srf "${_EMP}" "$srcdir/`basename "${_EMP}"`"
	ln -srf "${_MMP}" "$srcdir/`basename "${_MMP}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_80sPack}"`"
	unzip "$srcdir/`basename "${_BasSic}"`"
	unzip "$srcdir/`basename "${_EMP}"`"
	unzip "$srcdir/`basename "${_MMP}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Blacksun" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/Blacksun Linux/Blacksun"/{IRs,Presets} "$pkgdir/opt/Audio Assault/Blacksun"
    cp -rf $srcdir/BStarA412\ FREE\ IR\ PACK "$pkgdir/opt/Audio Assault/Blacksun/IRs"
    ## 80's Hardrock Preset Expansion
    if [ -d "$srcdir/80's Hard Rock" ]; then
	    cp -rf $srcdir/80\'s\ Hard\ Rock/*.preset "$pkgdir/opt/Audio Assault/Blacksun/Presets"
    fi
    ## BasSick Tones Preset Expansion
    if [ -d "$srcdir/BasSick Tones" ]; then
    	cp -rf $srcdir/BasSick\ Tones/*.preset "$pkgdir/opt/Audio Assault/Blacksun/Presets"
    fi
    ## Extreme Metal Preset Expansion
    if [ -d "$srcdir/Extreme Metal" ]; then
        cp -rf $srcdir/Extreme\ Metal/*.preset "$pkgdir/opt/Audio Assault/Blacksun/Presets"
    fi
    ## Modern Metal Preset Expansion
    if [ -d "$srcdir/Modern Rock-Metal" ]; then
        cp -rf $srcdir/Modern\ Rock-Metal/*.preset "$pkgdir/opt/Audio Assault/Blacksun/Presets"
    fi

    ## Install VST Plugin
    install -Dm755 "$srcdir/Blacksun Linux/Blacksunvst2.so" "$pkgdir/usr/lib/vst/Blacksunvst2.so"

    ## Install Standalone Binary
    cp "$srcdir/Blacksun Linux/Blacksun Standalone" "$pkgdir/usr/bin/Blacksun Standalone"
    chmod +x "$pkgdir/usr/bin/Blacksun Standalone"
    install -Dm644 "$srcdir/Blacksun Amp.desktop" "$pkgdir/usr/share/applications/Blacksun Amp.desktop"
}
