# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=rvxx-amp
pkgver=$(date +%Y%m%d)
pkgrel=1
pkgdesc="RVXX Aggressive Guitar Amplifier (VST Plugin)."
arch=('x86_64')
url="https://audio-assault.com/rvxx.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("RVXX.desktop")
md5sums=('f75327e2917268d49b3d9be2414c7f96')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/RVXX+v2+Installers+Feb_26_2021.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
}

package() {
    ## Install Standalone Application
    install -Dm755 "$srcdir/RVXX v2 Linux /InstallerData/RVXX/RVXX v2 Standalone" "$pkgdir/usr/bin/RVXX v2 Standalone"
    
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault"
    mkdir -p "$pkgdir/opt/Audio Assault/RVXX/IRs"
    cp -rf $srcdir/RVXX\ v2\ Linux\ /InstallerData/RVXX/IRs/* "$pkgdir/opt/Audio Assault/RVXX/IRs"
    mkdir -p "$pkgdir/opt/Audio Assault/RVXX/Presets"
    cp -rf $srcdir/RVXX\ v2\ Linux\ /InstallerData/RVXX/Presets/* "$pkgdir/opt/Audio Assault/RVXX/Presets"
    chmod -R 777 $pkgdir/opt/Audio\ Assault/RVXX

    ## Install Desktop Launcher
    install -Dm644 "$srcdir/RVXX.desktop" "$pkgdir/usr/share/applications/RVXX.desktop"

    ## Install VST Plugin
    install -Dm755 "$srcdir/RVXX v2 Linux /InstallerData/RVXX/RVXX v2.so" "$pkgdir/usr/lib/vst/RVXX v2.so"
}
