pkgname=klank-preamp-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Audio Assault Bass Preamp"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/klank"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("KLANK Bass Preamp.desktop")
sha256sums=('354d9caf0f5f5f1c2f3d666b17d80b19c5514230fac85db691436f9f937823c3')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/KLANKInstallers.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/KLANK" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    sh "$srcdir/KLANKInstallerLinux.sh" --tar xf
    cp -rf "$srcdir/KLANK"/{IRs,Presets} "$pkgdir/opt/Audio Assault/KLANK/"

    ## Install VST Plugin
    install -Dm755 "$srcdir/KLANK/KLANK.so" "$pkgdir/usr/lib/vst/KLANK.so"

    ## Install Standalone Binary
    cp "$srcdir/KLANK/KLANK Standalone" "$pkgdir/usr/bin/KLANK Standalone"
    chmod +x "$pkgdir/usr/bin/KLANK Standalone"
    install -Dm644 "$srcdir/KLANK Bass Preamp.desktop" "$pkgdir/usr/share/applications/KLANK Bass Preamp.desktop"
}
