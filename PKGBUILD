# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: aksr <aksr at t-com dot me>
# Contributor: Isabelle COWAN-BERGMAN « izzi at izzette．com »
# Contributor: Felix Braun <hazzl@falix.de>

set -u
_pkgname='zbackup'
pkgname="${_pkgname}"
#pkgname+='-git'
pkgver=1.5
pkgrel=2
pkgdesc='A versatile deduplicating backup tool'
arch=('i686' 'x86_64')
url='http://zbackup.org'
#_giturl='https://github.com/zbackup/zbackup'
_giturl='https://github.com/davidbartonau/zbackup'
license=('GPL2')
depends=('xz' 'openssl' 'protobuf')
depends+=('lzo' 'gcc-libs' 'glibc' 'abseil-cpp' 'zlib')
makedepends=('cmake' 'libunwind')
checkdepends=('python')
_srcdir="${_pkgname}-${pkgver}"
source=(
  #"${_srcdir}.tar.gz::${_giturl}/archive/${pkgver}.tar.gz"
  "${_srcdir}.tar.gz::${_giturl}/archive/refs/tags/${pkgver}.tar.gz"
  #'0000-PR-154.sed.patch::https://patch-diff.githubusercontent.com/raw/zbackup/zbackup/pull/154.patch'
  #'0001-PR-158.sed.patch::https://github.com/zbackup/zbackup/pull/158.patch'
  '0002-debian.remove_throw.patch::https://sources.debian.org/data/main/z/zbackup/1.5-2/debian/patches/remove_throw.patch'
  '0003-debian.protobuf.patch::https://sources.debian.org/data/main/z/zbackup/1.5-2/debian/patches/protobuf.patch'
  '0004-ObjectsIteratorComp_operator_const.patch' # https://stackoverflow.com/questions/67809226/getting-weird-compilation-error-in-defining-a-stdset-with-custom-compare-in-c
  '0005-explicit-std-string.patch'
)
md5sums=('ad15fe626eefdb835ec81e0a2d38892c'
         'ab06602fa0ac5188a2bda2f171aabb8c'
         '9f849b1dfd85ca352b87e357c8bb64c0'
         '77837a55195b6c7cc0d69e4766021670'
         'a4d0a4a91e97f9533fd9a09ee086896c')
sha256sums=('344fed4491cb52b6712b03c1d8b1bcf994cfc578ad422cb644502e171585a8f7'
            'bc4e3a9a887880b0555bf457a4566e11c819e00246ff84f75e8fbd3b7a00a3a3'
            '89c765f53db777a429b94a544b0d4bb66350804dace5cdb3cfa2b26d193acab0'
            '12d77664b83fa3ce321797a691098bbe49440146b75042c29ef029c5136ab92d'
            '0ddf33435330a4258a474f92b4e2aefee0a50366a50e445f2ffbc22105cb2627')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  _srcdir="${_pkgname}"
  source[0]="git+${_giturl}.git"
  makedepends+=('git')
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  provides=("${_pkgname}=${pkgver%.r*}")
  conflicts=("${_pkgname}")
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --tags | sed -E -e 's/([^-]*-g)/r\1/' -e 's/-/./g'
  set +u
}
fi

prepare() {
  set -u
  cd "${_srcdir}"
  local _seds=(
    -e '# PR-154'
    -e '#/cmake_minimum_required/ s:2\.8\.3:2.8.2:g'
    -e '#/a\/sptr.hh/,$ d'
    -e '/ CMAKE_CXX_STANDARD / s:11:14:g'
    -e '# PR-158'
    -e '#/emitting chunks/,$ d'
  )
  local _f
  for _f in "${source[@]}"; do
    _f="${_f%%::*}"
    _f="${_f##*/}"
    if [[ "${_f}" = *.sed.patch ]]; then
      set +u; msg2 "Patch ${_f}"; set -u
      patch -Nup1 -i <(sed -E "${_seds[@]}" "${srcdir}/${_f}")
    elif [[ "${_f}" = *.patch ]]; then
      set +u; msg2 "Patch ${_f}"; set -u
      patch -Nup1 -i "${srcdir}/${_f}"
    fi
  done
  #cd '..'; cp -pr "${_srcdir}" 'a'; ln -s "${_srcdir}" 'b'; cd "${_srcdir}"; false
  # diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  #export CC=clang
  #export CXX=clang
  #LDFLAGS+=',--copy-dt-needed-entries' # https://stackoverflow.com/questions/19901934/libpthread-so-0-error-adding-symbols-dso-missing-from-command-line
  local _cmakeflags=(
    -DCMAKE_INSTALL_PREFIX='/usr'
    #-DCMAKE_CXX_STANDARD='11'
    # PROTOBUF lib detection misses this one.
    -DCMAKE_CXX_STANDARD_LIBRARIES='-labsl_spinlock_wait' # https://stackoverflow.com/questions/25243336/specifying-libraries-for-cmake-to-link-to-from-command-line
    -DCMAKE_POLICY_VERSION_MINIMUM='3.5'
    #-DCMAKE_C_COMPILER='gcc-12'
    #-DCMAKE_CXX_COMPILER='g++-12'
  )
  set +u; msg2 'Compile zbackup'; set -u
  if [ ! -s 'build-zbackup/Makefile' ]; then
    cmake . -B'build-zbackup' "${_cmakeflags[@]}"
  fi
  make -C 'build-zbackup' # VERBOSE=1 # -j1
  set +u; msg2 'Compile tartool'; set -u
  if [ ! -s 'build-tartool/Makefile' ]; then
    cmake 'tools/tartool' -B'build-tartool' "${_cmakeflags[@]}"
  fi
  make -C 'build-tartool' -j1
  set +u
}

check() {
  set -u
  cd "${_srcdir}"

  rm -rf 'Arch.test'
  mkdir 'Arch.test'

  # TODO: Run the other tests and run with encryption.
  echo 'Running regression tests ...'
  local _py=(
    --zbackup 'build-zbackup/zbackup'
    --tmp 'Arch.test'
    --samples '.'
    --seed '123'
    --loops '1'
    --add-per-loop '60'
    --delete-per-loop '50'
    --log-level '1'
  )
  set +u
  # regression isn't in git
  if [ ! -s 'tests/regression/regression.py' ]; then
    printf '>> tests skipped <<\n'
  elif python 'tests/regression/regression.py' "${_py[@]}"; then
    printf '>> tests pass <<\n'
  else
    false
  fi
}

package() {
  set -u
  cd "${_srcdir}"
  make -C 'build-zbackup' -j1 DESTDIR="${pkgdir}" install
  install -Dpm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"

  depends+=('tar')
  make -C 'build-tartool' -j1 DESTDIR="${pkgdir}" install

  install -Dpm644 licenses/* -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  set +u
}
set +u
