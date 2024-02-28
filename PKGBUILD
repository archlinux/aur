# Maintainer: Lancelot OWCZARCZAK <lancelot@owczarczak.fr>
# Contributor: Sarah <schalaalexiazeal@gmail.com>

pkgname=inochi-creator
pkgver=0.8.4
pkgrel=1
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

sha512sums=("9a0b66f3ec89fb8629e85305529d75cc12f395f88c94ec5af7658df02a3066286fb581cedf39a4d3623c5442b71abacc7bbedf3537c8c1d50a73f750f5be8b09" "SKIP")

prepare() {
	cd "$srcdir/i2d-imgui"
	git checkout f09d58a
	cd "$srcdir/$pkgname-$pkgver"
	echo "module creator.ver;\
	enum INC_VERSION = \"$pkgver\";" > source/creator/ver.d
	dub add-local $srcdir/i2d-imgui/ "0.8.0"

	# Unofficial builds required to change bug report URL
	sed -i "s,https://github.com/Inochi2D/inochi-creator/issues/new?assignees=&labels=bug&template=bug-report.yml&title=%5BBUG%5D,https://aur.archlinux.org/packages/inochi-creator,g" source/creator/config.d
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
