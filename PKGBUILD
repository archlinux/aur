# Maintainer: envolution
# Contributor: Sick Codes <info at sick dot codes>
# Contributor: Daniel Meszaros <easimer@gmail.com>
# Contributor: Bastien Dejean <nihilhill@gmail.com>
# Contributor: solsTice d'Hiver <solstice.dhiver@gmail.com>
# Contributor: Prurigro
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=xar
_sourcetag='417.1'
pkgver=1.8.0.${_sourcetag}
pkgrel=1
pkgdesc='eXtensible ARchive format - apple fork'
arch=('i686' 'x86_64')
url='http://mackyle.github.io/xar/'
license=('BSD-3-Clause')
depends=('libxml2' 'openssl' 'bzip2' 'acl' 'zlib' 'glibc')
source=(
  "https://opensource.apple.com/tarballs/xar/xar-${_sourcetag}.tar.gz"
  xar-1.6.1-ext2.patch
  xar-1.8-safe_dirname.patch
  xar-1.8-arm-ppc.patch
  xar-1.8-openssl-1.1.patch
  xar-1.8-Add-OpenSSL-To-Configuration.patch
  xar-1.8-gnuconfig.patch
)
md5sums=('6ecc0692e3a88c78f40c42eddc7693b5'
         '04b9eb5f6fbaf1c12702055d73504972'
         'e6397fed703e6b48fbd641579a3e9387'
         '927d63d4b85199c2a7657aea4c06dee6'
         'f848f10c910b66b1a13567d7870160dc'
         'a02920653e485573fe5aedeac1319e52'
         'ee13c248fe580d92d3cc3391fefbdeb3')

prepare() {
  cd "${pkgname}-${pkgname}-${_sourcetag}/xar"
  patch -Np1 -i ../../xar-1.6.1-ext2.patch                       #Gentoo patch
  patch -Np1 -i ../../xar-1.8-safe_dirname.patch                 #Gentoo patch
  patch -Np1 -i ../../xar-1.8-arm-ppc.patch                      #Gentoo patch
  patch -Np1 -i ../../xar-1.8-openssl-1.1.patch                  #Gentoo patch
  patch -Np1 -i ../../xar-1.8-Add-OpenSSL-To-Configuration.patch #Fedora patch
  patch -Np1 -i ../../xar-1.8-gnuconfig.patch                    #Fedora patch
  sed 's:-Wl,-rpath,::g' -i configure.ac                         #No rpath
  sed 's:filetree.h:../lib/filetree.h:g' -i src/xar.c            #Fix path
  sed 's:util.h:../lib/util.h:g' -i src/xar.c                    #Fix path
  sed '0,/^#include /!b;//a #include <stdlib.h>' -i lib/ext2.c
}

build() {
  cd "${pkgname}-${pkgname}-${_sourcetag}/xar"
  NOCONFIGURE=1 ./autogen.sh \
    --prefix=/usr \
    --mandir=/usr/share/man
  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgname}-${_sourcetag}/xar"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et:
