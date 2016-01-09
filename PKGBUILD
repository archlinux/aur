# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Jakub Luzny <limoto94@gmail.com>
pkgname=raknet-3.261
pkgver=3.261
pkgrel=1
pkgdesc="Cross platform C++ network library"
arch=('i686' 'x86_64')
url="http://www.jenkinssoftware.com/"
license=('custom')
conflicts=('raknet')
provides=("raknet=$pkgver")
source=(http://downloads.sourceforge.net/zeroballistics/external%20dependencies/src/raknet3.261.tar.gz
        newer.gcc.patch
        license.txt)
md5sums=('7df0cd95cab38a3854a8b5cec08eb47f'
         '8eba1bf14fb5ff9f6e4d809d797a5070'
         '6bd636fe028aac184c20b3a50d83cd79')


build() {
  # all of the Linux build system supplied by RakNet are broken
  # we'll make our own lib manually YEAAAAAAAHHHHHHHHH1!!!
  cd ${srcdir}/raknet${pkgver}/Source
	patch -p1 -i ${srcdir}/newer.gcc.patch
  msg "Hardcore static library compiling action"
  g++ -fpermissive -lpthread -c *.cpp
  msg "Hardcore static library archiving action"
  ar rc libraknet.a *.o
  
  msg "Hardcore shared library compiling action"
  g++ -fpermissive -fPIC -lpthread -shared -o libraknet.so *.cpp
}

package() {
  cd ${srcdir}/raknet${pkgver}/Source
  msg "Hardcore installation action"
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
  
  mkdir -p ${pkgdir}/usr/lib/
  cp libraknet.* ${pkgdir}/usr/lib/
  
  mkdir -p ${pkgdir}/usr/include/raknet/
  install -m644 *.h ${pkgdir}/usr/include/raknet/
  
#  msg "Hardcore cleaning action"
#  mkdir -p ${pkgdir}/usr/share/raknet/
#  cp -r ../Samples ${pkgdir}/usr/share/raknet/
#  find ${pkgdir}/usr/share/raknet/ -iname "*vcproj*" -delete
#  find ${pkgdir}/usr/share/raknet/ -exec chmod 644 '{}' \;
  msg "All done, YEAAAAAAAAHHHHHHHHHH1111!!!!"
} 
# vim: ts=2 sw=2
#category: lib
