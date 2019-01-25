# Maintainer: Code Imp  <code_imp@bk.ru>

_pkgbase=veeamsnap
pkgname=veeamsnap
pkgver=3.0.0.865
pkgrel=1
pkgdesc="Veeam Agent for Linux kernel modules (DKMS)"
arch=('i686' 'x86_64')
url="https://www.github.com/veeam/veeamsnap"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
install=${pkgname}.install
#source=('veeamsnap.tar.gz'
source=( "${url}/archive/master.zip"
        'dkms.conf')
md5sums=('825d985806cd0796a84d14d41c024093'
         'c5ca0388f175e9ed8df5ebaaf0b917c2')

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
  
  #hot fix for gcc 8.2
  sed -e "s/inline/__attribute__((unused))/" \
      -i ${_pkgbase}-master/source/log_format.h
	  
  #hot fix for k 4.20
  sed -e "s/time_to_tm/time64_to_tm/" \
      -i ${_pkgbase}-master/source/log.c
	  
  # Copy sources (including Makefile)
  cp -r ${_pkgbase}-master/source/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}

