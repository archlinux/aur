# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=iptvnator
pkgver=0.15.1
pkgrel=3
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more"
arch=('x86_64')
url='https://github.com/4gray/iptvnator'
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3' 'libxcrypt-compat')
makedepends=('npm')
optdepends=('mpv: a free, open source, and cross-platform media player'
	'vlc: Multi-platform MPEG, VCD/DVD, and DivX player')
provides=('iptvnator')
conflicts=('iptvnator')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6059a3a1691244f360b093ea4055bbcfbe7dbec69d3a9e85d3a160b35debd799')

package() {
	cd "$pkgname-$pkgver"
	# Fix for '.git can't be found' error
	touch .git
	# Install all dependencies
	npm i --cache "$srcdir/npm-cache"
	# Build
	npm run build -- -c production
	npm exec electron-builder -- -l pacman
	# Unpack compressed pacman file
	mkdir -p release/pacman
	bsdtar -xf release/$pkgname-$pkgver.pacman -C release/pacman
	install -d "$pkgdir/opt/IPTVnator" "$pkgdir/usr/share" "$pkgdir/usr/bin"
	# Install application
	cp -a --no-preserve='ownership' release/pacman/opt/IPTVnator "$pkgdir/opt"
	ln -sf "/opt/IPTVnator/$pkgname" "$pkgdir/usr/bin/$pkgname"
	# Install icons
	cp -a --no-preserve='ownership' release/pacman/usr/share/icons "$pkgdir/usr/share"
	# Install desktop file
	install -Dm644 "release/pacman/usr/share/applications/$pkgname.desktop" \
		"$pkgdir/usr/share/applications/$pkgname.desktop"
	# Remove references to $pkgdir
	find "$pkgdir" -type f -name package.json -print0 | xargs -0 sed -i "/_where/d"
}
