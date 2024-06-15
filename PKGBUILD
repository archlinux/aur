# Maintainer: su226 <thesu226 at outlook dot com>

pkgname=quatrack
pkgver="0.6.3"
_zenitha_ver="e6a7e0166cc852f2294505054bdeec8c1f5ba7f9"
pkgrel=1
epoch=
pkgdesc="Hit the keyboard/click the screen with the music beat, enjoy the geometric style animation, get higher scores, and challenge your record!"
arch=(any)
url="https://github.com/26F-Studio/Quatrack"
# No LICENSE provided
license=(unknown)
groups=()
depends=(love)
makedepends=(git imagemagick)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("quatrack-$pkgver.tar.gz::https://github.com/26F-Studio/Quatrack/archive/refs/tags/v$pkgver.tar.gz"
        "git+https://github.com/26F-Studio/Zenitha.git#tag=$_zenitha_ver"
        quatrack.sh
        quatrack.desktop)
noextract=()
sha256sums=(117c8c1c8a05083410ef190a36ca990a3e3b82efc7f651597aa9e2e8d73d8be2
            SKIP
            77fdcc4f6989a4390f3da7d1573e39fc6a96e6f3f38210f864c2330870a94fca
            74d3f7cc58e7192ffbc86523e3c3f00542d39af882716461147803015301fa2f)
validpgpkeys=()

prepare() {
	cd "Quatrack-$pkgver"
	rmdir Zenitha
	ln -s ../Zenitha .
}

build() {
	cd "Quatrack-$pkgver"
	# LÖVE only supports 32-bit RGBA icon, this is 64-bit.
	convert -depth 8 .github/build/linux/release/icon.png assets/image/icon.png
	bsdtar --format zip --exclude-vcs -Lcf quatrack.love assets Zenitha conf.lua main.lua version.lua
}

package() {
	install -Dm644 "$srcdir/Quatrack-$pkgver/quatrack.love" "$pkgdir/usr/share/quatrack/quatrack.love"
	install -Dm755 "$srcdir/quatrack.sh" "$pkgdir/usr/bin/quatrack"
	install -Dm644 "$srcdir/quatrack.desktop" "$pkgdir/usr/share/applications/quatrack.desktop"
	# KDE doesn't recognize /usr/share/icons/hicolor/1024x1024, put icon into /usr/share/pixmaps
	install -Dm644 "$srcdir/Quatrack-$pkgver/assets/image/icon.png" "$pkgdir/usr/share/pixmaps/quatrack.png"
}
