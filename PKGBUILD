# Maintainer: Chris Osgood <chris_github@functionalfuture.com>

_pkgbase=applesmc-next
pkgname=${_pkgbase}-dkms
pkgver=0.1.3
pkgrel=1
pkgdesc='Updated applesmc driver with charge threshold'
arch=('x86_64')
url='https://gurumeditation.org/1256/applesmc-next-battery-charge-thresholds-for-linux-on-apple-hardware/'
license=('GPL2')
depends=('dkms')
optdepends=('tlp: battery charge threshold support')
makedepends=()
provides=('APPLESMC-MODULE' 'SBS-MODULE')

source=(
   "https://github.com/c---/applesmc-next/archive/refs/tags/${pkgver}.tar.gz"
)

sha256sums=(
   '5e578ceba9e776d21771639ab12cc793ec6b957e9ebf4ebcf660984a3f3bd01c'
)

package() {
   (cd "${_pkgbase}-${pkgver}"/applesmc && make TARGET="${pkgdir}/usr/src/${_pkgbase}-${pkgver}/applesmc" srcinstall)
   (cd "${_pkgbase}-${pkgver}"/sbs && make TARGET="${pkgdir}/usr/src/${_pkgbase}-${pkgver}/sbs" srcinstall)

   install -Dm755 "${_pkgbase}-${pkgver}"/45-apple "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
   install -Dm644 "${_pkgbase}-${pkgver}"/dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
   install -Dm644 "${_pkgbase}-${pkgver}"/Makefile "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

   mkdir -p "${pkgdir}/usr/share/tlp/bat.d"
   ln -sf "/usr/src/${_pkgbase}-${pkgver}/45-apple" "${pkgdir}/usr/share/tlp/bat.d/45-apple"

   sed -i -e "s/@PKGNAME@/${pkgname}/" \
       -e "s/@_PKGBASE@/${_pkgbase}/" \
       -e "s/@PKGVER@/${pkgver}/" \
       "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
