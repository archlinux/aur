# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=opentyrian
pkgver=2.1.20220309
pkgrel=1
pkgdesc='Open Source port of the classic DOS shoot-em-up Tyrian'
url="https://github.com/$pkgname/$pkgname"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('sdl2' 'sdl2_net')
provides=('tyrian')
optdepends=('hicolor-icon-theme: .desktop file icons')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v${pkgver}.tar.gz"
        'http://camanis.net/tyrian/tyrian21.zip')
sha256sums=('9d28a21f982a88ff26f433ab9cd48f4e394322658333cf71e219321f166826b7'
            '7790d09a2a3addcd33c66ef063d5900eb81cc9c342f4807eb8356364dd1d9277')

_srcdir="${pkgname}-${pkgver}"

prepare() {
	cd "$_srcdir"
	sed -i 's/CREDITS//' 'Makefile'
}

build() {
	make prefix=/usr all -C "$_srcdir"
}

package() {
	cd "$_srcdir"
	make DESTDIR="$pkgdir" prefix=/usr install

	install -Dm644 "linux/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	for _x in 22 24 32 48 128; do
		install -Dm644 "linux/icons/tyrian-$_x.png" \
			"$pkgdir/usr/share/icons/hicolor/${_x}x${_x}/apps/$pkgname.png"
	done

	cd "$srcdir/tyrian21"
	install -Dt "$pkgdir/usr/share/games/tyrian" -m644 *.dat *.lvl *.shp *.snd \
		demo.* music.mus tyrend.anm tyrian.{cdt,hdt,pic} tshp2.pcx
}
