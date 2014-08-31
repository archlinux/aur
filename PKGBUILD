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
pkgver=7.0.0.128
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
  sha512sums=('fb0a3e96e5bba55fbf0289fe4a4f10b5feca760b2e96007167bcecbddf47b159a2961ba9a3cde5da5d59542da86c1b6b686ec38799828d6e7eb8d82fc610c39d')
elif test "$CARCH" == "i686"; then
  _mosekarch=linux32x86
  sha512sums=('9e64284d3e56608b15f181f58b282e3894940b6eb984d97fcdf5144611902fdb9d0253600beab6e75b19be5e7e5b52a1f6ca61b84ef2dc67937f465eb34b758b')
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
