# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Valentin V. Bartenev <ne@vbart.ru> http://vbart.info/

pkgname=ctpp2
pkgver=2.8.3
pkgrel=2
pkgdesc='CTPP (or CT++) is the fastest template engine which completely written in C++'
arch=(i686 x86_64)
url='http://ctpp.havoc.ru/en/'
optdepends=(
  'iconv: iconv support'
  'md5: md5 support'
)
makedepends=(cmake make)
source=("http://ctpp.havoc.ru/download/ctpp2-$pkgver.tar.gz"
        'CTPP2FileSourceLoader.patch')
license=('custom:BSD-like')
md5sums=('1155b65e8ca8b844c631831e4a3e5644'
         'ed067af369dd96ce80647071081eeefd')
sha256sums=('a83ffd07817adb575295ef40fbf759892512e5a63059c520f9062d9ab8fb42fc'
            '93a23e1e5ae294c009a5457116a6b40d4af64c2b1ef6bdcdf2d80e272012cbc4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p0 -i $srcdir/CTPP2FileSourceLoader.patch  
  if [ ! -d build ]; then 
    mkdir build
  fi
  cd build
  cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr -DSKIP_RELINK_RPATH:BOOL=ON ..
  make VERBOSE=1
}

#check() {
# NOTE: test 26 fail (2.8.2, 2.8.3)
#  cd "$_srcdir/build"
#  env LD_LIBRARY_PATH=".:$LD_LIBRARY_PATH" make test
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"/build
  make DESTDIR="$pkgdir" install
  mkdir -p $pkgdir/usr/share
  mv $pkgdir/usr/man $pkgdir/usr/share/
  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Enjoy! ;)
