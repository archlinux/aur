# Submitter: Eugen Zagorodniy <https://github.com/ezag>
# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=libkml
pkgver=1.2.0
pkgrel=3
pkgdesc="A KML library written in C++ with bindings to other languages"
arch=(i686 x86_64)
url="https://github.com/google/libkml"
license=('BSD')
depends=('expat' 'uriparser')
optdepends=('swig: bindings for additional languages'
            'python2: python bindings'
            'jdk: java bindings')
# TODO: Use existing libminizip package instead of conflicting with it.
conflicts=('libminizip')
source=("https://github.com/kubark42/${pkgname}/archive/master.zip")
md5sums=('e5cae2b9ee6a652897a1f6e92fb094a4')

build() {
  cd "$srcdir/${pkgname}-master"

  # Add --disable-python or --disable-java to configure flags if your
  # system doesn't have corresponding language.

  ./autogen.sh

  ./configure --prefix=/usr --enable-systempython \
              --with-python-include-dir=/usr/include/python2.7 \
              --with-python-lib-dir=/usr/lib/python2.7              
  make -j5

}

package() {
  cd "$srcdir/${pkgname}-master"
  make DESTDIR="$pkgdir/" install
  # TODO: Remove uriparser sources before building and use existing package.
  rm "$pkgdir/usr/lib/liburiparser."{{,l}a,so{,.1{,.0.5}}}
  rm "$pkgdir/usr/lib/libminizip."{{,l}a,so{,.0}}
  mkdir -p "$pkgdir/share/licenses/$pkgname"
  cp COPYING "$pkgdir/share/licenses/$pkgname/"
}
