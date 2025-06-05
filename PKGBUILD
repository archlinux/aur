# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=cutechess
pkgname=$_pkgname-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Tools for working with chess engines"
arch=('x86_64')
url="https://github.com/cutechess/cutechess"
license=('GPL-3.0')

conflicts=($_pkgname)
provides=($_pkgname)
depends=(zlib bash libx11 libgpg-error glibc libglvnd freetype2 fontconfig gmp libxcb gcc-libs e2fsprogs)
makedepends=(libappimage)

source=("${url}/releases/download/v${pkgver}/Cute_Chess-${pkgver}-${arch[0]}.AppImage"
        "$_pkgname.bash"
)

sha256sums=('aa09da9f0371e1934e1df4d7a73c50c75cc30d871b7582685ccb3b7acf097e03'
            'b3bae5b6db820193f69fafd20515ef239166998ed5bf209b57cccb498731b95b')

_squashfs_root="squashfs-root"

prepare() {
	echo 'Extracting the AppImage (This may take some time)... '

	rm -rf $_squashfs_root
	chmod +x "Cute_Chess-${pkgver}-${arch[0]}.AppImage"
	"./Cute_Chess-${pkgver}-${arch[0]}.AppImage" --appimage-extract >> /dev/null
	chmod +x $_squashfs_root/AppRun

	echo 'Done'
}

package() {
	mkdir -p $pkgdir/opt/$_pkgname
	cp -arf ./$_squashfs_root $pkgdir/opt/$_pkgname
	rm -rf $pkgdir/opt/$_pkgname/$_squashfs_root/etc/ $pkgdir/opt/$_pkgname/$_squashfs_root/usr/bin/gtk-update-icon-cache $pkgdir/opt/$_pkgname/$_squashfs_root/usr/bin/sh

	install -Dm644 $pkgdir/opt/$_pkgname/$_squashfs_root/cutechess.desktop -t $pkgdir/usr/share/applications/

	install -Dm644 $pkgdir/opt/$_pkgname/$_squashfs_root/cutechess.png -t $pkgdir/usr/share/icons/

	install -Dm755 ./$_pkgname.bash $pkgdir/usr/bin/$_pkgname
}
