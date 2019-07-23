# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: ajs124

# Tested with Kernel 4.16, Dell D3000 SuperSpeed USB 3.0 Docking Station, 17e9:4318 DisplayLink

set -u
pkgname='evdi-git'
pkgver=1.6.2_2_g75536ec
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
  'relro.patch'
)
md5sums=('SKIP'
         '05e64dd295a66c030139d0c8f6f7013b')
sha256sums=('SKIP'
            'ff03b5a804af826e6b0678cd4d821b5ecd2c5bf04ea7c465751f83b28e928786')

pkgver() {
  set -u
  cd "${_srcdir}"
  # occasional extra -r interfers with version management
  local _t1="$(git describe --tags)" # v1.5.0-r2
  local _t1a="${_t1//-/_}"
  local _t2="$(git describe --long --tags)" # v1.5.0-r2-0-gdc3c9d6
  local _t2a="${_t2//${_t1}/${_t1a}}"
  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' <<< "${_t2a}"
  set +u
}

prepare() {
  set -u
  cd "${_srcdir}"
  local _src
  for _src in "${source[@]}"; do
    _src="${_src%%::*}"
    _src="${_src##*/}"
    if [[ "${_src}" = *.patch ]]; then
      patch -Np1 -i "../${_src}"
    fi
  done
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
  install -Dpm755 "library/lib${pkgname%-git}.so" -t "${pkgdir}/usr/lib/"

  local _DKMS="${pkgdir}/usr/src/${pkgname%-git}-${_pkgver}"
  install -Dpm644 module/* -t "${_DKMS}/"
  make -j1 -C "${_DKMS}" clean
  set +u
}
set +u
