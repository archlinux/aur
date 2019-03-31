# Maintainer: Christoph Bayer <chrbayer@criby.de>
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=wiredtiger
pkgver=3.1.1.20190325
_commit=67066a329d365cb1de6e198184016d4a9d280679
pkgrel=1
pkgdesc="High performance, scalable, production quality, NoSQL, Open Source extensible platform for data management"
arch=('x86_64')
url="http://source.wiredtiger.com/"
license=('GPL')
depends=('snappy' 'lz4' 'zlib' 'gperftools')
makedepends=('aspell-en')
source=("$pkgname-$_commit.tar.gz::https://github.com/wiredtiger/wiredtiger/archive/$_commit.tar.gz")
sha512sums=('5e884800ae8b085683a9f8dfbace52c54170efa2b60ac42b87aacd3929a858b1299adf3188c67f3bbc81e7750f4e5ccb42e3e4575abf933610a8dd318d7886a7')

prepare() {
  mv wiredtiger-{$_commit,$pkgver}
  sed -i 's/print\(.*\)$/print(\1)/' ${srcdir}/wiredtiger-${pkgver}/dist/wtperf_config.py
  sed -i 's/\\n/^^/g' ${srcdir}/wiredtiger-${pkgver}/src/docs/Doxyfile
}

build() {
  cd wiredtiger-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-leveldb \
              --enable-lz4 \
              --enable-tcmalloc \
              --enable-verbose \
              --with-builtins=snappy,zlib
  make
}

check() {
  cd wiredtiger-$pkgver
  make test
}

package() {
  cd wiredtiger-$pkgver
  make DESTDIR="$pkgdir" install
}
