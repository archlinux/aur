# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=iptvnator
pkgver=0.15.0
pkgrel=1
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more"
arch=('x86_64')
url="https://github.com/4gray/iptvnator"
license=('MIT')
depends=(
	'c-ares'
	'ffmpeg'
	'gtk3'
	'http-parser'
	'libevent'
	'libvpx'
	'libxslt'
	'libxss'
	'minizip'
	'nss'
	're2'
	'snappy'
	'libnotify'
	'libappindicator-gtk3'
)
makedepends=('npm')
optdepends=(
	'mpv: a free, open source, and cross-platform media player'
	'vlc: Multi-platform MPEG, VCD/DVD, and DivX player'
)
provides=('iptvnator')
conflicts=('iptvnator')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a4e44d63951dba8594907e6d94629901181d62176b3373f6c957b2e6e0d2631b')

prepare() {
	cd $pkgname-$pkgver
	# Insert 'electron:build:pacman' build option
	sed '40a\        \"electron:build:pacman\": \"npm run build:prod && electron-builder build -l pacman\",' -i package.json
	# Install all dependencies
	npm i --cache ../npm-cache
}

build() {
	cd $pkgname-$pkgver
	npm run electron:build:pacman
	# Unpack compressed pacman file
	mkdir -p release/pacman
	bsdtar -xf release/$pkgname-$pkgver.pacman -C release/pacman
}

package() {
	mkdir -p "$pkgdir"/opt/IPTVnator
	mkdir -p "$pkgdir"/usr/share
	mkdir -p "$pkgdir"/usr/bin
	# Install application
	cp -av --no-preserve=ownership $pkgname-$pkgver/release/pacman/opt/IPTVnator/* "$pkgdir"/opt/IPTVnator
	ln -sf /opt/IPTVnator/$pkgname "$pkgdir"/usr/bin/$pkgname
	# Install icons
	cp -av --no-preserve=ownership $pkgname-$pkgver/release/pacman/usr/share/icons "$pkgdir"/usr/share
	# Install desktop file
	install -vDm644 $pkgname-$pkgver/release/pacman/usr/share/applications/$pkgname.desktop \
		"$pkgdir"/usr/share/applications/$pkgname.desktop
	# Install license
	install -vDm644 $pkgname-$pkgver/LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
