# Maintainer: Patrick Brennan <cGF0cmljay5icmVubmFuQGJzZGZpcnN0LmNvbQ==>

pkgname=edimax_ac1750_8814au-dkms
_pkgbase=${pkgname%-*}
_reponame=rtl8814au_EW7833UAC
pkgver=4.3.21_17997.20160531
pkgrel=4
pkgdesc="Kernel module for the Edimax AC1750 USB3 802.11ac adapter."
url="https://github.com/bsdfirst/rtl8814au_EW7833UAC"
license=("GPL")

arch=('armv7h' 'i686' 'x86_64')
makedepends=('git')
depends=('dkms')

source=("git+https://github.com/bsdfirst/${_reponame}.git#branch=v${pkgver}" '0001-Add-support-for-kernel-4.11.9.patch' '0001-Try-to-fix-kernel-4.12.0-build.patch' 'dkms.conf' '8814au.conf')
sha256sums=('SKIP'
            '03f60ddc06f0d6499b40414ff428b39b99dabe43e3701cbf05bb05c25be97dbb'
            'e6e6578aab82b5a4c92075bcfe58cd226db4ff4a0461aa318af32b3dfccc3782'
            'be3fe911a32f3235c87653cb2652c3fc14d044e5c869ace46bac1c25750b001b'
            '730626f2e4cc11762a679fe314ebc0e6f6ca5430aaed980a1e2aba7bf85f2f49')
install="${pkgname}.install"

prepare() {
  sed -e "s/@PKGNAME@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${srcdir}/dkms.conf"
      
  (cd ${srcdir}/${_reponame} \
  && git apply -v ${srcdir}/0001-Add-support-for-kernel-4.11.9.patch \
  && git apply -v ${srcdir}/0001-Try-to-fix-kernel-4.12.0-build.patch \
  )
}

package() {
  install -D "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
#   install -D "${srcdir}/8814au.conf" "${pkgdir}/etc/modprobe.d/8814au.conf"
  cp -r "${srcdir}/${_reponame}"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
}
