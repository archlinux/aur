# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: ajs124

# Tested with Kernel 4.16, Dell D3000 SuperSpeed USB 3.0 Docking Station, 17e9:4318 DisplayLink

set -u
pkgname='evdi-git'
pkgver=1.6.2.r12.g391f1f7
_pkgver="${pkgver%%.r*}"
pkgrel=1
pkgdesc='kernel module that enables management of multiple screens, primarily for DisplayLink USB VGA DVI HDMI DisplayPort video'
pkgdesc+=' git version.'
arch=('i686' 'x86_64')
url='https://github.com/DisplayLink/evdi'
license=('GPL')
depends=('dkms')
makedepends=('git' 'libdrm')
provides=("evdi=${_pkgver}")
conflicts=('evdi')
install=${pkgname}.install
changelog="${pkgname}.Changelog"
_srcdir="${pkgname%-git}"
source=(
  'git+https://github.com/DisplayLink/evdi/'
  'https://crazy.dev.frugalware.org/evdi-all-in-one-fixes.patch'
  #'relro.patch'
)
md5sums=('SKIP'
         '7f6104e6e8df04574b2bf1f12d9a51ee')
sha256sums=('SKIP'
            '211f791455046c580277a86dfc129255268c033f87eee93bc0e72569f1df8aa8')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  local _src
  for _src in "${source[@]%%::*}"; do
    _src="${_src##*/}"
    if [[ "${_src}" = *.patch ]]; then
      set +u; msg2 "Patch ${_src}"; set -u
      patch -Np1 -i "../${_src}"
    fi
  done

  # Fix build for kernel 5.4
  sed -E -e 's:SUBDIRS=([^ ]+) :M=\1 &:g' -i 'module/Makefile'
  set +u
}

build() {
  set -u
  # We only need to build the library in this step, dmks will build the module
  #cd "${_srcdir}/library"
  # DKMS builds are hard to debug. We build it here and throw it away.
  cd "${_srcdir}"
  make
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  install -Dpm755 "library/lib${pkgname%-git}.so"* -t "${pkgdir}/usr/lib/"
  pushd "${pkgdir}/usr/lib/" > /dev/null
  local _libs=(*.so*)
  if [ "${#_libs[@]}" -ne 1 ]; then
    set +u
    echo "Too many libs"
    false
  fi
  _libs="${_libs[0]}"
  local _libase="${_libs%.so*}.so"
  ln -s "${_libs}" "${_libase}"
  ln -s "${_libs}" "${_libase}.0" # bad soname
  popd > /dev/null

  local _DKMS="${pkgdir}/usr/src/${pkgname%-git}-${_pkgver}"
  install -Dpm644 module/* -t "${_DKMS}/"
  make -j1 -C "${_DKMS}" clean
  set +u
}
set +u
