# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

# Todo: fix (Anyptr)_OutMem() to be 64 bit safe and enable 64 bit compile
_opt_32bit=1

set -u
pkgname='p2c'
pkgver='2.01'
pkgrel='1'
pkgdesc='Pascal to C/C++ translator converter'
arch=('x86_64')
#url="http://packages.debian.org/sid/p2c"
#url='https://schneider.ncifcrf.gov/p2c/'
url='http://users.fred.net/tds/lab/p2c/'
license=('GPL')
depends=('perl')
if [ "${_opt_32bit}" -ne 0 ]; then
  depends+=('lib32-glibc')
  makedepends+=('lib32-gcc-libs')
fi
#  http://ftp.debian.org/debian/pool/main/p/p2c/p2c_${pkgver}-3.diff.gz)
#source=("http://www.ccrnp.ncifcrf.gov/~toms/p2c/p2c-${pkgver}.tar.gz")
#source=('https://alum.mit.edu/www/toms/p2c/p2c-2.01.tar.gz
_srcdir="${pkgname}-${pkgver}"
#source=("https://schneider.ncifcrf.gov/p2c/${_srcdir}.tar.gz")
source=("https://alum.mit.edu/www/toms/p2c/${_srcdir}.tar.gz")
source+=('0000-make-install.patch')
#options=('!strip')
md5sums=('6f08c45f1adcdc35789340834dd9c084'
         '3cf28ada6f5935e5ce7eb6515fd429ef')
sha256sums=('a05635e6b0b40bee9617771ba628deefae13369cd7d49bb880cc8590495fcf60'
            'a1dd6995cb13e87bbf6f707224c1a58fbebe9101aeccd7ba3aca0e760950773a')
_checkdir="${_srcdir}/check"

prepare() {
  set -u
  cd "${_srcdir}/src"

  #patch -Np2 -i '../p2c_${pkgver}-3.diff'
  #sed -e 's:getline:xgetline:' -i *.c *.hdrs

  # Add includes to get rid of some warnings
  sed -e '/^#include <stdio.h>/ a #include <stdlib.h>' -i 'makeproto.c'
  # expose conflicting declarations
  sed -e '/^#include "trans.h"/ i #include <unistd.h>' -i 'trans.c'
  # Switch to built in link,unlink declarations
  sed -e '/^int u*n*link / s:^.*$:/* & */:g' -i 'trans.h'

  # Remove supplied binaries
  rm -f 'makeproto' 'p2cc' 'libp2c.a'

  # The mess in make install is too big to fix with sed
  # cp -p Makefile{,.orig}; false
  # diff -pNau5 Makefile{.orig,} > '0000-make-install.patch'
  patch -Nbup0 -i "${srcdir}/0000-make-install.patch"

  local _ccc='#'
  if [ "${_opt_32bit}" -ne 0 ]; then
    _ccc=''
  fi
  # Make package compatible
  #cp -p Makefile{,.Arch}
  sed -e '#Switch from private to public build' \
      -e '/private version/,/^$/ s:^[A-Z]:#&:g' \
      -e '/public version/,/^$/ s:^#\([A-Z]\):\1:g' \
      -e '# Fix MANDIR' \
      -e '/^MANDIR =/ s:/usr/:&share/:g' \
      -e '#Add DESTDIR' \
      -e '/^install:/,/^$/ s:\$([A-Z]\+DIR):$(DESTDIR)&:g' \
      -e '# Make $(COPY) create the folders' \
      -e 's:^COPY = .*$:COPY = install -Dp:g' \
      -e '# No need to resolve .. on these dirs' \
      -e 's:^ABS\([A-Z]*DIR\) = .*$:ABS\1 = $(\1):g' \
      -e '# The messy install covered for a missed target' \
      -e '/^all:/ s:$: p2cc:g' \
      -e '#newhome forgot the target too' \
      -e '/^newhome:/,/^$/ s:trans.o:& p2cc:g' \
      -e '# 32 bit compile' \
      -e "${_ccc}"'s:^CC = cc:& -m32:g' \
    -i 'Makefile'
  test ! -s 'Makefile.Arch'

  # Get rid of a generated code warning
  sed -e 's:^MainType\s:&int:g' -i 'sys.p2crc'

  cd '..'
  # Fix the permissions
  find -type 'd' -exec chmod 755 '{}' '+'
  find -type 'f' -exec chmod 644 '{}' '+'

  # get rid of home for make test examples check()
  rm -r "../${_srcdir}/home/"

  # make clean for examples
  cd 'examples'
  rm 'basic' 'cref' 'e' 'fact' 'self' *.c
  rm -r '../examples/c/'

  # point examples check to the just compiled test version
  sed -e 's:^P2C = .*$:P2C = ../check/usr/bin/p2c:g' \
      -e '# Fix INC to use our include dir' \
      -e 's:^INC = .*$:INC = ../check/usr/include:g' \
      -e '# Move to src folder' \
      -e 's:^LIB = .*$:LIB = ../check/usr/lib/libp2c.a:g' \
      -e '# 32 bit compile' \
      -e "${_ccc}"'s:\$(CC) :&-m32 :g' \
    -i 'Makefile'

  set +u
}

build() {
  set -u
  cd "${_srcdir}/src"
  # make check() executable
  make OPT='-O2 -s' ABSHOMEDIR="${srcdir}/${_checkdir}/usr/lib/p2c"
  mv p2c{,_test}
  # make package() executable
  make newhome
  make OPT='-O2 -s'
  set +u
}

check() {
  cd "${_srcdir}"
  # switching from /usr/include/p2c to any other dir unhides warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
  # we fix this by compiling -m32 where sizeof(int)==sizeof(void *)
  make -C 'src' install DESTDIR="${srcdir}/${_checkdir}"
  install -p 'src/p2c_test' "${srcdir}/${_checkdir}/usr/bin/p2c"
  make -C 'examples'
  rm -r "${srcdir}/${_checkdir}"
}

package() {
  set -u
  cd "${_srcdir}"
  make -C 'src' install DESTDIR="${pkgdir}"
  set +u
}
set +u
