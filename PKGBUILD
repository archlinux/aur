# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_opt_meson=1

set -u
_pkgname='fdpp'
pkgname='fdpp'
#pkgname+='-git'
epoch=0
pkgver=1.9
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
  makedepends+=('meson' 'git')
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
md5sums=('d92a3c518a2af00c2e0e4035ac71df59')
sha256sums=('65fdf0819d490c8ba32fc706309f483f0c6547ff65c860efbb4323e4138896ed')
b2sums=('a7ae68d5056ab364a80ab6a3454389a1fad5a049a738d9fab8aebe0497d366267e1848493d70e34200e6805ddbfd19b0c6bc0b56c8c43949f1ff95da35ed72b2')

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
  source=("${source[@]/${pkgver}/${pkgver%.r*}}")
pkgver() {
  set -u
  printf '%s\n' "${pkgver%.r*}"
  set +u
}
fi

build() {
  set -u
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
