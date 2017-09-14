# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=atlantis-dkms
_modname=atlantis
pkgver=1.6.7.0
pkgrel=1
pkgdesc="aQuantia AQtion Driver for the aQuantia Multi-Gigabit PCI Express Family of Ethernet Adapters (DKMS version)"
license=('GPL2')
arch=('x86_64')
depends=('dkms')
url='https://www.aquantia.com'
source=("https://www.aquantia.com/wp-content/uploads/2017/05/linux.zip"
	'max_mtu.patch'
        'dkms.conf.in')
sha256sums=('0965a4a5b1d805e8c626921529e1f817b501dc012b941cd972b737849f8df579'
            'ed569131286c4a3dd6ddc7dc910c3d61e4ba9396712d8460c3a68ba7dd3b59ed'
            '8a3de5bb0e74463b6cc7a576ca4b73bf5f211ae6e2e431a550b9e6b2bc321859')

package() {
  # unpack sources
  install -dm755 "${pkgdir}/usr/src/${_modname}-${pkgver}/"
  bsdtar --strip-components 1 --exclude .git --exclude netif.sh -xv -C "${pkgdir}/usr/src/${_modname}-${pkgver}" -f ${srcdir}/20170505_Linux_${pkgver}/src/Aquantia-AQtion-1.6.7.tar.gz

  # apply patch to fix the bug (Ethernet Adapter MTU can't be set over 1500 bytes)
  cd ${pkgdir} && patch -p2 < "${srcdir}"/max_mtu.patch

  # update and copy dkms.conf
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf.in" > "${pkgdir}/usr/src/${_modname}-${pkgver}/dkms.conf"
}
