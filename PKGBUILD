# Maintainer : doragasu <doragasu at hotmail dot com>
# Contributor: Original submitter speps <speps at aur dot archlinux dot org>

_pkg=p7zip
_ver=15.09
_commit=5bc54cab38656fd57df7736087ef6914ddb68c72
pkgname=lib7zip
pkgver=2.0.0
pkgrel=1
pkgdesc="A library using 7z.dll/7z.so(from 7-Zip) to handle different archive types."
arch=(i686 x86_64)
url="https://github.com/stonewell/lib7zip"
license=('MPL')
makedepends=('libtool')
options=('!libtool')
source=("https://github.com/stonewell/${pkgname}/archive/${_commit}.tar.gz"
        "http://downloads.sourceforge.net/project/${_pkg}/${_pkg}/${_ver}/${_pkg}_${_ver}_src_all.tar.bz2")
sha256sums=('4ec0975a2bbdbdddd4a34517d8b0ea7026abbecd621d4f72744b754bba521308'
            '8783acf747e210e00150f7311cc06c4cd8ecf7b0c27b4adf2194284cc49b4d6f')

prepare() {
    cd "$srcdir/$pkgname-$_commit"

    # point to p7zip source
    export P7ZIP_SOURCE_DIR="$srcdir/${_pkg}_${_ver}"

    sh autogen.sh
    rm -rf includes/{C,CPP}
    ./configure --disable-dependency-tracking --prefix=/usr
}

build() {
    cd "$srcdir/$pkgname-$_commit"
    make
}

package() {
    cd "$srcdir/$pkgname-$_commit"
    make DESTDIR="$pkgdir/" install

    # Remove tests
    rm -rf $pkgdir/usr/bin

    # Add header
    install -Dm644 Lib7Zip/$pkgname.h \
        "$pkgdir/usr/include/$pkgname.h"
}
