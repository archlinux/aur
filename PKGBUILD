# Maintainer: ErnyTech <erny.castell[at]gmail[dot]com>
pkgname=mcpelauncher-git
pkgver=20180520
pkgrel=2
pkgdesc="Launch MCPE on Linux!"
url="https://github.com/MCMrARM/mcpelauncher-linux"
arch=('x86_64')
license=('BSD 2-clause + Other')
depends=('lib32-glibc' 'lib32-gcc-libs' 'lib32-libstdc++5' 'lib32-gtk2' 'lib32-alsa-lib' 'lib32-alsa-plugins' 'lib32-nss' 'lib32-libxss' 'lib32-gconf' 'lib32-libxtst' 'lib32-libevdev' 'lib32-libprotobuf' 'lib32-libzip' 'lib32-curl')
makedepends=('cmake' 'lib32-zlib' 'lib32-libx11' 'lib32-libpng' 'lib32-util-linux' 'lib32-openssl' 'lib32-mesa' 'protobuf' 'libzip' 'wget' 'unzip')
source=('git+https://github.com/MCMrARM/mcpelauncher-linux.git'
        "mcpelauncher-git.sh")
md5sums=('SKIP'
         '23584bf7039777f78b0b7caa6099955c')
prepare() {
   cd $srcdir/mcpelauncher-linux
   git submodule update --init --recursive
   ./setup_cef.sh
   ./download_icon.sh
   ./setup_bin_libs.sh
}

build() {
    cd $srcdir/mcpelauncher-linux
    cmake .
    make
}

package() {
    install -Ddm655 $srcdir/mcpelauncher-linux/libs/ $pkgdir/opt/$pkgname/libs
    cp -R $srcdir/mcpelauncher-linux/libs/* $pkgdir/opt/$pkgname/libs
    chmod -R 655 $pkgdir/opt/$pkgname/libs
    install -Dm655 $srcdir/mcpelauncher-linux/mcpelauncher-icon.png $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/usr/share/pixmaps
    ln -s /opt/$pkgname/mcpelauncher-icon.png $pkgdir/usr/share/pixmaps/mcpelauncher-icon.png
    install -Dm755 $srcdir/mcpelauncher-linux/mcpelauncher.desktop $pkgdir/usr/share/applications/mcpelauncher.desktop
    install -Dm755 $srcdir/mcpelauncher-linux/mcpelauncher $pkgdir/opt/$pkgname
    install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/mcpelauncher
    install -Dm755 $srcdir/mcpelauncher-linux/server $pkgdir/opt/$pkgname
    ln -s /opt/$pkgname/server $pkgdir/usr/bin/mcpelauncher-server
    ln -s /opt/$pkgname/libs/cef/bin/icudtl.dat  $pkgdir/opt/$pkgname
    ln -s /opt/$pkgname/libs/cef/lib/libcef.so $pkgdir/opt/$pkgname
    ln -s /opt/$pkgname/libs/cef/bin/natives_blob.bin $pkgdir/opt/$pkgname
    ln -s /opt/$pkgname/libs/cef/bin/snapshot_blob.bin $pkgdir/opt/$pkgname
    install -Ddm655 $srcdir/mcpelauncher-linux/src/client_resources/ $pkgdir/opt/$pkgname/src/client_resources/
#     cp -R $srcdir/mcpelauncher-linux/src/client_resources/* $pkgdir/opt/$pkgname/src/client_resources/
    chmod -R 655 $pkgdir/opt/$pkgname/src/client_resources/
    install -Ddm655 $srcdir/mcpelauncher-linux/src/ui/browser/resources $pkgdir/opt/$pkgname/src/ui/browser/resources
    cp -R $srcdir/mcpelauncher-linux/src/ui/browser/resources/* $pkgdir/opt/$pkgname/src/ui/browser/resources
    chmod -R 655 $pkgdir/opt/$pkgname/src/ui/browser/resources
    install -Ddm655 $srcdir/mcpelauncher-linux/gplay_api $pkgdir/opt/$pkgname/gplay_api
    cp -R $srcdir/mcpelauncher-linux/gplay_api/* $pkgdir/opt/$pkgname/gplay_api
    chmod -R 655 $pkgdir/opt/$pkgname/gplay_api
}
