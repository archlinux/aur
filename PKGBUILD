# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com> 
# Software Vendor: Harrison Consoles <mixbus@harrisonconsoles.com>

## ATTENTION!! You will need to download the trial and/or obtain a license from Harrison Consoles. Then, drop all appropriate files in the root with the PKGBUILD directory. Also, uncomment the lines that reference the license file if you want an easy install process.

pkgname=mixbus
pkgver=6.0.697
pkgrel=1
pkgdesc="Harrison Mixbus - Digital Audio Workstation"
arch=('x86_64')
url="http://harrisonconsoles.com/site/$pkgname.html"
license=('EULA, GPLv2')
depends=('glibc' 'xorg-server')
provides=("$pkgname")

prepare() {
## Setup mixbus for installation
_archive=Mixbus-$pkgver-Linux-64bit-gcc5.tar
if [ -f ../${_archive} ]; then
	ln -srf ../${_archive} $srcdir/${_archive}
	msg2 "Unpacking Installer..."
	tar -xf ${_archive}
	./Mixbus-$pkgver-$(uname -m)-gcc5.run --tar xf
	tar -xf $srcdir/Mixbus_$(uname -m)-$pkgver.tar
else
	echo "Please download a copy from https://harrisonconsoles.com/site/$pkgname.html. Then put the ${_archive} in the root of this PKGBUILD directory."
fi
}

package() {
## Create package directories
msg2 "Creating Directories..."
mkdir -p $pkgdir/opt/$pkgname
mkdir -p $pkgdir/usr/share/applications

## Copy installation directory to package directory
msg2 "Getting Ready To Package..."
cp -r $srcdir/Mixbus_$(uname -m)-$pkgver/* $pkgdir/opt/$pkgname

## Installing License Files
msg2 "Installing Mixbus Licenses..."
for plugin in essentials ${pkgname}6 xt_bc3 xt_ds xt_eg xt_eq xt_lc xt_mc xt_me xt_sc xt_sp xt_tg; do
	if [ -f ../license_key_harrison_$plugin.txt ]; then
		install -Dm644 ../license_key_harrison_$plugin.txt $pkgdir/usr/local/share/license_key_harrison_$plugin.txt
	fi
done

## Create a .desktop file
msg2 "Creating A Desktop Entry..."
echo -e "[Desktop Entry]\nEncoding=UTF-8\nVersion=1.0\nType=Application\nTerminal=false\nExec=/opt/$pkgname/bin/${pkgname}6\nName=Mixbus $pkgver\nIcon=/opt/$pkgname/share/resources/Mixbus-icon_256px.png\nComment=Digital Audio Workstation\nCategories=AudioVideo;AudioEditing;Audio;Recorder;" > $pkgdir/usr/share/applications/$pkgname.desktop

# Mark as excuteable
chmod 644 $pkgdir/usr/share/applications/$pkgname.desktop

# Remove uninstall script
rm $pkgdir/opt/$pkgname/bin/Mixbus-$pkgver.uninstall.sh

# Remove Plugins Provided By Archlinux
# rm -r $pkgdir/opt/$pkgname/lib/LV2/{avldrums,b_synth,b_whirl,dpl,fil4,gmsynth,meters,midifilter,reasonablesynth,stereoroute,tuna}.lv2

## Package has built successfully message
msg2 "Package Built Successfully!!"
}
