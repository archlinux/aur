# $Id: PKGBUILD 237944 2015-04-23 05:19:11Z allan $
# Maintainer (Arch): Allan McRae <allan@archlinux.org>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

# toolchain build order: linux-libre-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-libre-api-headers
_pkgbasever=4.0-gnu
_pkgver=${_pkgbasever}

_srcname=linux-${_pkgbasever%-*}
_archpkgver=${_pkgver%-*}
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64' 'mips64el')
url="http://www.gnu.org/software/libc"
license=('GPL2')
provides=( "linux-api-headers=${_archpkgver}")
conflicts=('linux-api-headers')
replaces=( 'linux-api-headers')
source=("http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz.sign")
        #"http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz"
        #"http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz.sign")
md5sums=('87edb0b508abb8d8484bc08daa2ee96d'
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
