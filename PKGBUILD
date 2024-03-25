# Maintainer: Charles Dong <charlesdong_2000@outlook.com>

pkgname=stellarium-bin
_pkgname=stellarium
_pkgname2=Stellarium
pkgver=24.1
_pkgtag=v$pkgver
pkgrel=1
pkgdesc="Software which renders realistic skies in real time with OpenGL"
arch=('x86_64')
url="https://${_pkgname}.org/"
license=('GPL2')
depends=()
conflicts=($_pkgname)
provides=($_pkgname)
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF')

_qtver=6
_target="$_pkgname2-$pkgver-qt$_qtver-x86_64.AppImage"
_verifyfile="${_target}.asc"
_download_url="https://github.com/Stellarium/$_pkgname/releases/download/$_pkgtag"

source=(
	"$_download_url/$_target"
	"$_download_url/$_verifyfile"
	"$_pkgname.bash"
)
sha256sums=(
	'853a26c5dab168b3190e1376e5b00bc7a9b9b50c2ca1985df0b650a1245c2da7'
	'67c7c74f5e6f85c77a0b07b4342a1a9921b903047517b917edbaa5518e8b3b40'
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

    # Clear possibly existing directory
    rm -rf ./hicolor

    mv -f $_squashfs_root/usr/share/icons/hicolor .
    rm ./hicolor/icon-theme.cache
    rm ./hicolor/index.theme

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
