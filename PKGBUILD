# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: ajs124

set -u
pkgname='evdi-git'
pkgver=1.5.0_r2.r0.gdc3c9d6
_pkgver="${pkgver%%.r*}"
pkgrel=1
pkgdesc="A Linux® kernel module that enables management of multiple screens."
pkgdesc+=' Git version.'
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
source=("git+https://github.com/DisplayLink/evdi/")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  # extra -r interfers with version management
  local _t1="$(git describe --tags)" # v1.5.0-r2
  local _t1a="${_t1//-/_}"
  local _t2="$(git describe --long --tags)" # v1.5.0-r2-0-gdc3c9d6
  local _t2a="${_t2//${_t1}/${_t1a}}"
  sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' <<< "${_t2a}"
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
