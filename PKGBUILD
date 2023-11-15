# Maintainer: Lancelot OWCZARCZAK <lancelot@owczarczak.fr>
# Contributor: Sarah <schalaalexiazeal@gmail.com>

pkgname=inochi-creator
pkgver=0.8.3
pkgrel=2
pkgdesc="Inochi2D Rigging Application"
arch=('x86_64')
url='https://inochi2d.com/'
license=('custom')
provides=()
depends=(dbus freetype2 gcc-libs sdl2 glibc liblphobos)
makedepends=(dub ldc cmake git)
source=(
	"https://github.com/Inochi2D/inochi-creator/archive/refs/tags/v$pkgver.zip"
	git+https://github.com/Inochi2D/i2d-imgui.git
)

sha512sums=("99a127933b14b1a9ac9e90dfb212b726904235019cd9fe411433beba98595d08823d2b8c1eef22916a94676ac459fb9f49bb9f6e7a8d9f4aad6a23171e012c28" "SKIP")

prepare() {
	cd "$srcdir/i2d-imgui"
	git checkout f09d58a
	cd "$srcdir/$pkgname-$pkgver"
	echo "module creator.ver;\
	enum INC_VERSION = \"$pkgver\";" > source/creator/ver.d
	dub add-local $srcdir/i2d-imgui/ "0.8.0"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	dub build --build=release
}

package() {
	cd "$srcdir/$pkgname-$pkgver/out"
	install -m 755 -D inochi-creator "$pkgdir/usr/bin/inochi-creator"
	install -m 644 -D  LICENSE "$pkgdir/usr/share/licenses/inochi-creator/LICENSE"
	install -m 644 -D  MaterialIcons-LICENSE "$pkgdir/usr/share/licenses/inochi-creator/MaterialIcons-LICENSE"
	install -m 644 -D  NotoSansCJK-Regular-LICENSE "$pkgdir/usr/share/licenses/inochi-creator/NotoSansCJK-Regular-LICENSE"
	install -m 644 -D  OpenDyslexic-LICENSE "$pkgdir/usr/share/licenses/inochi-creator/OpenDyslexic-LICENSE"
	cd ../build-aux/linux
	sed -i "s,logo_256,$pkgname.png,g" $pkgname.desktop
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd ../../res
	install -Dm644 "logo_256.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
