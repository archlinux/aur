# Maintainer: Tomek Łaziuk <tlaziuk@gmail.com>

pkgname=worksnaps
pkgver=1.1.20171130
pkgrel=1
pkgdesc="Time Tracking with Screenshots for Remote Teams"
arch=('any')
url="http://www.worksnaps.com/www/download.shtml"
license=('unknown')
depends=('java-runtime')
source=("http://worksnaps-download.s3.amazonaws.com/WSClient-linux-$pkgver.zip")
md5sums=('be704edac26ef24dca3fa4f6a323ef82')

prepare() {
    # the main executable file
    src='#!/usr/bin/env sh
path="/usr/lib/worksnaps/bin/run.sh"
script=$(realpath "$path")
cd $(dirname "$script")
exec "$script"'
    filename="$srcdir/worksnaps"
    echo "$src" > "$filename"
    chmod a+rx "$filename"
    # make sure everybody has access to the files
    chmod a+r "$srcdir" --recursive
    # worksnaps requires write access to the sh files, thats unsafe but otherwise a java exception is thrown
    find "$srcdir" -type f -name "*.sh" -exec chmod a+rwx {} \; 
}

package() {
    mkdir -p "$pkgdir/usr/lib"
    cp -r --preserve=mode,timestamps "$srcdir/Worksnaps" "$pkgdir/usr/lib/worksnaps"
    mkdir -p "$pkgdir/usr/bin"
    cp -r --preserve=mode,timestamps "$srcdir/worksnaps" "$pkgdir/usr/bin/worksnaps"
}
