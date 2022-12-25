# Maintainer: Charles Dong <charlesdong_2000@outlook.com>

pkgname=stellarium-bin
_pkgname=stellarium
_pkgname2=Stellarium
pkgver=1.2
_pkgtag=1.2
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
	"$_pkgname.bash"
)
sha256sums=(
	'081c88d008345fc0a73788872687905e54717b9269747e9e776e539720c8fa03'
	'fcb8c3c9bd61d29cf9559c655ada18ddae14959665809d8e3140791ba6c12f92'
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
	# install -Dm755 ./$_target -t $pkgdir/opt/$_pkgname # Copying the AppImage does not work
	mkdir -p $pkgdir/opt/$_pkgname
	cp -rf ./$_squashfs_root $pkgdir/opt/$_pkgname

	install -Dm644 ./org.$_pkgname.$_pkgname2.desktop -t $pkgdir/usr/share/applications

	mkdir -p $pkgdir/usr/share/icons
	cp -rf ./hicolor $pkgdir/usr/share/icons

	install -Dm755 ./$_pkgname.bash $pkgdir/usr/bin/$_pkgname
}
