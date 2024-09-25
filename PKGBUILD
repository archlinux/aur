# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=stellarium-qt5-bin
_pkgname=stellarium
_pkgname2=Stellarium
pkgver=24.3
_pkgtag=v$pkgver
pkgrel=1
pkgdesc="Software which renders realistic skies in real time with OpenGL (Qt5 version)"
arch=('x86_64')
url="https://${_pkgname}.org/"
license=('GPL2')
depends=()
conflicts=($_pkgname ${_pkgname}-bin)
provides=($_pkgname)
validpgpkeys=('79151C2E6351E7278DA1A730BF38D4D02A328DFF') # Alexander Wolf <alex.v.wolf@gmail.com>

_qtver=5
_target="$_pkgname2-$pkgver-qt$_qtver-${CARCH}.AppImage"
_verifyfile="${_target}.asc"
_download_url="https://github.com/Stellarium/$_pkgname/releases/download/$_pkgtag"

source=(
    "$_download_url/$_target"
    "$_download_url/$_verifyfile"
    "$_pkgname.bash"
)
sha256sums=(
    '2c136618ede7fb0687d8371a95a004e4bf9f00e0a1a83359de88b04aeec1cf0b'
    'b2bf7042231936e9f8ba3ec33b02cd51e0c6bd405f3250dd78378cf447c90a07'
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
