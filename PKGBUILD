# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: ajs124

# Tested with Kernel 4.16, Dell D3000 SuperSpeed USB 3.0 Docking Station, 17e9:4318 DisplayLink

pkgname='evdi-git'
pkgver=1.13.0.r0.gfe857b5
_pkgver="${pkgver%%.r*}"
pkgrel=1
pkgdesc='kernel module that enables management of multiple screens, primarily for DisplayLink USB VGA DVI HDMI DisplayPort video'
arch=('i686' 'x86_64')
url='https://github.com/DisplayLink/evdi'
license=('GPL')
depends=('dkms')
makedepends=('git' 'libdrm')
makedepends+=('linux-headers')
provides=("evdi=${_pkgver}")
conflicts=('evdi')
_srcdir="${pkgname%-git}"
source=(
  'git+https://github.com/DisplayLink/evdi'
)
source[0]+='#branch=devel'
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd "${_srcdir}"
  local _modver _rev
  #_modver="$(awk -F '=' '/MODVER=/ {print $2}' module/Makefile)"
  _rev="$(git describe --long --tags | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
  if [ -z "${_modver:-}" ]; then
    printf '%s\n' "${_rev}"
  else
    printf '%s.r%s\n' "${_modver}" "${_rev##*.r}"
  fi
}

prepare() {
  cd "${_srcdir}"
  local _src
  for _src in "${source[@]%%::*}"; do
    _src="${_src##*/}"
    if [[ "${_src}" = *.patch ]]; then
      msg2 "Patch ${_src}"
      patch -Np1 -i "../${_src}"
    fi
  done

  # Fix build for kernel 5.4
  #sed -E -e 's:SUBDIRS=([^ ]+) :M=\1 &:g' -i 'module/Makefile'

  sed -e 's:-Werror::g' -i 'Makefile'
}

build() {
  cd "${_srcdir}"
  # DKMS builds are hard to debug. We can build it here to debug the errors.
  if :; then
    # We only need to build the library in this step, dmks will build the module
    cd 'library'
  fi
  CFLAGS="${CFLAGS/-fno-plt/}"
  make
}

package() {
  cd "${_srcdir}"
  install -Dpm755 "library/lib${pkgname%-git}.so"* -t "${pkgdir}/usr/lib/"

if ! :; then
  pushd "${pkgdir}/usr/lib/" > /dev/null
  local _libs=(*.so.*)
  if [ "${#_libs[@]}" -ne 1 ]; then
    echo "Too many libs"
    false
  fi
  _libs="${_libs[0]}"
  local _libase="${_libs%.so*}.so"
  ln -sf "${_libs}" "${_libase}"
  ln -sf "${_libs}" "${_libase}.0" # bad soname
  popd > /dev/null
fi

  local _DKMS="${pkgdir}/usr/src/${pkgname%-git}-${_pkgver}"
  install -Dpm644 module/* -t "${_DKMS}/"
  make -j1 -C "${_DKMS}" clean
  rm -f "${_DKMS}/evdi.mod"
}
