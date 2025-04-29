# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_gitname=hsplus_load
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=r15.20220718.215c2a1
pkgrel=1
pkgdesc="Utility for initializing NI GPIB-USB-HS+ adapters under Linux (or actually, any platform where libusb is available)."
url="https://github.com/fmhess/hsplus_load"
arch=('x86_64' 'i686' 'aarcxh64')
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'libusb'
)
makedepends=(
  'git'
)
optdepends=(
  "ni_gpib_usb_hsp-gpib-firmware:  For firmware images needed to load to the device."
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
backup=()
replaces=()
source=(
  "${_gitname}::git+https://github.com/fmhess/hsplus_load.git"
)
sha256sums=(
  'SKIP'  # Main upstream source
)

prepare() {
  cd "${srcdir}/${_gitname}"

  git log > git.log

  make clean || true
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  #if [ -z "${_ver}" ]; then
  #  error "Version could not be determined."
  #  return 1
  # fi
  if [ -z "${_rev}" ]; then
    error "Git commit count could not determined."
    return 1
  else
    #printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_gitname}"

  make -j1
}

package() {
  cd "${srcdir}/${_gitname}"

  local _bindir="/usr/bin"
  local _docdir="/usr/share/doc/${_pkgname}"
  local _licensedir="/usr/share/licenses/${pkgname}"

  install -Dvm755 -t "${pkgdir}/${_bindir}"  hsplus_load

  install -Dvm644 -t "${pkgdir}/${_docdir}"      'git.log' README.md
  cp -rv test_results "${pkgdir}/${_docdir}"/
  install -Dvm644 -t "${pkgdir}/${_licensedir}"  'LICENSE'
}

# vim:set ts=2 sw=2 et:
