# Maintainer: theokonos
# Contirbutors: dekart811

_pkgbase=veeamsnap
pkgname=veeamsnap
pkgver=6.0.2.1168
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="https://repository.veeam.com/backup/linux/agent"
license=('GPLv2')
depends=('dkms' 'rpmextract')
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=("${url}/rpm/el/8/x86_64/veeamsnap-${pkgver}-1.noarch.rpm"
        'dkms.conf')
sha256sums=('0fce3c4fdab9a42b97c71fa16970ffc3f84c89f400cadd807f1247af8e519376'
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
