# Maintainer: Antony Jordan <wiccan.two at gmail dot com>
_git_name=OWON-VDS1022
_pkgname=owon-vds-tiny
pkgname=$_pkgname-git
pkgver=1.0.30.cf9.r0.gdf0e1f8
pkgrel=1
pkgdesc="Application for the OWON VDS1022 oscilloscope"
arch=('any')
depends=('java-runtime')
provides=($_pkgname)
conflicts=($_pkgname)
install="$_pkgname.install"
source=(
    "git+https://github.com/florentbr/$_git_name.git"
    "$_pkgname.desktop"
    "$_pkgname.appdata.xml"
    "70-$_pkgname.rules"
    "$_pkgname.sh"
)
md5sums=(
    "SKIP"
    "dfc56705643a13b59d13e0926d869de6"
    "daaa9c284a6faec7bdace2a6c1b7e698"
    "a1a166bf4987082729eb4b4bf6830b6f"
    "ef800a7e611a34493151cef66a7e606c"
)
url="https://github.com/florentbr/$_git_name"
pkgver() {
    cd "$srcdir/$_git_name"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {

    mv "$srcdir/$_git_name/lib/linux/amd64" "$srcdir/$_git_name/lib/linux/x86_64" 
    
    echo 'Add usb permissions ...'

    PK_RULES_DIR="$pkgdir/usr/lib/udev/rules.d"
    mkdir -p "$PK_RULES_DIR"
    cp "$srcdir/70-$_pkgname.rules" "$PK_RULES_DIR"

    echo 'Add application files ...'

    PK_LIB_DIR="$pkgdir/usr/lib/$_pkgname"
    PK_APP_DIR="$pkgdir/usr/share/$_pkgname"

    mkdir -p "$PK_LIB_DIR"
    mkdir -p "$PK_APP_DIR"
    mkdir -p "$pkgdir/usr/bin"

    cp "$srcdir/$_git_name/lib/linux/$CARCH/librxtxSerial.so" "$PK_LIB_DIR"
    cp "$srcdir/$_git_name/lib/linux/$CARCH/libusb-0.1.so.4" "$PK_LIB_DIR"
    cp "$srcdir/$_git_name/lib/linux/$CARCH/libusbJava.so" "$PK_LIB_DIR"
    cp -r "$srcdir/$_git_name/doc" "$PK_APP_DIR"
    cp -r "$srcdir/$_git_name/fwr" "$PK_APP_DIR"
    cp -r "$srcdir/$_git_name/jar" "$PK_APP_DIR"
    cp "$srcdir/$_git_name/version.txt" "$PK_APP_DIR"
    cp "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
    chmod +x "$pkgdir/usr/bin/$_pkgname"

    echo 'Add launcher ...'

    PK_PIXMAP_DIR="$pkgdir/usr/share/pixmaps"
    PK_APPLICATIONS_DIR="$pkgdir/usr/share/applications"
    PK_APPDATA_DIR="$pkgdir/usr/share/appdata"

    mkdir -p "$PK_PIXMAP_DIR"
    mkdir -p "$PK_APPLICATIONS_DIR"
    mkdir -p "$PK_APPDATA_DIR"
    
    cp "$srcdir/$_git_name/ico/icon48.png" "$PK_PIXMAP_DIR/$_pkgname.png"
    cp "$srcdir/$_pkgname.desktop" "$PK_APPLICATIONS_DIR"
    cp "$srcdir/$_pkgname.appdata.xml" "$PK_APPDATA_DIR"
}

