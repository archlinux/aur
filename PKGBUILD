# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='smallerc'
# The + has been replaced with a _
pkgver='1.0.2_dos.win.b120a9c'
pkgrel=1
pkgdesc='simple and small single-pass C compiler'
arch=('x86_64')
url='https://github.com/alexfru/SmallerC'
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('nasm')
_srcdir="SmallerC-${pkgver/_/-}"
source=(
  "${_srcdir}.zip::${url}/archive/refs/tags/v${pkgver/_/+}.zip"
  # ./smlrcc -SI /tmp/makepkg-chris/smallerc/src/Arch000aaaaaaaaAAAAAABBBBBBC/v0100/include -I /tmp/makepkg-chris/smallerc/src/Arch000aaaaaaaaAAAAAABBBBBBC/v0100/srclib @lcw.op
  # Error in "/tmp/makepkg-chris/smallerc/src/SmallerC-1.0.1-dos.win.1ab15c7/v0100/srclib/kernel32/closehan.c" (9:109)
  # Invalid or too long file name or path name
  #'0000-smlrc.c-MAX_FILE_NAME_LEN.patch'
  #'0001-stsp-dpstub-alloc-dpmi-mem-in-UMB.patch::https://github.com/alexfru/SmallerC/commit/8e55da3682e71349a536673618cd974ad6151bfd.patch'
)
md5sums=('9a76b5e3cdea24e590b1a22a4d6cc747')
sha256sums=('665e39f074b0da0ce15367fc0fff2ad322c889d752bf5b0ba6af7b895419fe08')

true && pkgver="${pkgver%%_dos*}"

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
  nice make -j1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  install -D 'license.txt' -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  set +u
}
set +u
