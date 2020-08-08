# Maintainer: dekart811

_pkgbase=veeamsnap
pkgname=veeamsnap
pkgver=4.0.1.2365
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="http://repository.veeam.com/backup/linux/agent"
license=('GPLv2')
depends=('dkms' 'rpmextract')
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=("${url}/rpm/el/7/x86_64/veeamsnap-${pkgver}-1.noarch.rpm"
        'dkms.conf')
sha256sums=('439fa156a9166125b43d4a4395ae720571a43d95ea6987dc96f8b70f618ad1c5'
            '7d2a83f28b7c41797fadf06f29ab124ae63d662f2dba4e81e1eb4d1ef15bee7c')

build() {
  msg "build..."
  rpmextract.sh veeamsnap-${pkgver}-1.noarch.rpm
}

package() {
  # Install
  msg2 "pkgdir: "${pkgdir}
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${srcdir}/usr/src/${_pkgbase}-${pkgver}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
