# Maintainer: Yifan Xu <foo(at)example(dot)org>
# Contributor: bar <bar(at)example(dot)org>
_kver=$(uname -r)
_pkgbase=rcraid
pkgname=rcraid-dkms
pkgver=17.2.1
pkgrel=2
pkgdesc="AMD AM4 socket X370 chipset motherbroad NVMe/SATA RAID driver (DKMS)"
arch=('i686' 'x86_64')
url="https://www.amd.com/en/support/chipsets/amd-socket-am4/x370"
license=('GPL2')
depends=('dkms')
makedepends=('linux-headers>=5.6')
# conflicts=("${_pkgbase}")
# install=${pkgname}.install
source=('manual://raid_linux_driver_8_01_00_039_public.zip'
        'dkms.conf'
        'linux-4.15.patch'
		'linux-5.4.patch'
		'linux-5.6.patch')
md5sums=('f5692d2ef952f8c903af90cdd9eb3ce6'
        '3a14dcc84daf257a62727bcde1882edf'
        '461866e715a1fded49a3f7c043a173d7'
		'cac98de11cc5bd61fff72ff1c8cf363d'
		'bd1ef2b6bcefaec0abf7a832e937f01a')

prepare() {
    if [ ! -d ${_pkgbase}-${pkgver} ]; then
        mkdir ${_pkgbase}-${pkgver}
    fi

    cp driver_sdk/src/* ${_pkgbase}-${pkgver}
}

build() {
  cd ${_pkgbase}-${pkgver}

  patch -p1 -i "${srcdir}"/linux-4.15.patch
  patch -p1 -i "${srcdir}"/linux-5.4.patch
  patch -p1 -i "${srcdir}"/linux-5.6.patch

  make KVERS="${_kver}" all
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  cd ${_pkgbase}-${pkgver}

  install -Dm644 rcraid.ko "${pkgdir}"/usr/lib/modules/"${_kver}"/kernel/drivers/scsi/rcraid.ko

  make clean
  cp -r * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
