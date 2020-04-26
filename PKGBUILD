# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com> 
# Software Vendor: Harrison Consoles <mixbus@harrisonconsoles.com>

## ATTENTION!! You will need to download the trial and/or obtain a license from Harrison Consoles. Then, drop all appropriate files in the root with the PKGBUILD. Also, uncomment the lines that reference the license file if you want an easy install process.

pkgname=mixbus32c6
appname=${pkgname/6/}
pkgver=6.0.702
pkgrel=1
pkgdesc="Harrison Mixbus - Digital Audio Workstation (32C Version)"
arch=('x86_64')
url="http://harrisonconsoles.com/site/${appname}.html"
license=('EULA, GPLv2')
depends=('glibc' 'xorg-server')
conflicts=('mixbus32c')

prepare() {
## Setup mixbus for installation
_archive=`xdg-user-dir DOWNLOAD`/Mixbus32C-${pkgver}-Linux-64bit-gcc5.tar
if [ -f ${_archive} ]; then
	ln -srf ${_archive} "$srcdir/`basename ${_archive}`"
	msg2 "Unpacking Installer..."
	tar -xf ${_archive}
	./Mixbus32C-$pkgver-$(uname -m)-gcc5.run --tar xf
	tar -xf $srcdir/Mixbus32C_$(uname -m)-$pkgver.tar
else
	msg2 "Please download a copy from https://harrisonconsoles.com/site/${appname}.html. Then put the `xdg-user-dir DOWNLOAD` in the `xdg-user-dir DOWNLOAD` directory."
	exit 1
fi
}

package() {
## Create package directories
msg2 "Creating Directories..."
mkdir -p $pkgdir/opt/${appname}
mkdir -p $pkgdir/usr/share/applications

## Copy installation directory to package directory
msg2 "Getting Ready To Package..."
cp -r $srcdir/Mixbus32C_$(uname -m)-$pkgver/* $pkgdir/opt/${appname}

## Installing License Files
msg2 "Install Mixbus DAW and plugin licenses to ${HOME}..."

## Create a .desktop file
msg2 "Creating A Desktop Entry..."
echo -e "[Desktop Entry]\nEncoding=UTF-8\nVersion=1.0\nType=Application\nTerminal=false\nExec=/opt/${appname}/bin/${appname}6\nName=Mixbus32C $pkgver\nIcon=/opt/${appname}/share/resources/Mixbus32C-icon_256px.png\nComment=Digital Audio Workstation\nCategories=AudioVideo;AudioEditing;Audio;Recorder;" > $pkgdir/usr/share/applications/${appname}.desktop

# Mark as excuteable
chmod 644 $pkgdir/usr/share/applications/${appname}.desktop

# Remove uninstall script
rm $pkgdir/opt/${appname}/bin/Mixbus32C-$pkgver.uninstall.sh

# Remove Plugins Provided By Archlinux
# rm -r $pkgdir/opt/${appname}/lib/LV2/{avldrums,b_synth,b_whirl,dpl,fil4,gmsynth,meters,midifilter,reasonablesynth,stereoroute,tuna}.lv2

## Remove package and source directories
## Package has built successfully message
msg2 "Package Built Successfully!!"
}
