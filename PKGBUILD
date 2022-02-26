pkgname=hellbeast-amp-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Audio Assault Hellish Brutal Amp Sim"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/hellbeast"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Hellbeast Amp.desktop")
sha256sums=('180f6fc07a692afba1b01c03b4fab2c3d186630c1028d9e72b6a7c6a2593cafb')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/Hellbeast+v2+Installs.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/HellbeastV2" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    sh "$srcdir/Hellbeast v2 Installer Linux.sh" --tar xf
    cp -rf "$srcdir/HellbeastV2"/{IRs,Presets} "$pkgdir/opt/Audio Assault/HellbeastV2/"

    ## Install VST Plugin
    install -Dm755 "$srcdir/HellbeastV2/Hellbeast v2.so" "$pkgdir/usr/lib/vst/Hellbeast v2.so"

    ## Install Standalone Binary
    cp "$srcdir/HellbeastV2/Hellbeast v2 Standalone" "$pkgdir/usr/bin/Hellbeast v2 Standalone"
    chmod +x "$pkgdir/usr/bin/Hellbeast v2 Standalone"
    install -Dm644 "$srcdir/Hellbeast Amp.desktop" "$pkgdir/usr/share/applications/Hellbeast Amp.desktop"
}
