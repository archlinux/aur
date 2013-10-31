# $Id$
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
pkgver=7.0.90
pkgrel=1
arch=('i686' 'x86_64')
url='http://mosek.com/'
license=('custom')

# XXX: Matlab is a dependency (libmex, libmat, etc.)
depends=('gcc-libs' 'java-environment' 'bash')

options=('!libtool' '!strip')

if test "$CARCH" == "x86_64"; then
  _mosekarch=linux64x86
  sha512sums=('eb895fa6314956e405d068fb8f2e84dc081192093af1856ffd25b31078fb0a303d8b78459ba020c7ae654d4073857b466c33b846d883e7f50f25701f93c23e80')
elif test "$CARCH" == "i686"; then
  _mosekarch=linux32x86
  sha512sums=('5dfc92d5fda0db2ab53296ab00f3ea9087b23a48ab5ac651faffd06a54ee437061d0564d30d18c945c4bc26bbdf8a359f8c9a659579961bf0a5dfb92daf8c2ed')
fi

source=("http://download.mosek.com/stable/7/mosektools${_mosekarch}.tar.bz2")

check() {
  cd "${srcdir}/"

  "mosek/7/tools/platform/${_mosekarch}/bin/mosek" -f
}

package() {
  cd "${srcdir}/"
 
  # Install binaries into /opt/mosek/7: 
  install -dm755                  "${pkgdir}/opt/mosek/7"
  cp -r mosek/7/.                 "${pkgdir}/opt/mosek/7/."

  # Symlink mosek:
  install -dm755                  "${pkgdir}/usr/bin"
  ln -s /opt/mosek/7/tools/platform/${_mosekarch}/bin/mosek \
                                  "${pkgdir}/usr/bin/mosek"

  # Symlink header file:
  install -dm755                  "${pkgdir}/usr/include"
  ln -s /opt/mosek/7/tools/platform/${_mosekarch}/h/mosek.h \
                                  "${pkgdir}/usr/include/mosek.h"

  # Symlink documentation, examples, and licenses:
  install -dm755                  "${pkgdir}/usr/share/doc/mosek"
  ln -s /opt/mosek/7/tools/examples \
                                  "${pkgdir}/usr/share/doc/mosek/examples"
  ln -s /opt/mosek/7/doc/html     "${pkgdir}/usr/share/doc/mosek/html"
  ln -s /opt/mosek/7/doc/pdf      "${pkgdir}/usr/share/doc/mosek/pdf"

  install -dm755                  "${pkgdir}/usr/share/licenses/mosek"
  ln -s /opt/mosek/7/license.pdf  "${pkgdir}/usr/share/licenses/mosek/license.pdf"

  # Symlink MATLAB toolbox:
  ln -s /opt/mosek/7/toolbox      "${pkgdir}/usr/share/doc/mosek/matlab"

  # Symlink Python modules:
  ln -s /opt/mosek/7/tools/platform/${_mosekarch}/python \
                                  "${pkgdir}/usr/share/doc/mosek/python"

}
