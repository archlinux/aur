# Maintainer: Darren Ng <$(base64 --decode <<<'VW4xR2ZuQGdtYWlsLmNvbQo=')>

pkgname=ldid-git
pkgver=2.1.2.r10.d4a4dbe
pkgrel=2
pkgdesc="a tool used for ad-hoc codesigning iOS binaries - saurik official"
arch=(x86_64)
url="https://git.saurik.com/${pkgname//-/.}"
license=(AGPL3)
depends=(
  libplist
  # libxml2
  openssl
)
makedepends=(git clang)
provides=(${pkgname%-git}{,2{,-git}})
conflicts=(${provides[*]})
# https://stackoverflow.com/questions/10909976/why-do-seemingly-empty-files-and-strings-produce-md5sums
source=('empty')
md5sums=('d41d8cd98f00b204e9800998ecf8427e')

prepare(){
  cd "$srcdir"
  rm -rf "${pkgname%-git}"
  echo -n "$url - "
  # https://stackoverflow.com/questions/23885449/unable-to-resolve-unable-to-get-local-issuer-certificate-using-git-on-windows
  # [Workaround] fatal: unable to access 'https://git.saurik.com/ldid.git/': SSL certificate problem: unable to get local issuer certificate
  # git -c http.sslVerify=false clone file:///tmp/ldid.git "${pkgname%-git}"
  git -c http.sslVerify=false clone "$url" "${pkgname%-git}"
}

pkgver(){
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//g')"
}

# https://git.saurik.com/ldid.git/blob/HEAD:/make.sh
# https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
# https://www.gnu.org/software/make/manual/html_node/Catalogue-of-Rules.html
build(){
cd "$srcdir/${pkgname%-git}"
cat <<"EOM" >Makefile
#
CC:=/bin/false
CXX:=/bin/false
CFLAGS:=$(CFLAGS) $(shell pkg-config --cflags libplist-2.0,libcrypto) # libxml-2.0
#
default: ldid
ldid: CC:=clang++
ldid: LDLIBS:=$(shell pkg-config --libs libplist-2.0,libcrypto) # libxml-2.0
ldid: ldid.o lookup2.o
#
%.o: CC:=clang
%.o: CXX:=clang++
ldid.o: ldid.cpp
lookup2.o: lookup2.c
#
EOM
make
}

package(){
  cd "$srcdir/${pkgname%-git}"
  install -vDm755 ldid "$pkgdir/usr/bin/ldid"
  ln -sfv "ldid" "$pkgdir/usr/bin/ldid2"
}
