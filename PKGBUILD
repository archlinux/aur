# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_opt_meson=1

set -u
_pkgname='fdpp'
pkgname='fdpp'
#pkgname+='-git'
epoch=0
pkgver=1.8
pkgrel=1
pkgdesc='64 bit FreeDOS++ for dosemu2'
arch=(
  'x86_64'
  'aarch64'
)
url='https://github.com/dosemu2/fdpp'
license=(
  'GPL-3.0-or-later'
)
depends=(
  'comcom64'
  'gcc-libs'
  'glibc'
  'libelf'
)
makedepends=(
  'bash'
  'binutils'
  'clang'
  'nasm-segelf' # See https://github.com/dosemu2/fdpp/issues/233#issuecomment-1788601563
  'thunk_gen'
  #nasm          # to be removed after 1.7
)
if [ "${_opt_meson}" -ne 0 ]; then
  makedepends+=('meson')
fi
if [ "${CARCH}" == "x86_64" ]; then
  export CROSS_LD='ld'
else
  makedepends+=("x86_64-elf-binutils")
  export CROSS_LD='x86_64-elf-ld'
fi
options=('!strip')
_srcdir="${pkgname%-git}-${pkgver%.r*}"
source=(
  "${_srcdir}.tar.gz::${url}/archive/${pkgver%%.r*}.tar.gz"
)
md5sums=('5040686eb72404df814ffb398a50c957')
sha256sums=('63b7f837df0583a586140a94c6fa0fb5654dd1d0a06a1fe068ef52f12bef254c')
b2sums=('bbab2006627fb24b0915a95a39979905d1591cfc37051414cc2d3aba73dc1c12d2e376302390abe07e63f733b6cc99318ba1591a02434efc6f134822fb3f813d')

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

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  source[0]="git+${url}.git"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  b2sums[0]='SKIP'
  conflicts+=("${pkgname%-git}")
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  makedepends+=('git')
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

build() {
  set -u
  cd "${_srcdir}"
  if [ -s 'configure.meson' ] && [ "${_opt_meson}" -ne 0 ]; then
    ./configure.meson --prefix '/usr' 'build'
    meson compile --verbose -C 'build'
  else
    bash -e -u configure
    sed -E -e '/^prefix / s:= .+:= /usr:g' -i 'fdpp/defs.mak'
    nice make
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  if [ -s 'configure.meson' ] && [ "${_opt_meson}" -ne 0 ]; then
    meson install -C 'build' --destdir "${pkgdir}"
  else
    make -j1 DESTDIR="${pkgdir}" install
  fi

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
