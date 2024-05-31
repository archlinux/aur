# Maintainer: gilcu3
# This PKGBUILD is highly experimental and works on my Intel i7 setup
# It is not setup to produce any other targets and not yet tested on more than
# my own system.
# I have made small fixes to the AMD K8 assembly code not yet submitted upstream.
# No guarantees.
# Past Maintainer: K. Hampf <khampf@users.sourceforge.net>

pkgbase=ggnfs-svn
pkgname=('ggnfs-lasieve4e-x86_64-svn' 'ggnfs-svn')
pkgver=441
pkgrel=5
pkgdesc="GGNFS is an open source implementation of General Number Field Sieve algorithm for factoring integers."
arch=('x86_64')
url="http://sourceforge.net/projects/ggnfs/"
license=('GPL2')
makedepends=('subversion' 'libgmp-static' 'texlive-basic' 'texlive-binextra' 'texlive-latex')
source=("ggnfs-code::svn://svn.code.sf.net/p/ggnfs/code/trunk"
	"makefile-lasieve4_64.patch"
	"lasieve4_64-athlon64-i7.patch"
    "printf.patch"
    "scripts.patch"
)
sha256sums=('SKIP'
            'a0265a78f87eb9e2c4add9d125d803af1892659c59103a794ecfc4ba9a8b87a6'
            '39018ea8dd0c65183038bdfb44eb58c87a5794f93982edb3866a5aab659939d7'
            '22f3fea0f7a17641f95ee372f9a723fb366d6a8337a59cbcdd70128c2d35f2bb'
            '11e4c4074292bb6dfb230809a961cb3c812ac30aa1e09fb842363e362d66bf3e')

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
  patch --forward -Np1 -i "$srcdir/makefile-lasieve4_64.patch"
  patch --forward -Np1 -i "$srcdir/lasieve4_64-athlon64-i7.patch"
  patch --forward -Np1 -i "$srcdir/printf.patch"
  patch --forward -Np1 -i "$srcdir/scripts.patch"
  # Provide our build flags, but let GGNFS-provided build flags override ours.
  # Still gives ExecStack/RELRO/PIE warnings about the lasieve executables,
  # although the flags are provided now, except for the assembly parts.
  CFLAGS+=" -fcommon"
  sed -i.orig -E \
    -e "s#-lgmp #/usr/lib/libgmp.a #" \
    -e "s#-lgmp\$#/usr/lib/libgmp.a#" \
    -e "s#^ *CFLAGS *= *#&$CFLAGS #" \
    -e "s#^ *LIBFLAGS *= *#&$LDFLAGS #" \
    -e 's/^ *GMP_BUG *=/#&/' \
    $(find src -name Makefile)
  sed -i.orig -e 's/^inline /static /' \
    src/fbgen.c src/experimental/lasieve4_64/fbgen.c
  cd "${srcdir}/${_svnmod}/src/experimental/lasieve4_64"
  if [ "$_lasieveL1bits" != "15" ]; then
    echo "Patching asm code for ${_lasieveL1bits}-bit L1 data cache ..."
    sed -i -e "s/#define L1_BITS 15/#define L1_BITS ${_lasieveL1bits}/" athlon64/siever-config.h
    sed -i -e "s/define(l1_bits,15)dnl/define(l1_bits,${_lasieveL1bits})dnl/" athlon64/ls-defs.asm
  fi
  ln -s "athlon64" "asm"
}

build() {
  cd "${srcdir}/${_svnmod}/src/experimental/lasieve4_64"
  make CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt -fexceptions         -Wp,-D_FORTIFY_SOURCE=3 -Wformat -Werror=format-security         -fstack-clash-protection -fcf-protection         -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -fcommon -O3 -march=native -mtune=native -funroll-loops -fstack-protector-strong -static -Wno-error=implicit-function-declaration -Wno-error=implicit-int -Wno-error=incompatible-pointer-types"
 cd "${srcdir}/${_svnmod}"
  make "$_ggnfstarget"
  cd doc/ggnfs-doc
  latexmk -pdf ggnfs-doc
  latexmk -c
}

package_ggnfs-lasieve4e-x86_64-svn() {
  pkgdesc="lasieve4e is a lattice siever for GGNFS by Jens Franke and T. Kleinjung."
  provides=('ggnfs-lasieve4e')
  conflicts=('ggnfs-lasieve4e')

  cd "${srcdir}/${_svnmod}"
  install -D -m755 -t "${pkgdir}/usr/bin" bin/gnfs-lasieve4I1?e
}

package_ggnfs-svn() {
  _pkgname="ggnfs"
  provides=('ggnfs')
  conflicts=('ggnfs')
  depends=('ggnfs-lasieve4e')
  optdepends=('gnuplot: For autogplot.sh'
              'bash: For autogplot.sh and tests'
              'make: For tests and contrib stuff'
              'perl: For factoring scripts')

  cd "${srcdir}/${_svnmod}"
  install -D -m755 -t "${pkgdir}/usr/share/${_pkgname}" bin/[^dg]*
  install -d -m755 "${pkgdir}/usr/share/doc"
  cp -RT doc "${pkgdir}/usr/share/doc/${_pkgname}"
  install -d -m755 "${pkgdir}/usr/share/${_pkgname}"
  cp -R bin/def-* contrib tests "${pkgdir}/usr/share/${_pkgname}"
  install -D -m755 -t "${pkgdir}/usr/bin/" tests/fact*.pl
  ln -sfT "../doc/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/doc"
  install -D -m644 -t "${pkgdir}/usr/share/licenses/$_pkgname" LICENSE
}

# vim:set ts=2 sw=2 et:
