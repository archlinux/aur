# Maintainer: éclairevoyant
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Jeffrey Clark (h0tw1r3) <dude at zaplabs dot com>

pkgname=attract
pkgver=2.6.2
pkgrel=1
pkgdesc="A joystick/gamepad-controlled graphical front-end for command line emulators"
arch=('i686' 'x86_64')
url="http://www.attractmode.org/"
license=('GPL3')
depends=('curl' 'ffmpeg' 'libarchive' 'libxinerama' 'openal' 'sfml')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mickelson/$pkgname/archive/v$pkgver.tar.gz"
	"https://github.com/mickelson/$pkgname/releases/download/v1.6.2/ATTRACT.MODE.intro.16-9.v6.1080p.mp4"
	"https://github.com/mickelson/$pkgname/releases/download/v1.6.2/ATTRACT.MODE.intro.4-3.v6.1080p.mp4"
	"$pkgname.desktop"
	'0001-Update-src-media.cpp-to-use-modern-FFmpeg-API.patch'
	'0003-Fix-build-issue-with-recent-ffmpeg.patch'
	'0004-Only-use-const-AVCodec-where-AVFORMAT-version-59.0.1.patch')
b2sums=('08320a66b23d79bda940ddc13768925463161413ff94ac642ed8576b5ec6f9a9d4097f020a833d0892c9ad6c6745bad5ce42e69c225deb27093ec1dd633082cf'
        'ad46b85040a0e886ea793dafe11a02aad8e0ef36a293b55911d6a4dda2279786ec599b6a8e1656f858a30267e7831a5c4a30e2b95868240d59709863540e67f4'
        '8751ceac1b36858ef7d5d4621f10293f44ac92d576b50570357dcced781323b334ee1fb2c758024a62d8fe74e1bdfad589be2ba2fa9a3780cd010069fd440c50'
        '93dc0dfd133c0d713428b38cb8e2099f90097e39dc2a0c06b185ec1f1066fbf2043bb2731fe5d28a80010cb1f5a81a03dc7625d029bb4717e6b01f6fcce79f8b'
        '44d7e405b53c350c15cef2c72cfa8a26cd0187f8313d85dbea896b9d771fadf9f042eb920a25d5173ff803016bd2545d54cf6963248ccef7f3621cb804552bb1'
        'e42cd04feac0f28c22a5f237d76940d94d255e34195847e5a409e8eeca457258520b59fbf85e7181bc69d2c220de13fa0c4873978c39c34160b495042bcbe609'
        'ffb0227fb436805285c7e3d4b7edcaccd2d24934812265984d6684d802ae7746ba6abba62cc137e2ae1a74fbd8aeee4e99960fb0c87f8c35e08f9f3df03a8d2d')

prepare() {
	cd $pkgname-$pkgver
	# backport patches to allow building against recent ffmpeg
	patch -Np1 <../0001-Update-src-media.cpp-to-use-modern-FFmpeg-API.patch
	patch -Np1 <../0003-Fix-build-issue-with-recent-ffmpeg.patch
	patch -Np1 <../0004-Only-use-const-AVCodec-where-AVFORMAT-version-59.0.1.patch
}

build() {
	cd $pkgname-$pkgver
	VERSION="$pkgver" make prefix=/usr
}

package() {
	install -Dm644 attract.desktop -t "$pkgdir/usr/share/applications/"
	install -Dm644 ATTRACT.MODE.intro.16-9.v6.1080p.mp4 "$pkgdir/usr/share/attract/intro/intro.mp4"
	install -Dm644 ATTRACT.MODE.intro.4-3.v6.1080p.mp4 "$pkgdir/usr/share/attract/intro/intro_4x3.mp4"

	cd $pkgname-$pkgver
	make prefix="$pkgdir/usr" install
	install -Dm644 util/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

