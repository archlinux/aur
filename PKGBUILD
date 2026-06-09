# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_opt_meson=1
_opt_commit=''
_opt_commit='#commit=c6c5a89c47511582a45b0ac9593f571381992375'

set -u
_pkgname='fdpp'
pkgname='fdpp'
#pkgname+='-git'
epoch=0
pkgver=1.10.r45.gc6c5a89c
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
  #'comcom64'
  'libgcc'
  'libstdc++'
  'glibc'
  'libelf'
)
makedepends=(
  'bash'
  'binutils'
  'clang'
  'nasm-segelf' # See https://github.com/dosemu2/fdpp/issues/233#issuecomment-1788601563
  'thunk_gen'
  'nasm'        # to be removed after 1.7, still needed as of 1.10
)
if [ "${_opt_meson}" -ne 0 ]; then
  makedepends+=('meson' 'git')
fi
if [ "${CARCH}" == "x86_64" ]; then
  export CROSS_LD='ld'
else
  makedepends+=("x86_64-elf-binutils")
  export CROSS_LD='x86_64-elf-ld'
fi
options=('!strip' '!buildflags' '!lto')
_srcdir="${pkgname%-git}-${pkgver%.r*}"
source=(
  "${_srcdir}.tar.gz::${url}/archive/${pkgver%%.r*}.tar.gz"
)
md5sums=('5f9c5c7bfa7514f41512f38d894668da')
sha256sums=('b2e036c19f7b02f8ef4d2254f3cc6f7d9a3462d582621e6b2e9cc4fc1623f17a')

prepare() {
  local -; set -u
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
}

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  _opt_commit=''
fi
if [ "${pkgname%-git}" != "${pkgname}" ] || [ ! -z "${_opt_commit}" ]; then
  source[0]="git+${url}.git${_opt_commit}"
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  conflicts+=("${pkgname%-git}")
  provides+=("${pkgname%-git}=${pkgver%%.r*}")
  makedepends+=('git')
  _srcdir="${pkgname%-git}"
pkgver() {
  cd "${_srcdir}"
  git describe --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
}
elif [ "${pkgver%.r*}" != "${pkgver}" ]; then
  source=("${source[@]/${pkgver}/${pkgver%.r*}}")
pkgver() {
  local -; set -u
  printf '%s\n' "${pkgver%.r*}"
}
fi

build() {
  local -; set -u
  cd "${_srcdir}"
  if [ -s 'configure.meson' ] && [ "${_opt_meson}" -ne 0 ]; then
    if grep -qe '-- ' 'configure.meson'; then
      ./configure.meson -b 'build' -- --prefix '/usr'
    else
      ./configure.meson --prefix '/usr' 'build'
    fi
    meson compile --verbose -C 'build'
  else
    bash -e -u configure
    sed -E -e '/^prefix / s:= .+:= /usr:g' -i 'fdpp/defs.mak'
    nice make
  fi
}

package() {
  local -; set -u
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
}
set +u
