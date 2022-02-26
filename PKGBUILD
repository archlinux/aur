pkgname=rvxx-amp-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Audio Assault RVXX Aggressive Guitar Amplifier"
arch=('x86_64')
url="https://audio-assault.com/rvxx.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("RVXX Amp.desktop")
sha256sums=('858a49f32dacebe3bdbdbae578b9398e97470b0311fdb00b91314da88fbd552c')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/RVXX+v2+Installers+Feb_26_2021.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/RVXX/"{IRs,Presets} "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf $srcdir/RVXX\ v2\ Linux\ /InstallerData/RVXX/IRs/*.wav "$pkgdir/opt/Audio Assault/RVXX/IRs"
    cp -rf $srcdir/RVXX\ v2\ Linux\ /InstallerData/RVXX/Presets/*.preset "$pkgdir/opt/Audio Assault/RVXX/Presets"

    ## Install VST Plugin
    install -Dm755 "$srcdir/RVXX v2 Linux /InstallerData/RVXX/RVXX v2.so" "$pkgdir/usr/lib/vst/RVXX v2.so"

    ## Install Standalone Binary
    cp "$srcdir/RVXX v2 Linux /InstallerData/RVXX/RVXX v2 Standalone" "$pkgdir/usr/bin/RVXX v2 Standalone"
    chmod +x "$pkgdir/usr/bin/RVXX v2 Standalone"
    install -Dm644 "$srcdir/RVXX Amp.desktop" "$pkgdir/usr/share/applications/RVXX Amp.desktop"
}
