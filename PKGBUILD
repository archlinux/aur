# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>

pkgname=dfu-programmer-svn
pkgver=105
pkgrel=1
pkgdesc="Device Firmware Update based USB programmer for Atmel chips with a USB bootloader"
arch=('i686' 'x86_64')
url="http://dfu-programmer.sourceforge.net/"
license=('GPL')
depends=('libusb')
makedepends=('subversion')
source=('dfu-programmer-as-needed.patch')
md5sums=('a836e61ea39c240e19224de6fcfed725')
_svntrunk=https://dfu-programmer.svn.sourceforge.net/svnroot/dfu-programmer/trunk/dfu-programmer
_svnmod=dfu-programmer

build() {
    cd "$srcdir"
    msg "Connecting to SVN server...."

    if [[ -d "$_svnmod/.svn" ]]; then
        (cd "$_svnmod" && svn up -r "$pkgver")
    else
        svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
    fi

    msg "SVN checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_svnmod-build"
    cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
    cd "$srcdir/$_svnmod-build"

    patch -p0 -i "$srcdir"/dfu-programmer-as-needed.patch
    ./bootstrap.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$_svnmod-build"
    make DESTDIR="$pkgdir/" install
}

