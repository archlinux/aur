# This PKGBUILD is highly experimental and works on my Intel i7 setup
# It is not setup to produce any other targets and not yet tested on more than
# my own system.
# I have made small fixes to the AMD K8 assembly code not yet submitted upstream.
# No guarantees.
# Maintainer: K. Hampf <khampf@users.sourceforge.net>

pkgbase=ggnfs-svn
pkgname=('ggnfs-lasieve4e-x86_64-svn' 'ggnfs-svn')
pkgver=441
pkgrel=1
pkgdesc="GGNFS is an open source implementation of General Number Field Sieve algorithm for factoring integers."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/ggnfs/"
license=('GPL2')
makedepends=('subversion')
source=("ggnfs-code::svn://svn.code.sf.net/p/ggnfs/code/trunk"
	"makefile-lasieve4_64.patch"
	"lasieve4_64-athlon64-i7.patch")
sha256sums=('SKIP'
            'a0265a78f87eb9e2c4add9d125d803af1892659c59103a794ecfc4ba9a8b87a6'
            '39018ea8dd0c65183038bdfb44eb58c87a5794f93982edb3866a5aab659939d7')

_svnmod=ggnfs-code
_ggnfstarget="nocona" # Works on Intel i7. YMMW
_lasieveL1bits="15" # default is 15 bits = 32 KB L1 data cache, 14 bits = 16 KB

pkgver() {
  cd "${srcdir}/${_svnmod}"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}/${_svnmod}"
  patch -p1 < "$srcdir/makefile-lasieve4_64.patch"
  patch -p1 < "$srcdir/lasieve4_64-athlon64-i7.patch"
  cd "${srcdir}/${_svnmod}/src/experimental/lasieve4_64"
  if [ "$_lasieveL1bits" != "15" ]; then
    echo "Patching asm code for ${_lasieveL1bits}-bit L1 data cache ..."
    sed -i -e "s/#define L1_BITS 15/#define L1_BITS ${_lasieveL1bits}/" athlon64/siever-config.h
    sed -i -e "s/define(l1_bits,15)dnl/define(l1_bits,${_lasieveL1bits})dnl/" athlon64/ls-defs.asm
  fi
  ln -s "athlon64" "asm"
}

build() {
  msg "Starting ggnfs-lasieve4e-${CARCH}-svn build..."
  cd "${srcdir}/${_svnmod}/src/experimental/lasieve4_64"
  make
  msg "Starting ggnfs-svn build..."
  cd "${srcdir}/${_svnmod}"
  make "$_ggnfstarget"
}

package_ggnfs-lasieve4e-x86_64-svn() {
  pkgdesc="lasieve4e is a lattice siever for GGNFS by Jens Franke and T. Kleinjung."
  arch=('x86_64')
  provides=('ggnfs-lasieve4e')
  conflicts=('ggnfs-lasieve4e')

  cd "${srcdir}/${_svnmod}"
#  install -D -m755 src/experimental/lasieve4_64/gnfs-lasieve4I1?e "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/bin"
  install -D -m755 bin/gnfs-lasieve4I1?e "${pkgdir}/usr/bin"
}

package_ggnfs-svn() {
  arch=('i686' 'x86_64')	# select ggnfs target other than nocona
  provides=('ggnfs')
  conflicts=('ggnfs')
  depends=('ggnfs-lasieve4e')
  optdepends=('gnuplot')

  cd "${srcdir}/${_svnmod}"
  install -d -m755 "${pkgdir}/usr/bin"
  install -D -m755 bin/autogplot.sh "${pkgdir}/usr/bin"
  install -D -m755 bin/makefb "${pkgdir}/usr/bin"
  install -D -m755 bin/matbuild "${pkgdir}/usr/bin"
  install -D -m755 bin/matprune "${pkgdir}/usr/bin"
  install -D -m755 bin/matsolve "${pkgdir}/usr/bin"
  install -D -m755 bin/pol51m0b "${pkgdir}/usr/bin"
  install -D -m755 bin/pol51m0n "${pkgdir}/usr/bin"
  install -D -m755 bin/pol51opt "${pkgdir}/usr/bin"
  install -D -m755 bin/polyselect "${pkgdir}/usr/bin"
  install -D -m755 bin/procrels "${pkgdir}/usr/bin"
  install -D -m755 bin/sieve "${pkgdir}/usr/bin"
  install -D -m755 bin/sqrt "${pkgdir}/usr/bin"
  install -d -m755 "${pkgdir}/usr/share/${pkgname}"
  install -D -m644 bin/def-nm-params.txt "${pkgdir}/usr/share/${pkgname}"
  install -D -m644 bin/def-par.txt "${pkgdir}/usr/share/${pkgname}"
}

# vim:set ts=2 sw=2 et:
