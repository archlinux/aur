# Maintainer: Guillaume Horel 
# Contributor: Byron Clark <byron@theclarkfamily.name>

pkgname=thrift-static
pkgver=0.12.0
pkgrel=1
pkgdesc='Scalable cross-language services framework for IPC/RPC'
arch=('x86_64')
url='http://thrift.apache.org/'
license=(APACHE)
depends=(gcc-libs openssl)
makedepends=(boost flex libevent emacs)
conflicts=('thrift')
provides=('thrift')
options=(staticlibs)
source=(thrift-$pkgver.zip::https://github.com/apache/thrift/archive/$pkgver.zip)
sha256sums=('df776e03de15b4ca8abfe8077e6c9b8a09f2e8774d29f37673941549be4ea873')

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
