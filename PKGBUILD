# Maintainer: Alireza S.N. <alireza6677@gmail.com>
# Contributor: Heath Caldwell <mrbrobro at ftml dot net>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=tcptrace
pkgver=6.6.7
pkgrel=4
pkgdesc="A TCP dump file analysis tool"
arch=('i686' 'x86_64')
#url="http://tcptrace.org/"
license=('GPL-2.0-only')
makedepends=('gcc' 'make')
depends=('libpcap')
optdepends=(
  'tcpdump: for generating dumps'
  'gnuplot: for plotting graphs'
  'xplot: for plotting graphs'
)
source=(https://cloudfront.debian.net/debian-archive/debian/pool/main/t/tcptrace/tcptrace_6.6.7.orig.tar.gz
        https://cloudfront.debian.net/debian-archive/debian/pool/main/t/tcptrace/tcptrace_6.6.7-4.1.diff.gz) 
b2sums=('cae5816cb25c33f71c316d14de3c18ff26f0e7452375a962b88c4818ca7c43425e7298e788bd8cb43f2e22ac7dc9b89ed1921b7bd70d0e8befab3ee791453fb1'
        '83768d0a6f14525f20b484421181078a3cf7ac3adeada3cf02a7441530593632743c6e515dd8738f5a4692422d97f4eb718dda076a234489096a10defb97dd5f')

prepare() {
  cd ${pkgname}-${pkgver}

  patch -p1 -i "$srcdir/tcptrace_6.6.7-4.1.diff"
  sed -e "s|BINDIR = /usr/local/bin|BINDIR = ${pkgdir}/usr/bin|" \
      -e "s|MANDIR = /usr/local/man/|MANDIR = ${pkgdir}/usr/share/man|" \
      -e "s|-o bin -g bin| -o root -g root|" \
      -e "s|-g -Wall -O2|-g -Wall -O2 -std=gnu11|" -i Makefile.in
}

build() {
  cd ${pkgname}-${pkgver}

  ./configure
  make
}

package(){
  cd ${pkgname}-${pkgver}

  export DEB_BUILD_OPTIONS="nostrip"
  make install
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/xpl2gpl" \
    "${pkgdir}/usr/bin/xpl2gpl"
}

