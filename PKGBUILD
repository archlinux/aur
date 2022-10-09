# Maintainer: Sarah <schalaalexiazeal@gmail.com>
pkgname=inochi-creator
pkgver=0.7.3
pkgrel=2
_tag=b6d0ab360729a7014cb764c18e7d32445a62dc87
pkgdesc="Inochi2D Rigging Application"
arch=(x86_64)
url="https://inochi2d.com/"
license=('BSD' 'Apache')
depends=(sdl2 liblphobos harfbuzz)
makedepends=(dub ldc cmake git)
options=(strip !emptydirs)
changelog=
_gitver_ver=1.6.0
source=(git+https://github.com/Inochi2D/inochi-creator.git
https://github.com/Inochi2D/gitver/archive/refs/tags/v$_gitver_ver.tar.gz
git+https://github.com/Inochi2D/bindbc-imgui.git
git+https://github.com/Inochi2D/facetrack-d.git
git+https://github.com/KitsunebiGames/i18n.git
git+https://github.com/Inochi2D/inochi2d.git
git+https://github.com/grillo-delmal/vpuppet-icons.git)
sha256sums=('SKIP'
            'c46b1257350910e5f792e0641bf99c49c1ec89d4f45230b5366cb6a0ad9f37ff'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	dub add-local $srcdir/bindbc-imgui/ "0.7.0"
	dub add-local $srcdir/facetrack-d/ "0.6.2"
	dub add-local $srcdir/gitver-$_gitver_ver
	dub add-local $srcdir/i18n/ "1.0.1"
	dub add-local $srcdir/inochi2d/ "0.7.2"
}

build() {
	cd "$srcdir/$pkgname"
	dub build --build=release
}

package() {
	cd "$srcdir/$pkgname/out"
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd ../res
	sed -i "s,logo_256,$pkgname,g" $pkgname.desktop
	install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	cd "$srcdir/vpuppet-icons"
	install -Dm644 "vpuppet-rigging.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
