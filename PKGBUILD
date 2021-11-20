# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com> 
# Software Vendor: Harrison Consoles <mixbus@harrisonconsoles.com>

## ATTENTION!! You will need to download the trial and/or obtain a license from Harrison Consoles. Then, drop all appropriate files in your users home directory.

pkgname=mixbus7
pkgver=7.2.0
pkgrel=1
pkgdesc="Harrison Mixbus - Digital Audio Workstation"
arch=('x86_64')
url="http://harrisonconsoles.com/site/${pkgname/7/}.html"
license=('EULA, GPLv2')
depends=('libcurl-gnutls' 'glibc' 'xorg-server')
conflicts=("mixbus")
provides=("mixbus")
replaces=("mixbus")

prepare() {
## Setup mixbus for installation
_archive="`xdg-user-dir DOWNLOAD`/Mixbus-$pkgver-Linux-64bit-gcc5.tar"
msg2 "Unpacking Installer..."
tar -xf ${_archive}
./Mixbus-$pkgver-$(uname -m)-gcc5.run --tar xf
tar -xf $srcdir/Mixbus_$(uname -m)-$pkgver.tar
}

package() {
## Create package directories
msg2 "Creating Directories..."
mkdir -p $pkgdir/opt/$pkgname
mkdir -p $pkgdir/usr/share/applications

## Copy installation directory to package directory
msg2 "Getting Ready To Package..."
cp -r $srcdir/Mixbus_$(uname -m)-$pkgver/* $pkgdir/opt/$pkgname

## Create a .desktop file
msg2 "Creating A Desktop Entry..."
echo "[Desktop Entry]" > $pkgdir/usr/share/applications/$pkgname.desktop
echo "Encoding=UTF-8" >> $pkgdir/usr/share/applications/$pkgname.desktop
echo "Version=1.0" >> $pkgdir/usr/share/applications/$pkgname.desktop
echo "Type=Application" >> $pkgdir/usr/share/applications/$pkgname.desktop
echo "Terminal=false" >> $pkgdir/usr/share/applications/$pkgname.desktop
echo "Exec=/opt/$pkgname/bin/${pkgname}" >> $pkgdir/usr/share/applications/$pkgname.desktop
echo "Name=Mixbus v7" >> $pkgdir/usr/share/applications/$pkgname.desktop
echo "Icon=/opt/$pkgname/share/resources/Mixbus-icon_256px.png" >> $pkgdir/usr/share/applications/$pkgname.desktop
echo "Comment=Digital Audio Workstation" >> $pkgdir/usr/share/applications/$pkgname.desktop
echo "Categories=AudioVideo;AudioEditing;Audio;Recorder;" >> $pkgdir/usr/share/applications/$pkgname.desktop

# Mark as excuteable
chmod 644 $pkgdir/usr/share/applications/$pkgname.desktop

# Remove uninstall script
rm $pkgdir/opt/$pkgname/bin/Mixbus-$pkgver.uninstall.sh

# Remove Plugins Provided By Archlinux
rm -r $pkgdir/opt/$pkgname/lib/LV2/

## Package has built successfully message
msg2 "Package Built Successfully!!"
}
