# Maintainer: robertfoster

pkgname=xash3d-git
pkgver=r339.1b37211
pkgrel=1
pkgdesc="A custom Gold Source engine rewritten from scratch"
arch=('x86_64')
url="http://xash.su/"
license=('GPL3')
depends=('lib32-freetype2' 'lib32-fontconfig' 'lib32-sdl2' 'lib32-vgui' 'xash3d-hlsdk')
makedepends=('make' 'binutils' 'cmake')
makedepends=('gcc-multilib' 'lib32-gcc-libs')
backup=('etc/conf.d/xash3d')
source=("$pkgname::git://github.com/M0Rf30/xash3d-fwgs#commit=1b372115a54b4467fab666f2a9d8f197b12d1c7b"
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
	git submodule init && git submodule update
}

package() {
	cd $srcdir/$pkgname/
	./waf configure --prefix=/usr \
		--dedicated \
		--build-type=release \
		--vgui https://github.com/FWGS/vgui-dev \
		--enable-stbtt
	./waf --dedicated build
	./waf --destdir="$pkgdir" --dedicated install

	./waf clean

	./waf configure --prefix=/usr \
		--build-type=release \
		--vgui https://github.com/FWGS/vgui-dev \
		--enable-stbtt
	./waf build
	./waf --destdir="$pkgdir" install
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
	'427087f57aab9c8944bc604849e3900e'
	'60d714544048b0383a7e79cfaed96d78'
'409462da6be03f004e84452cfcb93d6b')
