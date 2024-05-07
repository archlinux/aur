# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=wowup-cf
_appname=WowUp.CF
pkgver=2.12.0
pkgrel=1
pkgdesc='WowUp client with CurseForge support'
arch=(x86_64)
url='https://github.com/WowUp/WowUp.CF'
license=(GPL3)
depends=(
	c-ares
	ffmpeg
	gtk3
	http-parser
	libevent
	libvpx
	libxslt
	libxss
	minizip
	nss
	re2
	snappy
	libnotify
	libappindicator-gtk3
	libxcrypt-compat
)
makedepends=(
	nodejs-lts-iron
	npm
)
provides=(wowup-cf)
conflicts=(wowup-cf)
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('0ab12327cc434fccbd2c6ff30731967c54a132be4d00cdcd2da73cc3a1fbd8fe')

build() {
	cd $_appname-$pkgver/wowup-electron
	# Install all dependencies
	npm i --cache ../npm-cache
	# Build
	npm run build -- -c production
	npm exec electron-builder -- -l pacman
	# Unpack compressed pacman file
	mkdir -p release/pacman
	bsdtar -xf release/$pkgname-$pkgver.pacman -C release/pacman
}

package() {
	install -d "$pkgdir"/opt/WowUp-CF "$pkgdir"/usr/share "$pkgdir"/usr/bin
	# Install application
	cp -a --no-preserve=ownership $_appname-$pkgver/wowup-electron/release/pacman/opt/WowUp-CF "$pkgdir"/opt
	ln -sf /opt/WowUp-CF/$pkgname "$pkgdir"/usr/bin/$pkgname
	# Install icons
	cp -a --no-preserve=ownership $_appname-$pkgver/wowup-electron/release/pacman/usr/share/icons "$pkgdir"/usr/share
	# Install desktop file
	install -Dm644 $_appname-$pkgver/wowup-electron/release/pacman/usr/share/applications/$pkgname.desktop \
		"$pkgdir"/usr/share/applications/$pkgname.desktop
	# Install license
	install -Dm644 $_appname-$pkgver/wowup-electron/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
