# Maintainer: solaraquarion <shlomochoina@gmail.com>

pkgname=domterm-git
pkgver=2.1.r94.g40e9b1b
pkgrel=1
pkgdesc="Terminal emulator capable of display html and images from command output"
arch=('x86_64')
url=https://github.com/PerBothner/DomTerm
license=('BSD')
groups=()
conflicts=(qtdomterm)
makedepends=('git' 'vim' 'asciidoctor' 'zip' 'json-c')
depends=(file qt5-webengine qt5-webchannel libwebsockets java-runtime)
source=('git+https://github.com/PerBothner/DomTerm.git'
        'git+https://github.com/warmcat/libwebsockets')
md5sums=('SKIP'
         'SKIP')

pkgver(){
  cd "$srcdir"/DomTerm
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {

    cd "$srcdir"/libwebsockets
    mkdir build
    cd build
    cmake -DLWS_WITH_SSL=0 -DLWS_WITH_ZIP_FOPS=1 ..
    make
    cd "$srcdir"/DomTerm
    autoreconf -vfi
    ./configure --with-qtwebengine --with-libwebsockets="$srcdir"/libwebsockets/build --with-javafx --prefix=/usr
    make V=1
}

package() {
    cd "$srcdir"/DomTerm
    make install DESTDIR="$pkgdir"
    install -m 755 "$srcdir"/DomTerm/bin/{h,img,svg}cat "$pkgdir"/usr/bin
    mkdir -p $pkgdir/usr/share/licenses/$pkgname
    install -Dm755 COPYING $pkgdir/usr/share/licenses/$pkgname
}
