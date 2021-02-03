# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgname=opentyrian
pkgver=2.1.20130907.r119.g650e1f7
pkgrel=2
pkgdesc="Open Source port of the classic DOS shoot-em-up Tyrian"
url="https://github.com/opentyrian/opentyrian"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('sdl2' 'sdl2_net')
makedepends=('git')
provides=('tyrian')
optdepends=('hicolor-icon-theme: .desktop file icons')
source=("git+https://github.com/opentyrian/opentyrian#commit=650e1f72fd18d2242d10d706afa7f77f80151aea"
        "http://camanis.net/tyrian/tyrian21.zip")
sha256sums=('SKIP'
            '7790d09a2a3addcd33c66ef063d5900eb81cc9c342f4807eb8356364dd1d9277')

pkgver() {
	cd "$pkgname"
	git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	make prefix=/usr all -C $pkgname
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" prefix=/usr install

	install -Dm644 "linux/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	for _x in 22 24 32 48 128; do
		install -Dm644 "linux/icons/tyrian-$_x.png" \
			"$pkgdir/usr/share/icons/hicolor/${_x}x${_x}/apps/$pkgname.png"
	done

	cd ../tyrian21
	install -Dt "$pkgdir/usr/share/games/tyrian" -m644 *.dat *.lvl *.shp *.snd \
		demo.* music.mus tyrend.anm tyrian.{cdt,hdt,pic} tshp2.pcx
}
