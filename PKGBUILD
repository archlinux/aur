# Maintainer: Saiki81 <saikia81 at hotmail dot com>
# adapted from package: pianoteq-stage-trial-bin
# adapted from pkgbuild creator: CrocoDuck <crocoduck dot oducks at gmail dot com> 


pkgname=pianoteq-stage
pkgver=5.6.1
pkgrel=1
pkgdesc="Virtual piano instrument using physical modelling synthesis. Both standalone and plugin versions."
arch=('i686' 'x86_64')
url="https://www.pianoteq.com/pianoteq5"
license=('LGPL')
depends=('alsa-lib' 'freetype2' 'libxext')
makedepends=('gendesk' 'p7zip')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "pianoteq-stage-bin", "pianoteq-standard-trial-bin")
source=('https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
sha256sums=('94ee64cf6688a49d74f0bf70d811e7466abac103feeab17496a89f828afcc6d3')

# Define the target archive filename:
_pianoteqfilename=pianoteq_stage_linux_v${pkgver//./}.7z
# Define its checksum:
_pianoteqsha256sum=35e7d7d132e0e797c333f19dde19c102afd099dc6d6fe0b05793c6cfb310124e

prepare(){
        # the source package must be downloaded manually
        # this can be done by going to the link here:
        # https://www.pianoteq.com/download?file=pianoteq_stage_linux_v551.7z
        # the checksum will still be validated
	if [ ! -f "../$_pianoteqfilename" ]
	then
            echo "File not found!"
            echo -e "For this package a mannual download of the pianoteq software is needed: 'https://www.pianoteq.com/download?file=pianoteq_stage_linux_v561.7z'\nThe archive should be in the same dir as the PKGBUILD!"
            exit;
        fi 
        # move the dependency to ./src/
        mv ../$_pianoteqfilename ./
	# Check integrity:
	echo $_pianoteqsha256sum $_pianoteqfilename |sha256sum -c || { echo 'Checksum failed!'; exit 1; }
	# Extract:
 	7z x $_pianoteqfilename
	# Generate Desktop Entry:
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='pianoteq 5' --exec='pianoteq\ 5' --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package(){
	_pianoteq_type="Pianoteq 5 STAGE"
	# Define architecture specific file directory:
 	 if [[ "$CARCH" == i686 ]]; then
		archdir=i386
 	else
		archdir=amd64
	fi
	# Install program files:
	install -Dm 755 "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type" "$pkgdir/usr/bin/pianoteq 5"
	install -Dm 755 "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type.so" "$pkgdir/usr/lib/vst/pianoteq 5.so"
	cd "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type.lv2"
	for i in *; do
		install -D "$i" "$pkgdir/usr/lib/lv2/Pianoteq 5.lv2/$i"
  	done
  	cd $srcdir
	# Install desktop launcher:
  	install -Dm 644 "$srcdir/pianoteq_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  	install -Dm 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/${pkgname%-*}.desktop"
	# Install the license:
  	install -d "$pkgdir/usr/share/licenses/$pkgname"
	ls -a
	install -m 644 "$_pianoteq_type"/*Licence* "$pkgdir/usr/share/licenses/$pkgname/"
  	# Install the Documentation:
  	install -D "$_pianoteq_type/README_LINUX.txt" "$pkgdir/usr/share/doc/${pkgname%-*}/README_LINUX.txt"
  	cd "$srcdir/$_pianoteq_type/Documentation"
  	for i in *; do
    		install -D "$i" "$pkgdir/usr/share/doc/${pkgname%-*}/$i"
  	done
}
