# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>
# Contributor: Simon Thorpe <simon@hivetechnology.com.au>

pkgname=pianoteq-standard-trial-bin
pkgver=6.3.0
pkgrel=1
pkgdesc="Virtual piano instrument using physical modelling synthesis. Both standalone and plugin versions."
arch=('i686' 'x86_64')
url="https://www.pianoteq.com/home"
license=('custom')
depends=('alsa-lib' 'freetype2' 'libxext')
makedepends=('gendesk' 'wget' 'p7zip')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "pianoteq-standard-trial-bin")
source=('https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
sha256sums=('94ee64cf6688a49d74f0bf70d811e7466abac103feeab17496a89f828afcc6d3')

# Define the target archive filename:
_downfname=pianoteq_linux_trial_v${pkgver//./}.7z
# Define its checksum:
_downsha256sum=8356256a96617d53fdc7316be8d34106ba3f8807d1a3336757e1db1727439fa3

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
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='Pianoteq 6' --exec='Pianoteq\ 6' --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package(){
	# Define architecture specific file directory:
 	 if [[ "$CARCH" == i686 ]]; then
		archdir=i386
 	else
		archdir=amd64
	fi
	# Install program files:
	install -Dm 755 "$srcdir/Pianoteq 6/$archdir/Pianoteq 6" "$pkgdir/usr/bin/Pianoteq 6"
	install -Dm 755 "$srcdir/Pianoteq 6/$archdir/Pianoteq 6.so" "$pkgdir/usr/lib/vst/Pianoteq 6.so"
	cd "$srcdir/Pianoteq 6/$archdir/Pianoteq 6.lv2"
	for i in *; do
		install -D "$i" "$pkgdir/usr/lib/lv2/Pianoteq 6.lv2/$i"
  	done
  	cd $srcdir
	# Install desktop launcher:
  	install -Dm 644 "$srcdir/pianoteq_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  	install -Dm 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"
	# Install the license:
  	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m 644 Pianoteq\ 6/*Licence* "$pkgdir/usr/share/licenses/$pkgname/"
  	# Install the Documentation:
  	install -D "Pianoteq 6/README_LINUX.txt" "$pkgdir/usr/share/doc/${pkgname%-*}/README_LINUX.txt"
  	cd "$srcdir/Pianoteq 6/Documentation"
  	for i in *; do
    		install -D "$i" "$pkgdir/usr/share/doc/${pkgname%-*}/$i"
  	done
}
