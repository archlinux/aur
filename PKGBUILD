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
pkgver=7.1.0.53
pkgrel=1
arch=('i686' 'x86_64')
url='http://mosek.com/'
license=('custom')
epoch=1

# XXX: Matlab is a dependency (libmex, libmat, etc.)
depends=('gcc-libs' 'java-environment' 'bash')

options=('!libtool' '!strip')

if test "$CARCH" == "x86_64"; then
  _mosekarch=linux64x86
  sha512sums=('f53b8b8549283c42d2aa5e9f1e7aa9f3e0eb3607e8c64f5508ead86182a7b727bc8f2b188d15223dbdafd43e9333863c4db3bd043d6398be3f743dd4525e6f6c')
elif test "$CARCH" == "i686"; then
  _mosekarch=linux32x86
  sha512sums=('6d14b0147033790419b7f019d75049b0e18b73184a6296bda4c9c97681ad53ca908198412a548baad313d05ffc27796e6a7077a6b5841ea82a7009e72ebd0cb4')
fi

source=("http://download.mosek.com/stable/${pkgver}/mosektools${_mosekarch}.tar.bz2")

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
