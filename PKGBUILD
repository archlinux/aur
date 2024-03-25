# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

set -u
pkgname='smallerc'
# The + has been replaced with a _
pkgver='1.0.1_dos.win.1ab15c7'
pkgrel=1
pkgdesc='simple and small single-pass C compiler'
arch=('x86_64')
url='https://github.com/alexfru/SmallerC'
license=('BSD-2-Clause')
makedepends=('nasm')
options=('!strip' '!buildflags' '!lto')
_srcdir="SmallerC-${pkgver/_/-}"
source=(
  "${_srcdir}.zip::${url}/archive/refs/tags/v${pkgver/_/+}.zip"
  # ./smlrcc -SI /tmp/makepkg-chris/smallerc/src/Arch000aaaaaaaaAAAAAABBBBBBC/v0100/include -I /tmp/makepkg-chris/smallerc/src/Arch000aaaaaaaaAAAAAABBBBBBC/v0100/srclib @lcw.op
  # Error in "/tmp/makepkg-chris/smallerc/src/SmallerC-1.0.1-dos.win.1ab15c7/v0100/srclib/kernel32/closehan.c" (9:109)
  # Invalid or too long file name or path name
  '0000-smlrc.c-MAX_FILE_NAME_LEN.patch'
)
md5sums=('04e5b3a57915c439c09a38406c4583e4'
         'c96ff0ba67916f5aa2ed3e19eb9fee44')
sha256sums=('96c58af2fbf040d8277af1831dc8d34fd974d381d14965f4937dd9651fc2d0b8'
            'e1f4d6e57700d175857f373395526a3bb1a775f1f2dc23010e2ffc1614c900c4')

prepare() {
  set -u
  cd "${_srcdir}"

  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    if [[ "${_pt}" = *.patch ]]; then
      set +u; msg2 "Patch ${_pt}"; set -u
      patch -Nup1 -i "${srcdir}/${_pt}"
    fi
  done
  #cd ..; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  #diff -pNaru5 'a' 'b' > '0000-new.patch'

  sed -e '/^prefix =/ s:/usr/local:/usr:g' -i 'common.mk'

  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  ./configure
  nice make # -j1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
