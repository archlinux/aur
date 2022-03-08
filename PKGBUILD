pkgname=iwlwifi-beacon-lts
pkgver=5.15.26
pkgrel=1
pkgdesc="Intel wireless chips driver (with beacon timeout patch)"
arch=('i686' 'x86_64')
url="https://bugzilla.kernel.org/show_bug.cgi?id=203709"
license=('GPL')
makedepends=('git' 'linux-lts-headers' 'xz')
provides=('iwlwifi')
conflicts=('iwlwifi')

source=(https://cdn.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-$pkgver.tar.xz
        beacon_timeout.patch
        dkms.conf)
sha256sums=('SKIP'
            'f9aff9e30c5468d37a1434c59ac550bf0afeeee54707aca50bc49343efca40a6'
            'fc018a306271537199a15ef5636c8f4ff8860536f95c4bcc01347ec23b4ee277')

prepare() {
  cd "${srcdir}/linux-$pkgver"

  patch -p1 < "${srcdir}/beacon_timeout.patch"
}

package() {
  cd "${srcdir}/linux-${pkgver}"

  install -d "${pkgdir}/usr/src/iwlwifi-beacon-${pkgver}/"
  cp -r "${srcdir}/linux-${pkgver}/drivers/net/wireless/intel/iwlwifi"/* "${pkgdir}/usr/src/iwlwifi-beacon-${pkgver}/"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/iwlwifi-beacon-${pkgver}/dkms.conf"

  sed -e "s/@_PKGBASE@/iwlwifi-beacon/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/iwlwifi-beacon-${pkgver}/dkms.conf"
}
