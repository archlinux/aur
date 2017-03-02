# Maintainer: Heath Caldwell <mrbrobro at ftml dot net>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=tcptrace
pkgver=6.6.7
pkgrel=3
pkgdesc="A TCP dump file analysis tool"
arch=('i686' 'x86_64')
url="http://tcptrace.org/"
license=('GPL')
depends=('libpcap')
optdepends=(
  'tcpdump: for generating dumps'
  'gnuplot: for plotting graphs'
  'xplot: for plotting graphs'
)
source=(http://tcptrace.org/download/$pkgname-$pkgver.tar.gz
        ${pkgname}-${pkgver}_no_pcap_offline_read.patch)
md5sums=('68128dc1817b866475e2f048e158f5b9'
         'a2d757088f9a1d3d6dd102d569c76926')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/${pkgname}-${pkgver}_no_pcap_offline_read.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure
  sed -e "s|BINDIR = /usr/local/bin|BINDIR = ${pkgdir}/usr/bin|" -e "s|MANDIR = /usr/local/man/|MANDIR = ${pkgdir}/usr/share/man|" -i Makefile
  sed -e "s|-o bin -g bin| -o root -g root|" -i Makefile
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/xpl2gpl" \
    ${pkgdir}/usr/bin/xpl2gpl
}
