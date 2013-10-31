# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 
# From the l1_logreg website, http://www.stanford.edu/~boyd/l1_logreg/ :
#   ``l1_logreg is an implementation of the interior-point method for
#   l1-regularized logistic regression described in the paper, An Interior-Point
#   Method for Large-Scale l1-Regularized Logistic Regression.'' 
#     (Koh, Kim, Boyd. JMLR 8:1519-1555. July 2007.) (9/24/2013)


pkgbase='l1_logreg'
pkgname='l1_logreg'
true && pkgname=('l1_logreg' 'l1_logreg-docs')
pkgdesc="An implementation of the interprior-point method for L1-regularized logistic regression."
pkgver=0.8.2
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.stanford.edu/~boyd/l1_logreg/'
license=('GPL2')
depends=('blas' 'lapack')
makedepends=('blas' 'lapack' 'doxygen' 'texlive-core' 'texlive-bin')
options=('!libtool')
source=(http://www.stanford.edu/~boyd/l1_logreg/download/l1_logreg-0.8.2.tar.gz)
sha512sums=('3a4097035e6acad2ac6cc895fe18821ab7ca96ddf8cf5fc244eb09c48cad848db492ac3189678c9b6c9379fae46e72c2b91ced2a4c803b8a51fa9aa25365d41d')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  ./configure  
  make
  make doc
}

check() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  make check
}

package_l1_logreg() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # l1_logreg install target as of 0.8.2 doesn't install docs, etc.
  # So we'll just do its work for it! 
 
  # Install binaries:
  install -dm755                            "${pkgdir}/usr/bin"
  install -m755 src_c/l1_logreg_train       "${pkgdir}/usr/bin"
  install -m755 src_c/l1_logreg_classify    "${pkgdir}/usr/bin"
  install -m755 src_c/l1_logreg_regpath     "${pkgdir}/usr/bin"

  # Install documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/l1_logreg"
  install -m644 COPYING           "${pkgdir}/usr/share/doc/l1_logreg"
  install -m644 AUTHORS           "${pkgdir}/usr/share/doc/l1_logreg"
  install -m644 README            "${pkgdir}/usr/share/doc/l1_logreg"
  install -m644 NEWS              "${pkgdir}/usr/share/doc/l1_logreg"

  # Install Matlab files:
  install -dm755                  "${pkgdir}/usr/share/doc/l1_logreg/matlab"
  install -m644 util_m/*.m        "${pkgdir}/usr/share/doc/l1_logreg/matlab"

  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/l1_logreg"
  ln -s "/usr/share/doc/l1_logreg/COPYING" \
                                  "${pkgdir}/usr/share/licenses/l1_logreg/LICENSE"
}

package_l1_logreg-docs() {
  depends=('l1_logreg')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Install documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/l1_logreg/html"
  cp -r doc/html/.                "${pkgdir}/usr/share/doc/l1_logreg/html/." 

}
