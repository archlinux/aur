# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

# Based on linux-api-headers package

# toolchain build order: linux-libre-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-libre-api-headers
_pkgbasever=4.7-gnu
_pkgver=$_pkgbasever

_srcname=linux-${_pkgbasever%-*}
_archpkgver=${_pkgver%-*}
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.gnu.org/software/libc"
license=('GPL2')
provides=("linux-api-headers=${_archpkgver}")
conflicts=('linux-api-headers')
replaces=('linux-api-headers')
source=("http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz.sign")
        #"http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz"
        #"http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz.sign")
sha256sums=('f483e595e0ad9a9d1b3afd20e4ecb0b798cf16eb31e79a7b99311eb9c061032a'
            'SKIP')
validpgpkeys=(
              '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
)

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  if [ "${_pkgbasever}" != "${_pkgver}" ]; then
    patch -p1 -i "${srcdir}/patch-${_pkgbasever}-${_pkgver}"
  fi
}

build() {
  cd "${srcdir}/${_srcname}"

  make mrproper
  make headers_check
}

package() {
  cd "${srcdir}/${_srcname}"
  make INSTALL_HDR_PATH="${pkgdir}"/usr headers_install

  # use headers from libdrm
  rm -r "${pkgdir}"/usr/include/drm
  
  # clean-up unnecessary files generated during install
  find "${pkgdir}" \( -name .install -o -name ..install.cmd \) -delete
}
