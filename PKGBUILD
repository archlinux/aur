# Maintainer: robertfoster

pkgname=xash3d-git
pkgver=r188.b1db062
pkgrel=1
pkgdesc="A custom Gold Source engine rewritten from scratch"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url="http://xash.su/"
license=('GPL3')
depends=('freetype2' 'fontconfig' 'sdl2' 'vgui')
depends_x86_64=('lib32-freetype2' 'lib32-fontconfig' 'lib32-sdl2' 'lib32-vgui')
makedepends=('make' 'binutils' 'cmake')
makedepends=('gcc')
makedepends_x86_64=('gcc-multilib' 'lib32-gcc-libs')
source=("$pkgname::git+https://github.com/FWGS/xash3d-fwgs.git"
        ${pkgname%%-git}
        ${pkgname%%-git}.png
	${pkgname%%-git}.conf.d
        ${pkgname%%-git}.desktop
)

pkgver() {
	cd $srcdir/$pkgname
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$pkgname
	git submodule init && git submodule update
	./waf configure --prefix=/usr --vgui https://github.com/FWGS/vgui-dev
}

build() {
	cd $srcdir/$pkgname
	./waf build
}

package() {
	cd $srcdir/$pkgname/
	./waf --destdir="$pkgdir" install
	mv $pkgdir/usr/lib $pkgdir/usr/lib32
	install -Dm644 ../${pkgname%%-git}.conf.d $pkgdir/etc/conf.d/${pkgname%%-git}
	install -Dm755 ../${pkgname%%-git} $pkgdir/usr/bin/${pkgname%%-git}
	install -Dm644 ../${pkgname%%-git}.desktop $pkgdir/usr/share/applications/${pkgname%%-git}.desktop
        install -Dm644 ../${pkgname%%-git}.png $pkgdir/usr/share/pixmaps/${pkgname%%-git}.png
}

md5sums=('SKIP'
         'e2507dc0ca2fcd5de9c8d485fa0382ae'
         'd55c1a1fcb5a8a36d80f61712a77f291'
         'f4475bb569ad292f6a3711b74ced7bab'
         '60d714544048b0383a7e79cfaed96d78')
