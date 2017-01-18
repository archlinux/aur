# $Id$
# Maintainer: John Andersen <johnandersenpdx@gmail.com>

pkgname=cc-oci-runtime
pkgver=2.1.0
__postfix_ver="-rc.3"
pkgrel=1
pkgdesc="Intel Clear Containers runtime"
arch=(x86_64)
url="https://clearlinux.org"
license=('GPLv2')
makedepends=('go'
        'glib2'
        'libmnl'
        'json-glib'
        'check'
        'bash-bats'
        'gcc')
checkdepends=('valgrind')
source=(https://github.com/01org/cc-oci-runtime/archive/${pkgver}${__postfix_ver}.tar.gz)
sha1sums=('a0d3ec7afbdee60623eb2b1edc82f3615c6b767b')

build() {
  export GOPATH=$PWD
  mkdir -p "$GOPATH/src/github.com/01org/"
  rm -f "$GOPATH/src/github.com/01org/cc-oci-runtime"
  ln -s $PWD/$pkgname-${pkgver}${__postfix_ver} "$GOPATH/src/github.com/01org/cc-oci-runtime"
  cd "$GOPATH/src/github.com/01org/cc-oci-runtime"
  for i in $(ls "vendor/github.com/"); do
    rm -f "$GOPATH/src/github.com/$i"
    ln -s "$GOPATH/src/github.com/01org/cc-oci-runtime/vendor/github.com/$i" \
      "$GOPATH/src/github.com/$i"
  done
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$GOPATH/src/github.com/01org/cc-oci-runtime"
  # make check
}

package() {
  cd "$GOPATH/src/github.com/01org/cc-oci-runtime"
  make DESTDIR="$pkgdir/" install
}
