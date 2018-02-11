# Maintainer: Guillaume Horel 
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=thrift-static
pkgver=0.11.0
pkgrel=2
pkgdesc='Scalable cross-language services framework for IPC/RPC'
arch=(i686 x86_64)
url='http://thrift.apache.org/'
license=(APACHE)
depends=(gcc-libs openssl)
makedepends=(boost libevent emacs)
conflicts=('thrift')
provides=('thrift')
options=(staticlibs)
source=(thrift-$pkgver.zip::https://github.com/apache/thrift/archive/$pkgver.zip)
sha256sums=('c183e6337ae6d03a019c3581de71d3bd5c6fa92dfe1754398c402e3561d09f23')

build() {
  cd thrift-$pkgver

  ./bootstrap.sh
  CXXFLAGS+=" -fpic"
  ./configure --prefix=/usr \
              --with-cpp \
              --with-c_glib \
              --without-qt4 \
              --without-qt5 \
              --with-libevent \
              --without-haskell \
              --without-php \
              --without-ruby \
              --without-python \
              --without-erlang \
              --without-perl \
              --without-java \
              --without-c_sharp \
              --without-d \
              --without-php \
              --without-go \
              --without-lua \
              --without-nodejs \
              --without-rs
              
  make

  emacs -Q --batch -f batch-byte-compile contrib/thrift.el
}

check() {
  cd thrift-$pkgver
  make check
}

package() {
  cd thrift-$pkgver
  make DESTDIR="$pkgdir" install

  install -m0644 -D contrib/thrift.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/thrift.vim
  install -m0644 -D contrib/thrift.el "$pkgdir"/usr/share/emacs/site-lisp/thrift.el
  install -m0644 -D contrib/thrift.elc "$pkgdir"/usr/share/emacs/site-lisp/thrift.elc
}
