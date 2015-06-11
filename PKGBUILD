# Original Maintainer: Eugen Zagorodniy <https://github.com/ezag>
# Maintainer: Henry de Valence <hdevalence@hdevalence.ca>
# This package was adapted from the libkml package with minimal changes.

pkgname=libkml-git
pkgver=r742.9b50572
pkgrel=3
pkgdesc="A KML library written in C++ with bindings to other languages"
arch=(i686 x86_64)
url="https://github.com/google/libkml"
license=('BSD')
depends=('expat' 'uriparser')
makedepends=('git')
optdepends=('swig: bindings for additional languages'
            'python2: python bindings'
            'jdk: java bindings')
# TODO: Use existing minizip package instead of conflicting with it.
conflicts=('minizip' 'libkml')
provides=('minizip' 'libkml')
source=('libkml'::'git://github.com/google/libkml.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/libkml
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/libkml
  
  ./autogen.sh

  # '--Wno-long-long' works around warning (with -Wall treated as error)
  # in 'third_party/boost_1_34_1/boost/config/suffix.hpp', lines 435-436.
  #
  # '--no-as-needed' works around 'undefined reference' errors in
  # 'examples/helloworld'.
  #
  # Add --disable-python or --disable-java to configure flags if your
  # system doesn't have corresponding language.

  CXXFLAGS+=' -Wno-long-long -O2 ' LDFLAGS+=-Wl,--no-as-needed PYTHON=python2 \
  ./configure --prefix=/usr --enable-systempython \
              --with-python-include-dir=/usr/include/python2.7 \
              --with-python-lib-dir=/usr/lib/python2.7

  # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=667247
  sed -i '34i #include <unistd.h>' src/kml/base/file_posix.cc

  make 

  # TODO: Use installed packages instead of contents of third_party
  # directory if possible.

  # TODO: Either fix 'WARNING: Package contains reference to $srcdir' or
  # ensure that it is harmless.
}

package() {
  cd libkml
  make DESTDIR="$pkgdir/" install
  # TODO: Remove uriparser sources before building and use existing package.
  rm "$pkgdir/usr/lib/liburiparser."{{,l}a,so{,.1{,.0.5}}}
  mkdir -p "$pkgdir/share/licenses/$pkgname"
  cp COPYING "$pkgdir/share/licenses/$pkgname/"
}
