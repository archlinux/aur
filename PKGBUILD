# Maintainer: Manuel <mdomlop gmail com>

pkgname=nfs2se
pkgver=1.3.0
pkgrel=1
pkgdesc='Cross-platform wrapper for the Need For Speed™ II SE'

arch=('i686' 'x86_64')
license=('MIT')

conflicts=("$pkgname-git")

source=("https://github.com/zaps166/NFSIISE/releases/download/v$pkgver/$pkgname-src.tar.gz"
        "$pkgname")

machine=$(uname -m)

if [ $machine == "x86_64" ]; then
	depends=('lib32-sdl2' 'lib32-libglvnd')
	makedepends=('gcc-multilib' 'yasm')
	optdepends=('lib32-libpulse: Required for PulseAudio')
	SUBMODULE=src/Asm
elif [ $machine == "i686" ]; then
	depends=('sdl2' 'libglvnd')
	makedepends=('gcc' 'yasm')
	SUBMODULE=src/Asm
else
	depends=('sdl2' 'libglvnd')
	makedepends=('gcc')
	COMPILE_ARG=cpp
	SUBMODULE=src/Cpp
fi

install=$pkgname.install

build()
{
	cd $srcdir/$pkgname-src
	./compile_nfs
}

package()
{
	install -dm 755 $pkgdir/usr/bin
	install -Dm 755 $srcdir/$pkgname $pkgdir/usr/bin

	install -dm 755 $pkgdir/opt
	cp -r "$srcdir/$pkgname-src/Need For Speed II SE" $pkgdir/opt/$pkgname
	rm -f $pkgdir/opt/$pkgname/open_config.bat

	install -dm 755 $pkgdir/usr/share/applications
	install -Dm 755 $pkgdir/opt/$pkgname/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

	install -dm 755 $pkgdir/usr/share/icons/hicolor/32x32/apps
	install -Dm 644 $pkgdir/opt/$pkgname/$pkgname.png $pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png
}

md5sums=('8f9b41ac587f57dc9e7f6dc575bca22d'
         '50da45b125bd78839b60b9a16989c37f')
