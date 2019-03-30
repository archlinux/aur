# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=mozjpeg-git
pkgver=20190328
pkgrel=1
pkgdesc="A fork of libjpeg-turbo with jpgcrush built in."
url="https://github.com/mozilla/mozjpeg/"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=('git' 'nasm' 'cmake')
depends=()
source=('git+https://github.com/mozilla/mozjpeg.git')
md5sums=('SKIP')
_gitname=mozjpeg

provides=('libjpeg=8.0.2' 'turbojpeg' 'libjpeg-turbo')
conflicts=('libjpeg-turbo')

pkgver() {
    cd "$_gitname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build()
{
    cd "$_gitname"
    #autoreconf -fiv
    mkdir -p build
    cd build
    cmake ../ -DCMAKE_INSTALL_PREFIX=/usr/ \
        -DCMAKE_INSTALL_MANDIR=/usr/share/man \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DWITH_JPEG8=1
    make
}

# takes forever
#check()
#{
#    cd "$_gitname"
#    make test
#}

package() {
    cd "$_gitname/build"
    make DESTDIR="$pkgdir" docdir="/usr/share/doc/$pkgname" install
    # license?
    cd ..
    install -m644 jpegint.h "$pkgdir/usr/include"
}

