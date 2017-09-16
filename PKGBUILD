# Maintainer: Alexander Mcmillan <linuxguy93@gmail.com> 
# Software Vendor: Harrison Consoles <mixbus@harrisonconsoles.com>

## ATTENTION!! You will need to download the trial and/or obtain a license from Harrison Consoles. Then, drop all appropriate files in the root with the PKGBUILD. Also, uncomment the lines that reference the license file if you want an easy install process.

pkgname=mixbus4
pkgver=4.2.74
pkgrel=1
pkgdesc="Harrison Mixbus - Digital Audio Workstation"
arch=('i686' 'x86_64')
url="http://harrisonconsoles.com/site/mixbus.html"
license=('EULA, GPLv2')
depends=('glibc' 'xorg-server')
provides=('mixbus4')
conflicts=('mixbus4')
source=("Mixbus-$pkgver-$(uname -m)-gcc5.tar"
	"mixbus4.png"
	#"license_key_harrison_mixbus4.txt"
	)
sha256sums=('SKIP'
	    'SKIP'
	    #'SKIP'
	    )

build() {
## Change to source directory
cd $srcdir

## Setup mixbus for installation
# Unpack intallation files
echo "Preparing Installation..."

echo "Unpacking Installer..."
tar -xf Mixbus-$pkgver-$(uname -m)-gcc5.tar
./Mixbus-$pkgver-$(uname -m)-gcc5.run --tar xf 
find . ! -name "Mixbus_$(uname -m)-$pkgver.tar" -type f -exec rm -f {} +
tar -xf Mixbus_$(uname -m)-$pkgver.tar

## Check for the license file
if [ ! -L license_key_harrison_mixbus4.txt ];
	then echo "PLEASE OBTAIN A LICENSE FROM $url!!"
else
	echo "Installing License..."
	cp license_key_harrison_mixbus4.txt Mixbus_$(uname -m)-$pkgver
fi
}

package() {
## Change into package directory
cd $pkgdir

## Create package directories
echo "Creating Directories..."
mkdir -p opt/$pkgname
mkdir -p usr/local/bin
mkdir -p usr/local/lib
mkdir -p usr/share/applications

## Copy installation directory to package directory
echo "Getting Ready To Package..."
cp -r $srcdir/Mixbus_$(uname -m)-$pkgver/* opt/$pkgname
cp $srcdir/mixbus4.png opt/$pkgname/share

## Create links to excuteables
ln -sr ./opt/$pkgname/bin/mixbus4 ./usr/local/bin/mixbus4
ln -sr ./opt/$pkgname/lib/LV2 ./usr/local/lib/lv2
if [ ! -f ./opt/$pkgname/license_key_harrison_mixbus4.txt ];
	then echo "PLEASE OBTAIN A LICENSE FROM $url"
else
	mkdir -p home/$USER
	ln -sr ./opt/$pkgname/license_key_harrison_mixbus4.txt ./$HOME/license_key_harrison_mixbus4.txt
fi

## Create a .desktop file
echo "Creating A Desktop Entry..."
echo -e "[Desktop Entry]\nEncoding=UTF-8\nVersion=1.0\nType=Application\nTerminal=false\nExec=/opt/$pkgname/bin/mixbus4\nName=Mixbus 4\nIcon=/opt/$pkgname/share/mixbus4.png\nComment=Digital Audio Workstation\nCategories=AudioVideo;AudioEditing;Audio;Recorder;" > usr/share/applications/mixbus4.desktop

# Mark as excuteable
chmod 755 /usr/share/applications/mixbus4.desktop

## Remove package and source directories
echo "Cleaning Up Installation..." 
rm -r $srcdir

## Package has built successfully message
echo "Package Built Successfully!!"
}
