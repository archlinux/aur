# Maintainer: dekart811

_pkgbase=veeamsnap
pkgname=veeamsnap
pkgver=3.0.2.1190
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="http://repository.veeam.com/backup/linux/agent"
license=('GPL2')
depends=('dkms' 'rpmextract')
conflicts=("${_pkgbase}")
install=${pkgname}.install
source=( "${url}/rpm/el/7/x86_64/veeamsnap-${pkgver}-1.noarch.rpm"
        'dkms.conf')
md5sums=('6b2018bc488763885488eeb79df3367f'
         '23381bcf3c992e0b6467be681bbc751a')

build() {
  msg "build..."
  rpmextract.sh veeamsnap-${pkgver}-1.noarch.rpm
}

package() {
  # Install
  msg2 "pkgdir: "${pkgdir}
  #msg2 "Starting make install..."
  #make DESTDIR="${pkgdir}" install

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  
  # Copy sources (including Makefile)
  cp -r ${srcdir}/usr/src/${_pkgbase}-${pkgver}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}

