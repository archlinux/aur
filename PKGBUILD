# Maintainer: Ambition_echo <ambition_echo@outlook.com>

resname=earth_wallpaper
pkgname=earth-wallpaper-nightly
name=earth-wallpaper
pkgver=2.1.8.r2.gdb4b010
pkgrel=0
pkgdesc="Simple and easy to use multifunctional wallpaper software 简单好用的多功能壁纸软件"
arch=('x86_64')
url="https://jihulab.com/ambition-echo/earth_wallpaper"
license=('GPL3')

depends=('dbus-python' 'python' 'python-pillow' 'python-requests' 'pyside6' 'python-pysocks')

source=(
    "git+$url.git"
    "$name.desktop"
    )
sha256sums=(
    "SKIP"
    "7ce17a298bbf171fde6697fb4c1082f84dd1968504120ebf73d152a71c43122d"
    )

pkgver() {
    cd $resname
    ( set -o pipefail
        git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd $srcdir/$resname
    sed -i "s/return \".*/return \"$(git describe --tags |  sed  's/\([^-]*-g\)/r\1/;s/-/./g')\"/g" $resname/about.py
}

package() {
    install -Dm644 ./$name.desktop $pkgdir/usr/share/applications/$name.desktop
    cd $srcdir/$resname
    mkdir -p $pkgdir/opt/$pkgname/$resname
    cp -r $resname/* $pkgdir/opt/$pkgname/$resname
    chmod +x $pkgdir/opt/$pkgname/$resname/main.py
}
