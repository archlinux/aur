# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Saiki81 <saikia81 at hotmail dot com>
# adapted from package: pianoteq-stage-trial-bin
# adapted from pkgbuild creator: CrocoDuck <crocoduck dot oducks at gmail dot com> 


pkgname=pianoteq-stage
pkgver=7.5.2
pkgrel=1
pkgdesc="Virtual piano instrument using physical modelling synthesis. Both standalone and plugin versions."
arch=('x86_64')
url="https://www.pianoteq.com/pianoteq"
license=('LGPL')
depends=('alsa-lib' 'freetype2' 'ttf-font' 'libx11')
makedepends=('gendesk' 'p7zip')
optdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}" "pianoteq-stage-bin" "pianoteq-standard-trial-bin")
# the source package must be downloaded manually
# this can be done by going to the link here:
# https://www.pianoteq.com/download?file=pianoteq_stage_linux_v752.7z
source=("local://pianoteq_stage_linux_v${pkgver//./}.7z"
        'https://www.pianoteq.com/images/logo/pianoteq_icon_128.png')
b2sums=('d6efd069da5b6806f0a59c8f67cb26a271ed3a6c83ff36a7b20495d82d229a72855706674f3a1ef85031dfc808d8f48251ebf679e16411ded1db8a72eb81aa26'
        'bbb48b5b2bd5bbe52a39c84f42ea6c12a3633e4713e00d8132654ddf5adc5d7da1b7951c683cb11446ee847a388a775eb48591089a4e8dc69ed6d97cfc80d56d')

prepare(){
	gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name='pianoteq 7' --exec='"pianoteq 7"' --categories 'Audio;Sequencer;Midi;AudioVideoEditing;Music;AudioVideo;'
}

package(){
	_pianoteq_type="Pianoteq 7 STAGE"
	archdir=x86-64bit
	# Install program files:
	install -Dm 755 "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type" "$pkgdir/usr/bin/pianoteq 7"
	install -Dm 755 "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type.so" "$pkgdir/usr/lib/vst/pianoteq 7.so"
	cd "$srcdir/$_pianoteq_type/$archdir/$_pianoteq_type.lv2"
	for i in *; do
		install -D "$i" "$pkgdir/usr/lib/lv2/Pianoteq 7.lv2/$i"
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
