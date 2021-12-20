# Maintainer: Rémy Oudompheng <remy@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=latex2rtf
pkgver=2.3.18
pkgrel=1
pkgdesc="LaTeX to RTF converter"
arch=('x86_64')
url="http://latex2rtf.sourceforge.net/"
license=('GPL')
depends=('glibc' 'imagemagick' 'ghostscript')
makedepends=('texinfo' 'texlive-bin' 'texlive-plainextra')
checkdepends=('texlive-latexextra') # for a4wide package
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}a.tar.gz")
md5sums=('b984073a9481eae26760ce03015d0373')
sha1sums=('7fe41c82465921405bbbc6667694bf2731c7dfd1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr latex2rtf
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i 's,s/\\\\,s/\\\\\\,' test/bracecheck
  chmod u+x test/bracecheck
  RTFPATH="$PWD"/cfg make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install install-info
  chmod 755 "${pkgdir}/usr/bin/latex2png"
  sed -i -e 's|error "no input file specified"| echo "error: no input file specified"|' "${pkgdir}/usr/bin/latex2png"
}
