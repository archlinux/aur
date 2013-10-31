# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 
# CSDP is a C library for Semidefinite Programming (SDP) retrieved from:
#   https://projects.coin-or.org/Csdp/
# From the above URL: ``CSDP is a library of routines that implements a 
# predictor corrector variant of the semidefinite programming algorithm 
# of Helmberg, Rendl, Vanderbei, and Wolkowicz. The main advantages of 
# this code are that it is written to be used as a callable subroutine, 
# it is written in C for efficiency, the code runs in parallel on shared 
# memory multi-processor systems, and it makes effective use of sparsity 
# in the constraint matrices.  CSDP has been compiled on many different 
# systems. The code should work on any system with an ANSI C Compiler 
# and BLAS/LAPACK libraries.'' (9/21/2013)
#
# Detailed description available in:
#   B. Borchers.  ``CSDP, A C Library for Semidefinite Programming.''
#   Optimization Methods and Software 11(1):613-623, 1999.

pkgname='coinor-csdp'
pkgdesc="A C library for Semidefinite Programming (SDP) by B. Borchers."
pkgver=6.1.1
pkgrel=3
arch=('i686' 'x86_64')
url='https://projects.coin-or.org/Csdp/'
license=('CPL')
depends=('blas' 'lapack')
makedepends=('lapack' 'blas')
options=('!libtool')
source=(http://www.coin-or.org/download/source/Csdp/Csdp-${pkgver}.tgz)
sha512sums=('ba5dc0faea223bad6293f131ee63daee0a395a6e84c76fe108dbbefb3ab0696b2a59f435766c78a2d22244801a9abda2719798cbfe30dd9e1c32317e0283fd2e')

build() {
  cd "${srcdir}/Csdp-${pkgver}"

  make
}

check() {
  cd "${srcdir}/Csdp-${pkgver}"

  make unitTest
}

package() {
  cd "${srcdir}/Csdp-${pkgver}"
  
  # XXX: Since Csdp's make install doesn't honor DESTDIR, the below is copied
  # and modified from Csdp-$pkgver/Makefile:
  install -dm755                  "${pkgdir}/usr/bin"
  install -m755 solver/csdp       "${pkgdir}/usr/bin"
  install -m755 theta/theta       "${pkgdir}/usr/bin"
  install -m755 theta/graphtoprob "${pkgdir}/usr/bin"
  install -m755 theta/complement  "${pkgdir}/usr/bin"
  install -m755 theta/rand_graph  "${pkgdir}/usr/bin"
  # end of make install

  # Install static library:
  install -dm755                  "${pkgdir}/usr/lib"
  install -m644 lib/libsdp.a      "${pkgdir}/usr/lib"
  
  # Install header files:
  install -dm755                  "${pkgdir}/usr/include/coinor-csdp"
  cp -r include/.                 "${pkgdir}/usr/include/coinor-csdp/."

  # Install documentation:
  install -dm755                  "${pkgdir}/usr/share/doc/coinor-csdp"
  install -m644 example/example.c "${pkgdir}/usr/share/doc/coinor-csdp"
  install -m644 LICENSE           "${pkgdir}/usr/share/doc/coinor-csdp"
  install -m644 AUTHORS           "${pkgdir}/usr/share/doc/coinor-csdp"
  install -m644 README            "${pkgdir}/usr/share/doc/coinor-csdp"
  install -m644 INSTALL           "${pkgdir}/usr/share/doc/coinor-csdp"
  install -m644 doc/csdpuser.pdf  "${pkgdir}/usr/share/doc/coinor-csdp"
  
  # Install MATLAB toolbox:
  install -dm755                  "${pkgdir}/usr/share/doc/coinor-csdp/matlab"
  cp -r matlab/.                  "${pkgdir}/usr/share/doc/coinor-csdp/matlab/."
  
  # Install LICENSE file:
  install -dm755                  "${pkgdir}/usr/share/licenses/coinor-csdp/"
  ln -s /usr/share/doc/coinor-csdp/LICENSE "${pkgdir}/usr/share/licenses/coinor-csdp/LICENSE"
 
}
