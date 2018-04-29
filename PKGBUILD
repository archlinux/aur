# Contributer: giacomogiorgianni@gmail.com 

pkgname=boomaga
name=Boomaga
pkgver=1.3.0
_name=boomaga
pkgrel=1
pkgdesc="Is a virtual printer for viewing a document before printing it out using the physical printer"
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/p/1152844/"
license=('LGPL')
depends=('kdebase-runtime' 'ghostscript' 'snappy' 'poppler>=0.58')
makedepends=('cmake' 'gcc')
options=(!emptydirs)

source=(https://github.com/Boomaga/${pkgname}/archive/v${pkgver}.tar.gz poppler0.58.patch)
#source="${pkgname}-${pkgver}.tar.gz::https://github.com/Boomaga/${pkgname}/archive/v${pkgver}.tar.gz" 

md5sums=('a2176489b343f6bd1813a82a4ff9a8cb')

prepare() {
   cd $_name-$pkgver
   patch -Np1 -i ../poppler0.58.patch
}

build() {
   cd $srcdir/$pkgname-$pkgver
    if [ -d build ] ; then
        rm build/* -rf
    else
        mkdir build
    fi
    cd build
   cmake -DCMAKE_INSTALL_PREFIX=/usr .. 
   make 
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/build
  make DESTDIR="$pkgdir/" install
  install -D -m755 $srcdir/$pkgname-$pkgver/scripts/installPrinter.sh ${pkgdir}/usr/bin/
   
  #if [ 'pacman -Q poppler | tr -s " "|cut -d" " -f2 | sed 's/..$//'' = '0.28.1' ]; then
  #    ln -s "/usr/lib/libpoppler.so" "${pkgdir}/usr/liblibpoppler.so.46.0.0" || return 1
  #fi 
}
md5sums=('412769d55f72afc6a646a00725274b1a'
         '781dd4766689c5fb765ecf76845facc4')
