# Maintainer: Charles Dong <charlesdong_2000@outlook.com>

pkgname=stellarium-bin
_pkgname=stellarium
_pkgname2=Stellarium
pkgver=1.1.1
_pkgtag=1.1
pkgrel=1
pkgdesc="Free and open source planetarium showing a realistic sky in 3D"
arch=('x86_64')
url="https://${_pkgname}.org/"
license=('GPL2')
depends=()
conflicts=($_pkgname)
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF')

_target="$_pkgname2-$pkgver-x86_64.AppImage"
_verifyfile="${_target}.asc"
_download_url="https://github.com/Stellarium/$_pkgname/releases/download/v$_pkgtag"

source=(
	"$_download_url/$_target"
	"$_download_url/$_verifyfile"
	$_pkgname.bash
)
sha256sums=(
	'053db8567959e0739f3757ad26831b170836f7539408df803ad67c215afb6771'
	'c783512818c0a8d6cc62dc4226a924a6de4c27764b206a3a33773bbe28d7019e'
	'8971af52c47a77fb968219190909f7cd5feb9126e33c323eeeb9783e405e8dd1'
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
	# install -Dm755 ./$_target -t $pkgdir/opt/$_pkgname # Copying the AppImage does not work
	mkdir -p $pkgdir/opt/$_pkgname
	cp -rf ./$_squashfs_root $pkgdir/opt/$_pkgname

	install -Dm644 ./org.$_pkgname.$_pkgname2.desktop -t $pkgdir/usr/share/applications

	mkdir -p $pkgdir/usr/share/icons
	cp -rf ./hicolor $pkgdir/usr/share/icons

	install -Dm755 ./$_pkgname.bash $pkgdir/usr/bin/$_pkgname
}
