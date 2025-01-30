# Maintainer: cstamas <cstamas@crysys.hu>

_pkgbase=arm-gnu-toolchain
_target_arch=arm
_vendor=none
_target_toolchain=linux-gnueabihf
_target=${_target_arch}-${_vendor}-${_target_toolchain}
_link_target=${_target_arch}-${_target_toolchain}
_pkgver=14.2.rel1
_pkgdate=20241210

_pkgname=${_pkgbase}-${_target}
_pkgname_novendor=${_pkgbase}-${_link_target}
pkgname=${_pkgname}-bin
pkgver=${_pkgver}.${_pkgdate}
pkgrel=1
pkgdesc="GNU Toolchain for AArch32 GNU/Linux target with hard float (arm-none-linux-gnueabihf)"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')
depends=(binutils)
makedepends=(findutils)
provides=("${_pkgname_novendor}")
options=(!emptydirs !strip staticlibs)
source=("https://developer.arm.com/-/media/Files/downloads/gnu/${_pkgver}/binrel/${_pkgbase}-${_pkgver}-${arch}-${_target_arch}-${_vendor}-${_target_toolchain}.tar.xz")
sha256sums=('32301a5a33aab47810837cdab848a5a513ca22804d3168d3ada5833828b07912')

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/*/* ${pkgdir}/usr

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  mv ${pkgdir}/usr/license.txt "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  rm -f ${pkgdir}/usr/*-manifest.txt
  rm -rf ${pkgdir}/usr/lib64
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share/{doc,gcc-*,gdb,info,locale}
  rm -rf ${pkgdir}/usr/share/man/{man5,man7}
  rm -rf ${pkgdir}/usr/lib/bfd-plugins

  cd ${pkgdir}
  find ./usr/bin -name "${_target}*" -type f | xargs -I{} sh -c 'target="{}"; link_name=$(echo "{}" | sed -r '"'""s/${_target}/${_link_target}/g""'"'); ln -rs "${target}" "${link_name}"'
}
