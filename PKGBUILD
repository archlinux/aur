# $Id: ff2dae5d6715bf31a3852a3b84a0fac2112e2d45 $
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
# 
# From the MOSEK website, http://mosek.com/introduction/ :
#   ``MOSEK is a tool for solving mathematical optimization problems.  Some
#   examples of problems MOSEK can solve are linear programs, quadratic
#   programs, conic problems, and mixed integer problems [...]''

pkgname='mosek'
pkgdesc="A tool for solving mathematical optimization problems."
_majver=8
pkgver=${_majver}.1.0.31
pkgrel=1
arch=('x86_64')
url='http://mosek.com/'
license=('custom')
epoch=1
# XXX: Matlab is a dependency (libmex, libmat, etc.)
depends=('gcc-libs' 'java-environment' 'bash')
options=('!libtool' '!strip')

_mosekarch=linux64x86
sha512sums=('329a04b6be83b537dc7e0d4c2ebf3e1aebc4b368d6a89a64de33037ef71a2b6c54bb9dc9a1a08cc5ed0337e45297dde7a155ed897fbe334423b5f2d334f45ddb')

source=("http://download.mosek.com/stable/${pkgver}/mosektools${_mosekarch}.tar.bz2")

check() {
  cd "${srcdir}/"

  "mosek/${_majver}/tools/platform/${_mosekarch}/bin/mosek" -f
}

package() {
  cd "${srcdir}/"
 
  # Install binaries into /opt/mosek/7: 
  install -dm755                  "${pkgdir}/opt/mosek/${_majver}"
  cp -r mosek/${_majver}/.                 "${pkgdir}/opt/mosek/${_majver}/."

  # Symlink mosek:
  install -dm755                  "${pkgdir}/usr/bin"
  ln -s /opt/mosek/${_majver}/tools/platform/${_mosekarch}/bin/mosek \
                                  "${pkgdir}/usr/bin/mosek"

  # Symlink header file:
  install -dm755                  "${pkgdir}/usr/include"
  ln -s /opt/mosek/${_majver}/tools/platform/${_mosekarch}/h/mosek.h \
                                  "${pkgdir}/usr/include/mosek.h"

  # Symlink documentation, examples, and licenses:
  install -dm755                  "${pkgdir}/usr/share/doc/mosek"
  ln -s /opt/mosek/${_majver}/tools/examples \
                                  "${pkgdir}/usr/share/doc/mosek/examples"
  ln -s /opt/mosek/${_majver}/doc/html     "${pkgdir}/usr/share/doc/mosek/html"
  ln -s /opt/mosek/${_majver}/doc/pdf      "${pkgdir}/usr/share/doc/mosek/pdf"

  install -dm755                  "${pkgdir}/usr/share/licenses/mosek"
  ln -s /opt/mosek/${_majver}/license.pdf  "${pkgdir}/usr/share/licenses/mosek/license.pdf"

  # Symlink MATLAB toolbox:
  ln -s /opt/mosek/${_majver}/toolbox      "${pkgdir}/usr/share/doc/mosek/matlab"

  # Symlink Python modules:
  ln -s /opt/mosek/${_majver}/tools/platform/${_mosekarch}/python \
                                  "${pkgdir}/usr/share/doc/mosek/python"

}
