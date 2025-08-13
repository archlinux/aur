# Maintainer: username227 <gfrank227 at gmail dot com> 

pkgname=deemix-gui
pkgver=0.3.10
pkgrel=1
pkgdesc='A GUI electron app for the deemix library. Download music from deezer.'
url=https://github.com/bambanah/deemix
license=(GPL-3.0-or-later)
arch=("x86_64")
provides=('deemix')
conflicts=('deemix-gui-appimage' 'deemix-gui-git' 'deemix-fix-gui-appimage-git' 'deemix-fix-gui-git')
depends=('electron')
makedepends=('git' 'dpkg' 'pnpm' 'cairo' 'nodejs' 'zip')
source=('git+https://github.com/bambanah/deemix'
		'desktop_patch.patch')
b2sums=('SKIP'
        'b44bd0743b7ec092fd6327e3e455e1176b6ab5b4d1e69b870b89cae2698d4677c5f2718a6295bf867e61f90fba195b4719eaeac7a113ec14d13a5104f8dedf9d')
options=('!strip')

 build() {
	cd $srcdir/deemix
	pnpm i
	pnpm make
	cd $srcdir/deemix/packages/gui/out/make/deb/x64
	dpkg-deb -x deemix_${pkgver}_amd64.deb .
}

package(){
	install -dm755 $pkgdir/opt/deemix
	install -dm644 $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/bin
	mv $srcdir/deemix/packages/gui/out/Deemix-linux-x64/* $pkgdir/opt/deemix
	ln -s /opt/deemix/deemix-gui $pkgdir/usr/bin/deemix-gui
	install -Dm755 $srcdir/deemix/packages/gui/out/make/deb/x64/usr/share/applications/deemix.desktop $pkgdir/usr/share/applications/deemix-gui.desktop
	patch $pkgdir/usr/share/applications/deemix-gui.desktop $srcdir/desktop_patch.patch
	install -Dm644 $srcdir/deemix/packages/gui/out/make/deb/x64/usr/share/doc/deemix/copyright -t $pkgdir/usr/share/doc/deemix
	install -Dm644 $srcdir/deemix/packages/gui/out/make/deb/x64/usr/share/pixmaps/deemix.png $pkgdir/usr/share/pixmaps/deemix-gui.png
	
}

