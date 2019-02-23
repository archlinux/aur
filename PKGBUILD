# Maintainer: robertfoster

pkgname=xash3d-git
pkgver=r354.faee030
pkgrel=1
pkgdesc="A custom Gold Source engine rewritten from scratch"
arch=('x86_64')
url="http://xash.su/"
license=('GPL3')
depends=('lib32-freetype2' 'lib32-fontconfig' 'lib32-sdl2' 'lib32-vgui' 'xash3d-hlsdk')
makedepends=('make' 'binutils' 'cmake')
makedepends=('gcc-multilib' 'lib32-gcc-libs')
backup=('etc/conf.d/xash3d')
source=("$pkgname::git+https://github.com/FWGS/xash3d-fwgs"
	${pkgname%%-git}
	${pkgname%%-git}.conf.d
	${pkgname%%-git}.dedicated
	${pkgname%%-git}.desktop
	https://github.com/FWGS/xash-extras/releases/download/v0.19.2/extras.pak
)

pkgver() {
	cd $srcdir/$pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$pkgname
	git submodule update --init --recursive
	./waf configure --prefix=/usr \
                --build-type=release \
                --vgui vgui-dev \
	--enable-stbtt
}

build() {
	cd $srcdir/$pkgname/
	./waf build
}

package() {
	cd $srcdir/$pkgname/

	./waf install --destdir="$pkgdir"
	mv $pkgdir/usr/lib $pkgdir/usr/lib32
	install -Dm644 ../${pkgname%%-git}.conf.d $pkgdir/etc/conf.d/${pkgname%%-git}
	install -Dm755 ../${pkgname%%-git} $pkgdir/usr/bin/${pkgname%%-git}
	install -Dm755 ../${pkgname%%-git}.dedicated $pkgdir/usr/bin/${pkgname%%-git}-dedicated
	install -Dm644 ../${pkgname%%-git}.desktop $pkgdir/usr/share/applications/${pkgname%%-git}.desktop
	install -Dm644 game_launch/icon-xash-material.png $pkgdir/usr/share/pixmaps/${pkgname%%-git}.png
	install -Dm644 ../extras.pak "$pkgdir"/usr/share/xash3d/extras.pak
}

md5sums=('SKIP'
	'6993fbd2059d81c5a23bf1a3ff6b24b1'
	'7a92aaf374c141f8cc947fbd3fb0d5ca'
	'b1da0a6ee8887a6aa5298f4df86e9916'
	'60d714544048b0383a7e79cfaed96d78'
'409462da6be03f004e84452cfcb93d6b')
