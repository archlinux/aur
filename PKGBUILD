# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=opentyrian
pkgver=2.1.20221123
pkgrel=1
pkgdesc='Open Source port of the classic DOS shoot-em-up Tyrian'
url="https://github.com/$pkgname/$pkgname"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('sdl2' 'sdl2_net')
provides=('tyrian')
optdepends=('hicolor-icon-theme: .desktop file icons')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v${pkgver}.tar.gz"
        'http://camanis.net/tyrian/tyrian21.zip')
sha256sums=('e0e8a8b0d61de10a3a65789ace9ea8e8c5d8dc67f3e423d2c852d64da38aeeb9'
            '7790d09a2a3addcd33c66ef063d5900eb81cc9c342f4807eb8356364dd1d9277')

_srcdir="${pkgname}-${pkgver}"

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
