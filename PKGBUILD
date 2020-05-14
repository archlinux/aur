# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: ajs124

# Tested with Kernel 4.16, Dell D3000 SuperSpeed USB 3.0 Docking Station, 17e9:4318 DisplayLink

set -u
pkgname='evdi-git'
pkgver=1.7.0.r6.g9b124a6
_pkgver="${pkgver%%.r*}"
pkgrel=1
pkgdesc='kernel module that enables management of multiple screens, primarily for DisplayLink USB VGA DVI HDMI DisplayPort video'
pkgdesc+=' git version.'
arch=('i686' 'x86_64')
url='https://github.com/DisplayLink/evdi'
license=('GPL')
depends=('dkms')
makedepends=('git' 'libdrm')
makedepends+=('linux-headers')
provides=("evdi=${_pkgver}")
conflicts=('evdi')
install="${pkgname}.install"
changelog="${pkgname}.Changelog"
_srcdir="${pkgname%-git}"
source=(
  'git+https://github.com/DisplayLink/evdi'
  #'https://crazy.dev.frugalware.org/evdi-all-in-one-fixes.patch'
  #'relro.patch'
)
source[0]+='#branch=master'
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  local _modver _rev
  #_modver="$(awk -F '=' '/MODVER=/ {print $2}' module/Makefile)"
  _rev="$(git describe --long --tags | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
  if [ -z "${_modver:-}" ]; then
    printf '%s\n' "${_rev}"
  else
    printf '%s.r%s\n' "${_modver}" "${_rev##*.r}"
  fi
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
  #sed -E -e 's:SUBDIRS=([^ ]+) :M=\1 &:g' -i 'module/Makefile'
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
  local _libs=(*.so.*)
  if [ "${#_libs[@]}" -ne 1 ]; then
    set +u
    echo "Too many libs"
    false
  fi
  _libs="${_libs[0]}"
  local _libase="${_libs%.so*}.so"
  ln -sf "${_libs}" "${_libase}"
  ln -sf "${_libs}" "${_libase}.0" # bad soname
  popd > /dev/null

  local _DKMS="${pkgdir}/usr/src/${pkgname%-git}-${_pkgver}"
  install -Dpm644 module/* -t "${_DKMS}/"
  make -j1 -C "${_DKMS}" clean
  set +u
}
set +u
