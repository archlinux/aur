# Maintainer: Charles Dong <charlesdong_2000@outlook.com>

pkgname=stellarium-bin
_pkgname=stellarium
_pkgname2=Stellarium
pkgver=1.0
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
_download_url="https://github.com/Stellarium/$_pkgname/releases/download/v$pkgver"

source=(
	"$_download_url/$_target"
	"$_download_url/$_verifyfile"
	$_pkgname.bash
)
sha256sums=(
	'46379ab41b591296e0bb15e28de3822ab24bc1c9a24466d3bba4de83ed2f5b16'
	'e153d96ca32efcbcad9cf48d78f6c372d8ede18c0832e2e31cdc0069d3d2a809'
	'8971af52c47a77fb968219190909f7cd5feb9126e33c323eeeb9783e405e8dd1'
)

_squashfs_root="squashfs-root"

prepare() {
	echo -ne 'Extracting the AppImage (This may need some time)... '
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
