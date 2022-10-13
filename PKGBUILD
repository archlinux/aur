# Maintainer: Sarah <schalaalexiazeal@gmail.com>
pkgname=inochi-creator
pkgver=0.7.4.1
pkgrel=1
pkgdesc="Inochi2D Rigging Application"
arch=(x86_64)
url="https://inochi2d.com/"
license=('BSD' 'Apache')
depends=(sdl2 liblphobos harfbuzz)
makedepends=(dub ldc cmake git)
options=(strip !emptydirs)
changelog=
source=(https://github.com/Inochi2D/inochi-creator/archive/refs/tags/v$pkgver.tar.gz
git+https://github.com/Inochi2D/bindbc-imgui.git
git+https://github.com/Inochi2D/facetrack-d.git
git+https://github.com/KitsunebiGames/i18n.git
git+https://github.com/Inochi2D/inochi2d.git#commit=08fe19825b0db01c0a7831711722e5c9660d74ad
inochi-creator_0.7.3_no-gitver.patch
inochi2d_0.7.2_no-gitver.patch
git+https://github.com/grillo-delmal/vpuppet-icons.git)
_inochi2d_ver="0.7.2"
sha256sums=('73ed49b0e79180975c36350b461de113c3f48dcc6a5c51017c1699fd30fb2321'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'b6194827dc2fd710341aa48b2d0785cf5de5e038fe2041991009e3e2615427a4'
            'e95e55d9d1e9e11a3105f8d9571ea5a41a11e9ac51a191c4819cac8509e4db21'
            'SKIP')

prepare() {
	cd "$srcdir/inochi2d"
	patch -Np1 -i ../inochi2d_0.7.2_no-gitver.patch
	echo "module inochi2d.ver;\
	enum IN_VERSION = \"$_inochi2d_ver\";" > source/inochi2d/ver.d

	cd "$srcdir/$pkgname-$pkgver"
	patch -Np1 -i ../inochi-creator_0.7.3_no-gitver.patch
	dub add-local $srcdir/bindbc-imgui/ "0.7.0"
	dub add-local $srcdir/facetrack-d/ "0.6.2"
	dub add-local $srcdir/i18n/ "1.0.1"
	dub add-local $srcdir/inochi2d/ $_inochi2d_ver
	echo "module creator.ver;\
	enum INC_VERSION = \"$pkgver\";" > source/creator/ver.d

	# Unofficial builds required to change bug report URL
	sed -i "s,https://github.com/Inochi2D/inochi-creator/issues/new?assignees=&labels=bug&template=bug-report.yml&title=%5BBUG%5D,https://aur.archlinux.org/packages/inochi-creator,g" source/creator/config.d
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	dub build --build=release
}

package() {
	cd "$srcdir/$pkgname-$pkgver/out"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd ../res
	sed -i "s,logo_256.png,$pkgname.svg,g" $pkgname.desktop
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd "$srcdir/vpuppet-icons"
	install -Dm644 "vpuppet-rigging.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
