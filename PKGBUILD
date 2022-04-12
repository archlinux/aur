pkgname="jabcode-git"
pkgver=r39.e342b64
pkgrel=1
pkgdesc='JABCode - just another barcode. color bar code'
arch=('i686' 'x86_64')
url='https://github.com/jabcode/jabcode'
makedepends=('python-setuptools')
depends=('libpng' 'libzip')
license=('LGPL')
source=('git+https://github.com/jabcode/jabcode.git')
md5sums=('SKIP')

pkgver() {
  cd jabcode
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    sed -i "s#-L../jabcode/lib##g" "${srcdir}/jabcode/src/jabcodeWriter/Makefile"
    sed -i "s#-L../jabcode/lib##g" "${srcdir}/jabcode/src/jabcodeReader/Makefile"
}

build() {
    cd "$srcdir/jabcode"
    cd src/jabcode
    msg2 "Building library"
    make
    cd ../jabcodeWriter
    msg2 "Building writer"
    make
    cd ../jabcodeReader
    msg2 "building reader"
    make
}

package() {
    cd "$srcdir/jabcode"
    install -Dm755 src/jabcodeWriter/bin/jabcodeWriter "$pkgdir/usr/bin/jabcodeWriter"
    install -Dm755 src/jabcodeReader/bin/jabcodeReader "$pkgdir/usr/bin/jabcodeReader"
    install -Dm644 src/jabcode/build/libjabcode.a "$pkgdir/usr/lib/jabcode/libjabcode.a"
}
