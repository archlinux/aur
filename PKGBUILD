# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

# Based on linux-api-headers package

# toolchain build order: linux-libre-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-libre-api-headers
_pkgbasever=4.5-gnu
_pkgver=4.5.5-gnu

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
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz.sign"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz.sign")
sha256sums=('c37a135518d5a69b26bae8441bc20e5a5ea87d3228cfe72f75a714cff730a84e'
            'SKIP'
            'c7cf4e3440ec6052a58e147609ce08cf518057c21ad2af6497ee8967734ff20f'
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
