pkgname=blacksun-vst
pkgver=2.0.0
pkgrel=3
pkgdesc="An Extremely Versatile Amp (VST Plugin)"
arch=('x86_64')
url="https://audioassault.mx/products/blacksun"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/Blacksun+Installers+v1.zip"
	_80sPack="`xdg-user-dir DOWNLOAD`/80's Hard Rock.zip"
	_EMP="`xdg-user-dir DOWNLOAD`/Extreme Metal Presets.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	ln -srf "${_80sPack}" "$srcdir/`basename "${_80sPack}"`"
	ln -srf "${_EMP}" "$srcdir/`basename "${_EMP}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_80sPack}"`"
	unzip "$srcdir/`basename "${_EMP}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Blacksun"
    cp -rf $srcdir/Blacksun\ Linux/Blacksun/{IRs,Presets} "$pkgdir/opt/Audio Assault/Blacksun"
    cp -rf $srcdir/BStarA412\ FREE\ IR\ PACK/* "$pkgdir/opt/Audio Assault/Blacksun/IRs"
    if [ -d "$srcdir/80's Hard Rock" ]; then
	    cp -rf $srcdir/80\'s\ Hard\ Rock/*.preset "$pkgdir/opt/Audio Assault/Blacksun/Presets"
    fi
    if [ -d "$srcdir/Extreme Metal" ]; then
        cp -rf $srcdir/Extreme\ Metal/*.preset "$pkgdir/opt/Audio Assault/Blacksun/Presets"
    fi

    ## Install VST Plugin
    install -Dm755 "$srcdir/Blacksun Linux/Blacksunvst2.so" "$pkgdir/usr/lib/vst/Blacksunvst2.so"
}
