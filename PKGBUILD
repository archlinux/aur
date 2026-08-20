# Contributor: bender02 at archlinux dot us
# Contributor: serbalgi (AUR)
# Contributor: Daniel Menelkir (dmenelkir at gmail dot com)
# Maintainer: SanskritFritz (gmail)

pkgname=fuse-emulator-sdl
pkgver=1.9.1
pkgrel=1
pkgdesc="ZX Spectrum emulator (SDL GUI)."
arch=('i686' 'x86_64')
url="http://fuse-emulator.sourceforge.net/fuse.php"
license=("GPL")
depends=("libspectrum>=1.6.0" 'sdl')
optdepends=('libgcrypt: the ability to digitally sign RZX files'
	'libpng: the ability to save screenshots'
	'libxml2: the ability to load and save the current configuration and capture BASIC video functions to SVG'
	'zlib: support for compressed RZX files and zipped files'
	'bzip2: support for certain compressed files'
	'audiofile: support for loading from .wav files')
conflicts=('fuse-emulator')
source=("http://downloads.sourceforge.net/sourceforge/fuse-emulator/fuse-$pkgver.tar.gz"
        "https://gitlab.com/menelkir/fuseroms/-/archive/0.2/fuseroms-0.2.tar.gz"
        "$pkgname.desktop")
sha512sums=('dfe804835cd724d903ca34aa368068f16bb0ac0a0738a17de6dd545d0a139953cab15f26612a6129bc0fffbd981a5bb6de3a781e811b6fe1f851525cea1543e6'
            '16f0993e6237252893e4624733f6e609a02a7cd9a726976b6dbf3ef1f08b3bda36c5ebadb07ba5283326dce1f71be10ce1ef6601262aa11e1ddc94e958ab63ac'
            '46b59831fb2ce0da176b7db1a89c17e75ae45c7dfb459287d1f22e4bf4d107d6261ff9e04e1d76b5421f5106a4a64e10e7876069c13fa2a3a0dd4a56f61d5193')

build() {
	cd "fuse-$pkgver"
	./configure --prefix=/usr --without-gtk --with-sdl
	make
}

package() {
	cd "fuse-$pkgver"
	make DESTDIR="$pkgdir" install
	install -D -m 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

	for resolution in 16x16 32x32 48x48 64x64 128x128 256x256
	do
		install -D -m 644 "data/icons/$resolution/net.sourceforge.fuse_emulator.Fuse.png" "$pkgdir/usr/share/icons/hicolor/$resolution/apps/net.sourceforge.fuse_emulator.Fuse.png"
		install -D -m 644 "data/icons/$resolution/application-x-spectrum.png" "$pkgdir/usr/share/icons/hicolor/$resolution/mimetypes/application-x-spectrum.png"
	done

	# Extra ROMs
	install -D -m 644 "$srcdir"/fuseroms-0.2/fuse-extra/* -t "$pkgdir"/usr/share/fuse/

}

