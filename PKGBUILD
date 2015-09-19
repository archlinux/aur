# Maintainer: Ronny Lorenz <ronny at tbi dot univie dot ac dot at>

pkgname=rnamicro
pkgver=1.1.4
pkgrel=1
pkgdesc="Distinguish miRNA precursor sequences from other (putative) non-coding RNAs"
arch=('x86_64' 'i686')
license=('Custom')
url="http://www.tbi.univie.ac.at/~jana/software/RNAmicro.html"
depends=('pcre')
optdepends=()
makedepends=()
provides=()
source=(http://www.bioinf.uni-leipzig.de/~jana/downloads/RNAmicro${pkgver}.tar
        buildfix.patch)
md5sums=( '85890a3731b39fd4f66a8368f2288491'
          'e68fd817f27938c4e11a1565d0c2ad59')

prepare() {
  cd "${srcdir}/RNAmicro${pkgver}"

  # remove shipped binaries
  rm -f RNAmicro svm.o

  # patch sources to build correctly and include newer version of libsvm
  patch -p1 < ../buildfix.patch
}

build() {
  cd "${srcdir}/RNAmicro${pkgver}"
  make || return 1
}

package() {
  cd "${srcdir}/RNAmicro${pkgver}"
  install -Dm755 RNAmicro "${pkgdir}/usr/bin/RNAmicro"

  # install example files
  for aln in examples/*.aln
  do
    install -Dm644 ${aln} "${pkgdir}/usr/share/${pkgname}/${aln}"
  done

  # install models
  for aln in models/*.model
  do
    install -Dm644 ${aln} "${pkgdir}/usr/share/${pkgname}/${aln}"
  done

  # install documentation
  install -Dm644 doku/shortDocu.pdf "${pkgdir}/usr/share/doc/${pkgname}/shortDocu.pdf"

}

