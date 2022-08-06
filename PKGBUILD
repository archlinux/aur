# Maintainer: Ambition_echo <ambition_echo@outlook.com>

resname=earth_wallpaper
appid=cn.huguoyang.earthwallpaper
pkgname=earth-wallpaper-nightly
name=earth-wallpaper
pkgver=1.6.3.r1.g277c6b7
pkgrel=0
pkgdesc="实时获取地球照片作为壁纸"
arch=('x86_64')
url="https://jihulab.com/ambition-echo/earth_wallpaper"
license=('GPL3')

depends=('qt5-base')
makedepends=('cmake' 'git' 'ninja')

source=("git+$url.git")
sha256sums=("SKIP")

pkgver() {
    cd $resname
    ( set -o pipefail
        git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd $srcdir/$resname/src
    sed -i "s/#define VERSION .*/#define VERSION \"$(git describe --tags |  sed  's/\([^-]*-g\)/r\1/;s/-/./g')\"/g" about.h
}

build() {
    mkdir build
    cd build
    cmake ../$resname -G Ninja
    ninja
}

package() {
    cd $srcdir/$resname
    install -Dm644 ./resource/$appid.png $pkgdir/opt/$pkgname/$name.png
    install -Dm644 ./package/$name.desktop $pkgdir/usr/share/applications/$name.desktop
    cd ../build
    install -D ./$name $pkgdir/opt/$pkgname/$name
    install -D ./scripts/* -t $pkgdir/opt/$pkgname/scripts
    install -Dm666 ./template/* -t $pkgdir/opt/$pkgname/template
}
