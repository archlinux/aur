# Maintainer: username227 <gfrank227 at gmail dot com> 

pkgname=deemix-gui
pkgver=0.4.5
pkgrel=1
pkgdesc='A GUI electron app for the deemix library. Download music from deezer.'
url=https://github.com/bambanah/deemix
license=(GPL-3.0-or-later)
arch=("x86_64")
provides=('deemix')
conflicts=('deemix-gui-appimage' 'deemix-gui-git' 'deemix-fix-gui-appimage-git' 'deemix-fix-gui-git')
depends=('electron')
makedepends=('git' 'dpkg' 'pnpm' 'cairo' 'nodejs' 'zip')
source=("git+https://github.com/bambanah/deemix#tag=${pkgname}@${pkgver}"
		"desktop_patch.patch")
b2sums=('d272ccab4dcc4e2816fda195483bbb84b3ea2b6632e4d9bd5f159c042d615cd78a11a71b74bb2cfa6ae89c4f4ceb8bede0b48dd39bf7859f1334249c057c151d'
        '169cd20411165c1e1ef594c79ab19a76b46ea7ab78da07e7c348cb8f0348047c3b92666fbda0806e833c8f3862ea68095c1f1e8d8220656323351e0f65d6f1b1')
options=('!strip')

 build() {
	cd $srcdir/deemix
	pnpm i
	pnpm make
	cd $srcdir/deemix/packages/gui/out/make/deb/x64
	dpkg-deb -x deemix_${pkgver}_amd64.deb .
}

package(){
# Install Main Program
	install -dm755 $pkgdir/opt/deemix
	install -dm644 $pkgdir/usr/share/applications
	install -dm755 $pkgdir/usr/bin
	mv $srcdir/deemix/packages/gui/out/Deemix-linux-x64/* $pkgdir/opt/deemix
# Install Shortcut to /usr/bin
	ln -s /opt/deemix/deemix-gui $pkgdir/usr/bin/deemix-gui
# Install desktop file and patch to correct program filename
	install -Dm755 $srcdir/deemix/packages/gui/out/make/deb/x64/usr/share/applications/deemix.desktop $pkgdir/usr/share/applications/deemix-gui.desktop
	patch $pkgdir/usr/share/applications/deemix-gui.desktop $srcdir/desktop_patch.patch
# Install license
	install -Dm644 $srcdir/deemix/packages/gui/out/make/deb/x64/usr/share/doc/deemix/copyright -t $pkgdir/usr/share/doc/deemix
# Install icon file
	install -Dm644 $srcdir/deemix/packages/gui/out/make/deb/x64/usr/share/pixmaps/deemix.png $pkgdir/usr/share/pixmaps/deemix-gui.png
	
}

