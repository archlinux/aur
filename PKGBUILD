# $Id: PKGBUILD 243061 2015-08-06 04:26:14Z allan $
# Maintainer (Arch): Allan McRae <allan@archlinux.org>
# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

# toolchain build order: linux-libre-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-libre-api-headers
_pkgbasever=4.1-gnu
_pkgver=4.1.4-gnu

_srcname=linux-${_pkgbasever%-*}
_archpkgver=${_pkgver%-*}
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL2')
provides=("linux-api-headers=${_archpkgver}")
conflicts=('linux-api-headers')
replaces=('linux-api-headers')
source=("http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz.sign"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz"
        "http://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz.sign")
validpgpkeys=(
              '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
)
sha512sums=('84101bdfb42c6b54a13925b86e0ddc9fdfc40c187251d1655b7d4f51d82dbff8f392ebd534dc720b5ce67cbc553e636b5c45c2a7b65bd85767cb831f6b88e4b7'
            'SKIP'
            '9ef80f5ac37b2e633f38b5ff16548d1da5c6d14faea3d5d4be62f8f8c177326bf402c1b52275b78af6961c4aaa1cbfb9cab43de7cb855059ed07715c4218a7c2'
            'SKIP')

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
