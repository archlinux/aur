# Maintainer: Charles Dong <charlesdong_2000@outlook.com>

pkgname=stellarium-bin
_pkgname=stellarium
_pkgname2=Stellarium
pkgver=23.3
_pkgtag=v$pkgver
pkgrel=1
pkgdesc="Free GPL software which renders realistic skies in real time with OpenGL"
arch=('x86_64')
url="https://${_pkgname}.org/"
license=('GPL2')
depends=()
conflicts=($_pkgname)
provides=($_pkgname)
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF')

_qtver=5
_target="$_pkgname2-$pkgver-qt$_qtver-x86_64.AppImage"
_verifyfile="${_target}.asc"
_download_url="https://github.com/Stellarium/$_pkgname/releases/download/$_pkgtag"

source=(
	"$_download_url/$_target"
	"$_download_url/$_verifyfile"
	"$_pkgname.bash"
)
sha256sums=(
	'bf27b276246842a3a080860cf2751b3258437676bfa5c0752d5c31b883656041'
	'5fea92e6e3474bd0fc29a2c92d944a768804ac5d7b12e877a7fb8a12296c9ecf'
	'cc8903384ef8b8349dda202be45c3f68542dc74d40c4a1c266a5e057e96323ff'
)

_squashfs_root="squashfs-root"

prepare() {
	echo -ne 'Extracting the AppImage (This may take some time)... '
	rm -rf $_squashfs_root
	chmod +x $_target
	./$_target --appimage-extract >> /dev/null
	chmod +x $_squashfs_root/AppRun
	echo 'done'
	
	echo -ne 'Preparing necessary resouces... '
	mv -f $_squashfs_root/org.$_pkgname.$_pkgname2.desktop .
	rm -rf ./hicolor
	mv -f $_squashfs_root/usr/share/icons/hicolor .
	echo 'done'
}

package() {
	mkdir -p $pkgdir/opt/$_pkgname
	cp -rf ./$_squashfs_root $pkgdir/opt/$_pkgname

	install -Dm644 ./org.$_pkgname.$_pkgname2.desktop -t $pkgdir/usr/share/applications

	mkdir -p $pkgdir/usr/share/icons
	cp -rf ./hicolor $pkgdir/usr/share/icons

	install -Dm755 ./$_pkgname.bash $pkgdir/usr/bin/$_pkgname
}
