# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: blue_lizard lizard@blue.dyn-o-saur.com

pkgname=mmv
pkgver=1.01b.orig
pkgrel=4
pkgdesc="multiple move files (version with debian patches)"
source=(
  http://ftp.de.debian.org/debian/pool/main/m/mmv/mmv_1.01b.orig.tar.gz
  patches-as-of-mmv-1.01b-15.diff::'https://git.deb.at/w?p=pkg/mmv.git;a=blob_plain;f=debian/patches/patches-as-of-mmv-1.01b-15.diff;hb=528dcf4e01aa4736fa4d8bbda837bf4efb9c84c5'
  man-page-fixes.diff::'https://git.deb.at/w?p=pkg/mmv.git;a=blob_plain;f=debian/patches/man-page-fixes.diff;hb=528dcf4e01aa4736fa4d8bbda837bf4efb9c84c5'
  format-security.diff::'https://git.deb.at/w?p=pkg/mmv.git;a=blob_plain;f=debian/patches/format-security.diff;hb=528dcf4e01aa4736fa4d8bbda837bf4efb9c84c5'
  better-diagnostics-for-directories-584850.diff::'https://git.deb.at/w?p=pkg/mmv.git;a=blob_plain;f=debian/patches/better-diagnostics-for-directories-584850.diff;hb=528dcf4e01aa4736fa4d8bbda837bf4efb9c84c5'
  man-page-examples.diff::'https://git.deb.at/w?p=pkg/mmv.git;a=blob_plain;f=debian/patches/man-page-examples.diff;hb=528dcf4e01aa4736fa4d8bbda837bf4efb9c84c5'
  man-page-warning-149873.diff::'https://git.deb.at/w?p=pkg/mmv.git;a=blob_plain;f=debian/patches/man-page-warning-149873.diff;hb=528dcf4e01aa4736fa4d8bbda837bf4efb9c84c5'
)
sha256sums=('0399c027ea1e51fd607266c1e33573866d4db89f64a74be8b4a1d2d1ff1fdeef'
            '3fcfb270ae7385a192e11beb8dc36197377f221fb391b1440bbb0471670c4168'
            'b0cdc562d18abaa0aa2f667e26361de6d989b98759be7eddaf7312db90721172'
            '99fb73a1e52fe40ee98e48bf75a638194ace20712d57df1557add5526478e21b'
            '3decc3d5af65e8f879f4a65a86e4c927d5889056043473d0e12657f033e4cfac'
            '340b0cc901a8a6d90838c1e01212c392ca21a350cf3128195cfa2101f190861a'
            '4e6b7b85355d339bc2526d3afad4492def634e5311a514c2a324ca8d8eaaf52f')

url="http://linux.maruhn.com/sec/mmv.html"
license=('GPL')
install=$pkgname.install
arch=('i686' 'x86_64')

prepare() {
  cd "${srcdir}/$pkgname-$pkgver"
  patch -p1 < ../patches-as-of-mmv-1.01b-15.diff
  patch -p1 < ../man-page-fixes.diff
  patch -p1 < ../format-security.diff
  patch -p1 < ../better-diagnostics-for-directories-584850.diff
  patch -p1 < ../man-page-examples.diff
  patch -p1 < ../man-page-warning-149873.diff

  sed -i -e "s/LDFLAGS.\s=-s -N/LDFLAGS	=-s/g" Makefile
  sed -i 's!/usr/man!/usr/share/man!' Makefile
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  make
}

package(){
  cd "${srcdir}/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  make DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}/usr/share/man/man1/mmv.1"
  cd "${pkgdir}/usr/bin"
  ln -s mmv mcp
  ln -s mmv mad
  ln -s mmv mln
  cd "${pkgdir}/usr/share/man/man1/"
  ln -s mmv.1 mcp.1
  ln -s mmv.1 mad.1
  ln -s mmv.1 mln.1
}
