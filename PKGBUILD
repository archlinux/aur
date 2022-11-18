# Maintainer: Ambition_echo <ambition_echo@outlook.com>

resname=earth_wallpaper
appid=cn.huguoyang.earthwallpaper
pkgname=earth-wallpaper-nightly
name=earth-wallpaper
pkgver=1.8.7
pkgrel=0
pkgdesc="Simple and easy to use multifunctional wallpaper software 简单好用的多功能壁纸软件"
arch=('x86_64')
url="https://jihulab.com/ambition-echo/earth_wallpaper"
license=('GPL3')

depends=('dbus-python' 'qt5-base' 'python' 'python-pillow' 'python-requests')
makedepends=('cmake' 'git' 'ninja')

source=("git+$url.git")
sha256sums=("SKIP")

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
