# Maintainer: zaps166 <spaz16@wp.pl>

pkgname=nfs2se-git
pkgver=1.1.2
pkgrel=3
pkgdesc='Cross-platform wrapper for the Need For Speed™ II SE game with 3D acceleration and TCP protocol!'
arch=('i686' 'x86_64' 'armv7' 'armv7h')
url='https://github.com/zaps166/NFSIISE'
license=('MIT')

source=('git+https://github.com/zaps166/NFSIISE'
        'nfs2se')
md5sums=('SKIP'
         '50da45b125bd78839b60b9a16989c37f')

machine=$(uname -m)

NFS_DIR="NFSIISE"
NFS_DATA_DIR="$NFS_DIR/Need For Speed II SE"
OTHER_CPU=0

if [ $machine == "x86_64" ]; then
	depends=('lib32-sdl2' 'lib32-libgl')
	makedepends=('gcc-multilib' 'yasm')
	optdepends=('lib32-libpulse: Required for PulseAudio')
elif [ $machine == "i686" ]; then
	depends=('sdl2' 'libgl')
	makedepends=('gcc' 'yasm')
else
	depends=('sdl2' 'libgl')
	makedepends=('gcc')
	source[0]=${source[0]}"-CPP"

	NFS_DIR="$NFS_DIR-CPP"
	NFS_DATA_DIR="$NFS_DIR/NFSIISE/Need For Speed II SE"
	OTHER_CPU=1
fi

install=nfs2se-git.install

build()
{
	cd $srcdir/$NFS_DIR
	git submodule init
	git submodule update
	./compile_nfs
}

package()
{
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/nfs2se $pkgdir/usr/bin

	mkdir $pkgdir/opt
	cp -r "$srcdir/$NFS_DATA_DIR" $pkgdir/opt/nfs2se
	rm -f $pkgdir/opt/nfs2se/open_config.bat
	if [ $OTHER_CPU != 0 ]; then
		cp $srcdir/$NFS_DIR/nfs2se $pkgdir/opt/nfs2se
	fi

	mkdir -p $pkgdir/usr/share/applications
	mv $pkgdir/opt/nfs2se/nfs2se.desktop $pkgdir/usr/share/applications

	mkdir -p $pkgdir/usr/share/icons/hicolor/32x32/apps
	mv $pkgdir/opt/nfs2se/nfs2se.png $pkgdir/usr/share/icons/hicolor/32x32/apps
}
