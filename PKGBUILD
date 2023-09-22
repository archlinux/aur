# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='fdpp'
#pkgname+='-git'
pkgver=1.7
pkgrel=1
pkgdesc='64 bit FreeDOS++ for dosemu2'
arch=('x86_64')
url='https://github.com/dosemu2/fdpp'
license=('GPL3')
depends=(
  'gcc-libs'
  'comcom32'
)
makedepends=(
  'clang'
  'nasm'
  'lld'
)
options=('!strip')
_srcdir="${pkgname%-git}-${pkgver%.r*}"
source=(
  "${_srcdir}.tar.gz::${url}/archive/${pkgver%%.r*}.tar.gz"
)
md5sums=('c799e057c720f4f9b0dccb4ba52b2a1e')
sha256sums=('84447578d30ec5d94924d6a2c695005770333aacbca233188ff205d5ab5cbd91')
b2sums=('79f55805086374b1aec06e5ec21b3a5c9d39bb4f777a0035810d646cf251e34bd15d17ca002b26aa2b35a90f1a988fb1e923514077baaad97d516aabe38e20cb')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  source[0]="git+${url}.git"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  b2sums[0]='SKIP'
  conflicts+=("${pkgname%-git}")
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  _srcdir="${pkgname%-git}"
pkgver() {
  cd "${_srcdir}"
  git describe --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}
elif [ "${pkgver%.r*}" != "${pkgver}" ]; then
pkgver() {
  echo "${pkgver%.r*}"
}
fi

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

  sed -e '/^PREFIX / s:/usr/local:/usr:g' -i 'fdpp/defs.mak'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  bash -e -u configure
  make -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  pushd "${pkgdir}/usr/share/fdpp/" > /dev/null
  if [ ! -e 'fdppkrnl.elf' ]; then
    ln -s fdppkrnl.*.elf 'fdppkrnl.elf'
  fi
  if [ ! -e 'fdppkrnl.map' ]; then
    ln -s fdppkrnl.*.map 'fdppkrnl.map'
  fi

  popd > /dev/null
  set +u
}
set +u
