# Maintainer: CrocoDuck <crocoduck.oducks@gmail.com>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>

pkgname=pianoteq-standard-trial-bin
pkgver=5.4.2
pkgrel=1
pkgdesc="Virtual piano instrument using physical modelling synthesis. Both standalone and plugin versions."
arch=('i686' 'x86_64')
url="https://www.pianoteq.com/pianoteq5"
license=('custom')
depends=('alsa-lib' 'freetype2' 'libxext')
makedepends=('gendesk' 'wget' 'p7zip')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=('https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
sha256sums=('94ee64cf6688a49d74f0bf70d811e7466abac103feeab17496a89f828afcc6d3')

# Define the target archive filename:
_downfname=pianoteq_linux_trial_v${pkgver//./}.7z
# Define its checksum:
_downsha256sum=5fe0cc6c56544630dc5c4b1160915feab1ad0bca597731d3546d413b610e6dfe

prepare(){
	# The archive download link needs to be retrieved. Retrieve download page source:
	wget -q -O downpage.html https://www.pianoteq.com/try?file="$_downfname"
	# Now, isolate the final string of the download link from the source:
	downstr=$(cat downpage.html | grep "<form action" | grep style | grep -o -P '(?<=action=").*(?=" method)')
	# All ingredients are ready! Finalize the download url and download:
	downurl="https://www.pianoteq.com/"$downstr""
	wget --content-disposition "$downurl"
	# Check integrity:
	echo $_downsha256sum $_downfname|sha256sum -c || { echo 'Checksum failed!'; exit 1; }
	# Extract:
 	7z x $_downfname
	# Generate Desktop Entry:
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='Pianoteq 5' --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package(){
	# Target Directories:
 	mkdir -p $pkgdir/usr/bin
 	mkdir -p $pkgdir/usr/lib/vst
	mkdir -p $pkgdir/usr/lib/lv2
	# Define architecture specific file directory:
  	if [[ "$CARCH" == i686 ]]; then
		archdir=i386
 	else
		archdir=amd64
	fi
	# Install program files:
    	install -Dm755 "$srcdir/Pianoteq 5/$archdir/Pianoteq 5" "$pkgdir/usr/bin/$pkgname"
    	install -Dm755 "$srcdir/Pianoteq 5/$archdir/Pianoteq 5.so" "$pkgdir/usr/lib/vst/$pkgname.so"
	cp -ar "$srcdir/Pianoteq 5/$archdir/Pianoteq 5.lv2" "$pkgdir/usr/lib/lv2/$pkgname.lv2"
	# Install desktop launcher:
  	install -Dm644 "$srcdir/pianoteq_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	# Install the license:
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 Pianoteq\ 5/*Licence* "$pkgdir/usr/share/licenses/$pkgname/"
}
