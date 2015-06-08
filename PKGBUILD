# Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=geneticinvasion
pkgver=0.5.2
pkgrel=1
pkgdesc="A Tower Defence game that uses evolutionary algorithm"
arch=('i686' 'x86_64')
url="http://projects.haxx.es/p/genetic-invasion"
license=('GPL')
depends=('libeo' 'mesa')
makedepends=('make' 'cmake')
conflicts=()
if test "$CARCH" == 'i686'; then
    sfml_arch=32
else
    sfml_arch=64
fi
source=("http://projects.haxx.es/media/upload/genetic-invasion/files/genetic-invasion-v$pkgver.zip" "http://downloads.sourceforge.net/sfml/SFML-1.6-sdk-linux-$sfml_arch.tar.gz" 'FindSFML.cmake')
if test "$sfml_arch" == "32"; then
    md5sums=('a9b3b6e128170afb167a45616d6ea022' 
             'acc678933c19558587aad8332ea6f459' 
             'f6358382450150804d773a1d0b0777db')
else
    md5sums=('a9b3b6e128170afb167a45616d6ea022' 
             '7a9b3a1ef6d14cd25090e440ccdbb3a8'
             'f6358382450150804d773a1d0b0777db')
fi

build() {
    cd $srcdir/SFML-1.6/
    sed -i "24i#define NULL 0" include/SFML/System/ResourcePtr.inl
    make STATIC=yes
    sed -i "24d" include/SFML/System/ResourcePtr.inl
    
    cd $srcdir/genetic-invasion-v$pkgver
    cp $srcdir/FindSFML.cmake $srcdir/genetic-invasion-v$pkgver/cmake/modules
	cmake -DCMAKE_BUILD_TYPE=Release -DSFML_STATIC=true -DSFMLDIR=../SFML-1.6 -DCMAKE_INSTALL_PREFIX=/usr .
	make
	make install DESTDIR=$pkgdir
}
