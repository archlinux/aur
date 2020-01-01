# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=gjdoc
pkgver=0.7.9
pkgrel=11
_gcjver=6.5.0
pkgdesc="GNU Classpath JavaDoc implementation"
arch=(i686 x86_64)
license=('GPL')
url="http://savannah.gnu.org/projects/classpath/"
makedepends=('fastjar' 'patchelf')
depends=("gcc6-gcj=${_gcjver}")
options=('!libtool' '!buildflags')
noextract=('antlr-2.7.7.jar')
#install=$pkgname.install
source=(http://ftp.gnu.org/gnu/classpath/${pkgname}-${pkgver}.tar.gz
	http://www.antlr2.org/download/antlr-2.7.7.jar)
md5sums=('24cade2efe22d5adefcbabb21f094803'
         'f8f1352c52a4c6a500b597596501fc64')

build() {
  cd $pkgname-$pkgver
  export JAVA_HOME=/usr/lib/jvm/java-1.5.0-gcj-1.5.0.0
  export CLASSPATH=${CLASSPATH:+$CLASSPATH:}$JAVA_HOME/lib
  ./configure --prefix=/usr --with-antlr-jar=${srcdir}/antlr-2.7.7.jar
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make || find . -type f -name '*.o' | while read f; do objcopy -L '_ZGr8_$_dummy' $f; done
  make GCJFLAGS='-g -O2 -fsource=1.3'
}
package() {
  cd $pkgname-$pkgver
  make DESTDIR=${pkgdir} install
  patchelf --set-rpath /usr/lib/gcc/${CARCH}-pc-linux-gnu/${_gcjver} \
	   ${pkgdir}/usr/bin/gjdoc
  install -dm755 ${pkgdir}${JAVA_HOME}/bin
  ln -sf ../../../../bin/gjdoc ${pkgdir}${JAVA_HOME}/bin/gjdoc
}

