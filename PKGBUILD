# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=libosl-svn
pkgver=r4545
pkgrel=6
pkgdesc="Library for Shogi (Japanese chess) playing programs"
arch=('i686' 'x86_64')
url="http://gps.tanaka.ecc.u-tokyo.ac.jp/gpsshogi/index.php?OpenShogiLib"
license=('custom')
groups=('lib')
install=libosl.install
depends=('gcc-libs')
checkdepends=('boost-libs' 'boost')
source=("osl-$pkgver.tar.gz::http://gps.tanaka.ecc.u-tokyo.ac.jp/cgi-bin/viewvc.cgi/trunk/osl/?view=tar"
'gpsshogi-data.tar.gz::http://gps.tanaka.ecc.u-tokyo.ac.jp/cgi-bin/viewvc.cgi/trunk/gpsshogi/data/?root=gpsshogi&view=tar'
'osl-public-data.tar.gz::http://gps.tanaka.ecc.u-tokyo.ac.jp/cgi-bin/viewvc.cgi/data/?view=tar'
'makefile.local'
'core_Makefile.patch'
'std_Makefile.patch'
'full_Makefile.patch'
'libosl.profile'
'makefile.conf.patch'
)
noextract=('osl-public-data.tar.gz')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'f75edb453159d5b5909bbf401a7b702d'
         'f54110982f81b762c48750bf31ea9df5'
         '38cadc15fda95422bf6b5a39e2d09b4d'
         'f365bfc6e30280c5feb5246cd109fad3'
         '42c4a9517f368adf9000a1560f2eb786'
         '312fa2c075d172fe8d011c57fe9d88e0')

pkgver() {
 curl -s 'http://gps.tanaka.ecc.u-tokyo.ac.jp/cgi-bin/viewvc.cgi/trunk/osl/' |\
  sed -n -e 's/^.*Revision \([0-9]*\).*$/r\1/p'
}

prepare() {
  cd "$srcdir"/osl
  cp "$srcdir"/makefile.local .
  patch --verbose -i $srcdir/makefile.conf.patch
  cd ./std/osl
  patch --verbose -i $srcdir/std_Makefile.patch
  cd ../../full/osl
  patch --verbose -i $srcdir/full_Makefile.patch  
  cd ../../core/osl
  patch --verbose -i $srcdir/core_Makefile.patch
}

build() {
  cd "$srcdir"/osl
  make OSL_PUBLIC_RELEASE=t OSL_HOME_FLAGS=-DOSL_HOME=\\\"/usr/share/osl\\\"
}

check() {
  cd "$srcdir"/data
  [ ! -d public-data ] && mkdir public-data
  tar xfz "$srcdir"/osl-public-data.tar.gz --strip-components=1 -C public-data
  cd "$srcdir"/osl
  for i in core std full; do
    cd "$srcdir/osl/$i/osl" && ln -sf libosl_$i.so.1.0 libosl_$i.so.1 && ln -sf libosl_$i.so.1.0 libosl_$i.so
  done
  for i in core std full; do
    cd "$srcdir/osl/$i/test"
    make
    env LD_LIBRARY_PATH=../../std/osl:../../core/osl:../../full/osl \
        GPSSHOGI_HOME= \
	OSL_HOME="$srcdir" \
	OSL_TEST_PUBLIC="$srcdir"/data/public-data\
	OSL_TEST=$srcdir \
	./testAll
  done
}

package() {
  install -Dm755 $srcdir/libosl.profile ${pkgdir}/etc/profile.d/libosl.sh
  install -Dm644 $srcdir/osl/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/osl/makefile.local $pkgdir/usr/share/osl/makefile.local
  install -Dm644 $srcdir/osl/makefile.conf $pkgdir/usr/share/osl/makefile.conf
  mkdir -m755 -p "$pkgdir"/usr/include/osl
  mkdir -m755 -p "$pkgdir"/usr/lib
  mkdir -m755 "$pkgdir"/usr/share/osl/public-data
  tar xfz "$srcdir"/osl-public-data.tar.gz --strip-components=1 -C "$pkgdir"/usr/share/osl/public-data
  cd "$srcdir"/osl
  for i in std core full; do
    install -m755 "$srcdir/osl/$i/osl/libosl_$i.so.1.0" "$pkgdir"/usr/lib/
    cd "$pkgdir"/usr/lib 
    ln -sf libosl_$i.so.1.0 libosl_$i.so.1
    ln -sf libosl_$i.so.1.0 libosl_$i.so    
    cd "$pkgdir"/usr/share/osl && ln -sf ../../include/osl/$i $i
  done
  cd "$srcdir"/osl &&
    find core/osl std/osl full/osl -type f -iregex '.*\.\(tcc\|h\)$'| \
      tar cT - | tar xf - -C "$pkgdir/usr/include/osl"
}
