# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# contributor: tantalum <tantalum at online dot de>
pkgname=guile1.8-lib
pkgver=0.2.2
pkgrel=4
pkgdesc='Repository of useful code written in Guile Scheme'
arch=(i686 x86_64)
license=("GPL3 and LGPL3")
depends=(guile1.8)
conflicts=(guile-lib)
url=http://www.nongnu.org/guile-lib/
source=("https://download-mirror.savannah.gnu.org/releases/${pkgname//1.8/}/old/${pkgname//1.8/}-$pkgver.tar.gz"
        guile-1.8.patch)
sha256sums=('8bc0083c43923c08cbccee4aa07405e601f1ccfd667a1be5a7e5e4b2ca1236b9'
            '82c6e1054687c8f224d938c04c2940adebad66980c03df4355c3194f2b5595e1')
build(){

 cd ${srcdir}/${pkgname//1.8/}-${pkgver}

 sed -i "s%exec guile %exec guile1.8 %g" doc/*.scm
 
 patch -Np0 -i "$srcdir/guile-1.8.patch"
 aclocal -I m4
 libtoolize --automake --copy
 autoconf
 automake --copy --add-missing --gnu
 
 ./configure --prefix=/usr || return 1
 make || return 1
}

package() {
 cd ${srcdir}/${pkgname//1.8/}-${pkgver}
 make DESTDIR=${pkgdir} install || return 1
 cd ${pkgdir}/usr

 #remove documentation
 if [ -e ${pkgdir}/usr/share/info/dir ]; then
  rm ${pkgdir}/usr/share/info/dir
 fi
}
