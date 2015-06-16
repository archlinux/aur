# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Alexandros Konstantinakis - Karmis <el04092@users.ntua.gr>

pkgname=xgraph
pkgver=12.1
pkgrel=5
pkgdesc="X-Windows application for interactive plotting and graphing"
url="http://www.isi.edu/nsnam/xgraph/"
license=('custom')
arch=('i686' 'x86_64')
depends=('libx11' 'ttf-dejavu')
source=(http://www.isi.edu/nsnam/dist/"${pkgname}"-"${pkgver}".tar.gz
        gcc4.4.diff
        xgraph-12.1-replace-helvetica-with-dejavu.patch)
sha256sums=('0aa17d3fa3abfa8b6679fc26812a988332a2a0f1f48973d17429089015672b08'
            'cda2660d2c92b5dfe18571914364c1e4eccd1b35439fddcfe94be7321aafdfc9'
            '0eb5c0e591d637b9318065abd72b588a50aaa7cce7c772f286a4c4683f831a26')

prepare() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  patch -uNp1 -i ../gcc4.4.diff
  patch -uNp1 -i ../xgraph-12.1-replace-helvetica-with-dejavu.patch
}

build() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  unset CPPFLAGS # b0rken FORTIFY_SOURCE
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/"${pkgname}"-"${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "${pkgdir}"/usr/share/man/manm/"${pkgname}".man \
      "${pkgdir}"/usr/share/man/man1/"${pkgname}".1
  rm -r "${pkgdir}"/usr/share/man/manm

  install -Dm644 copyright.h \
      "${pkgdir}"/usr/share/licenses/"${pkgname}"/copyright.h
}

# vim:set ts=2 sw=2 et:
