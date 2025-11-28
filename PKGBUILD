# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: tardo <tardo@nagi-fanboi.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

_opt_32bit=0

set -u
pkgname='p2c'
pkgver='2.02'
pkgrel='1'
pkgdesc='Pascal to C/C++ translator converter'
arch=('x86_64')
#url="http://packages.debian.org/sid/p2c"
#url='https://schneider.ncifcrf.gov/p2c/'
url='http://users.fred.net/tds/lab/p2c/'
license=('GPL')
depends=('perl')
if [ "${_opt_32bit}" -ne 0 ]; then
  depends_x86_64+=('lib32-glibc')
  makedepends_x86_64+=('lib32-gcc-libs')
fi
#  http://ftp.debian.org/debian/pool/main/p/p2c/p2c_${pkgver}-3.diff.gz)
#source=("http://www.ccrnp.ncifcrf.gov/~toms/p2c/p2c-${pkgver}.tar.gz")
#source=('https://alum.mit.edu/www/toms/p2c/p2c-2.01.tar.gz
_srcdir="${pkgname}-${pkgver}"
#source=("https://schneider.ncifcrf.gov/p2c/${_srcdir}.tar.gz")
#source=("https://alum.mit.edu/www/toms/p2c/${_srcdir}.tar.gz")
source=("http://users.fred.net/tds/lab/p2c/${_srcdir}.zip")
_srcdir="${_srcdir/./-ZIPPERDOT-}"
source+=(
  '0000-make-install.patch'
  '0000-make-install-again.patch'
  '0001-trans.c-unistd.h-link-unlink.patch'
  '0002-makefile-32bit-compile.patch'
  '0003-sys.p2crc-MainType-int.patch'
  '1000-examples-Makefile-change-binaries.patch'
  '0004-_OutMem-64-bit-compile.patch'
)
#options=('!strip')
md5sums=('b379caf316c357ab5c0bc4934aa6ae25'
         '3cf28ada6f5935e5ce7eb6515fd429ef'
         'c52f03457709e7e968debd3b9c93a7a6'
         'bd21f009fbbf835ac2803efd44bb280f'
         'e460eaf157a46f8411eec730e05aea24'
         '0cccd2e48b606e9299a3938103a373b6'
         '488836c68b8abd8bd1f6ca91d1ced545'
         '85a7f53c671145bb9bc85fbbe80f53d2')
sha256sums=('baa322b12e477af38c767be0406b5e7ca2fa4c26ae2f80f4bc2889bf36d0069f'
            'a1dd6995cb13e87bbf6f707224c1a58fbebe9101aeccd7ba3aca0e760950773a'
            '174664a05674b4cc86d995d520c9d67caf6fe5b81c920666deb4b7b30571f8c1'
            'cceb0a5fbb104741c75cca10ed9a7389d14ae428f3dc957a2b442cf6d45f4685'
            '5b70fbfbc0a6c922bc3c2e1e339fcbe727cfccec037e04bc792c5cd72289f884'
            'ecdc91610006f5ae75a1fa4cf9cbfe4a492a99704034d33fd72a71bb8378adc5'
            '1e06200380e6350b083c94d6b90a24a41fad8b6f0f8b9d2d9c3d8131ea50a49f'
            '1ae3ce087e662ffd8807139343f6835ca916beb88e819f459c4994de980d3883')
_checkdir="${_srcdir}/check"

prepare() {
  set -u
  cd "${_srcdir}"

  # Fix the permissions
  find -type 'd' -exec chmod 755 '{}' '+'
  find -type 'f' -exec chmod 644 '{}' '+'

  # Remove supplied binaries
  make -C 'src' clean # this deletes p2c.hdrs which we need
  rm -f 'src/makeproto' 'src/p2cc' 'src/libp2c.a'

  #patch -Np2 -i '../p2c_${pkgver}-3.diff'
  #sed -e 's:getline:xgetline:' -i *.c *.hdrs

  if [ "$(vercmp "${pkgver}" "2.01")" -le 0 ]; then
    # Add includes to get rid of some warnings
    sed -e '/^#include <stdio.h>/ a #include <stdlib.h>' -i 'src/makeproto.c'
  fi

  local _patches=()
  # _patches+=("0000-make-install.patch") # The mess in make install is too big to fix with sed
  # Make package compatible
  # Fix high thread count make
  # Set LDFLAGS
  _patches+=('0000-make-install-again.patch')
  _patches+=('0001-trans.c-unistd.h-link-unlink.patch') # Switch to built in link,unlink declarations
  if [ "${_opt_32bit}" -ne 0 ]; then
    _patches+=('0002-makefile-32bit-compile.patch')
  fi
  _patches+=('0003-sys.p2crc-MainType-int.patch') # Get rid of a generated code warning
  _patches+=('0004-_OutMem-64-bit-compile.patch') # Fix warning in 64 bit generated code

  # get rid of home for make test examples check()
  rm -r "../${_srcdir}/home/"

  # make clean for examples
  rm 'examples/basic' 'examples/cref' 'examples/e' 'examples/fact' 'examples/self' examples/*.c
  rm -r 'examples/c/'

  _patches+=('1000-examples-Makefile-change-binaries.patch') # point examples check to the just compiled test version

  local _pt _ptf=() _pts=()
  for _pt in "${_patches[@]}"; do
    set +u; msg2 "Patch ${_pt}"; set -u
    if patch -Nufp1 --no-backup-if-mismatch -i "${srcdir}/${_pt}"; then
      _pts+=("${_pt}")
    else
      _ptf+=("${_pt}")
    fi
  done
  if [ "${#_ptf[@]}" -gt 0 ]; then
     if [ "${#_pts[@]}" -gt 0 ]; then
       printf 'Patch success %s\n' "${_pts[@]}"
       printf 'Warning: Some old patches may need to be removed even if they are successful\n'
     fi
     printf 'Patch failed %s\n' "${_ptf[@]}"
     set +x
     false
  fi
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; false
  # diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

  if [ "${_opt_32bit}" -ne 0 ]; then
    sed -e '# 32 bit compile' \
        -e 's:\$(CC) :&-m32 :g' \
    -i 'examples/Makefile'
  fi
  sed -e '# Reduce standard for gets' \
      -e 's:\$(CC) :&-ansi -Wno-deprecated-declarations :g' \
  -i 'examples/Makefile'
 set +u
}

build() {
  set -u
  cd "${_srcdir}"
  local _opts='-Wno-error=incompatible-pointer-types -std=gnu17'
  set +u; msg2 'make check() executable'; set -u
  make -C 'src' OPT="-O2 -s ${_opts}" ABSHOMEDIR="${srcdir}/${_checkdir}/usr/lib/p2c"
  mv src/p2c{,_test}
  make -C 'src' newhome
  set +u; msg2 'make package() executable'; set -u
  make -C 'src' OPT="-O2 -s ${_opts}"
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
  make -j1 -C 'src' install DESTDIR="${pkgdir}"
  chmod 644 "${pkgdir}/usr/lib"/*.a
  set +u
}
set +u
