# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=nfs2se-git
pkgver=v1.4.0.r0.g6fc5caf
pkgrel=1
pkgdesc='Cross-platform wrapper for the Need For Speed™ II SE game with 3D acceleration and TCP protocol!'
arch=('x86_64')
url='https://github.com/zaps166/NFSIISE'
license=('MIT')

source=('git+https://github.com/zaps166/NFSIISE'
        'nfs2se')
md5sums=('SKIP'
         '50da45b125bd78839b60b9a16989c37f')

machine=$(uname -m)

if [ $machine == "x86_64" ]; then
	depends=('lib32-sdl2' 'lib32-libgl')
	optdepends=(
		'lib32-mesa: Opensource OpenGL drivers'
		'lib32-nvidia-utils: NVIDIA drivers'
	)
	makedepends=('gcc-multilib' 'yasm')
	SUBMODULE=src/Asm
else
	depends=('sdl2' 'libgl')
	makedepends=('clang' 'lld')
	COMPILE_ARG=cpp
	SUBMODULE=src/Cpp
fi

install=nfs2se-git.install

pkgver()
{
	cd $srcdir/NFSIISE
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	cd $srcdir/NFSIISE
	git submodule init
	git submodule update $SUBMODULE
}

build()
{
# 	GL=gl1
# 	GL=gles2
	cd $srcdir/NFSIISE
	./compile_nfs $COMPILE_ARG $GL
}

package()
{
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/nfs2se $pkgdir/usr/bin

	mkdir $pkgdir/opt
	cp -r "$srcdir/NFSIISE/Need For Speed II SE" $pkgdir/opt/nfs2se
	rm -f $pkgdir/opt/nfs2se/*.bat

	mkdir -p $pkgdir/usr/share/applications
	mv $pkgdir/opt/nfs2se/nfs2se.desktop $pkgdir/usr/share/applications

	mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps
	mv $pkgdir/opt/nfs2se/nfs2se.png $pkgdir/usr/share/icons/hicolor/32x32/apps
}
