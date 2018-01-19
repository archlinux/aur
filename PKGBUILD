_pkgbase=bcm2079x-i2c
pkgname=${_pkgbase}
pkgver=1
pkgrel=1
pkgdesc="DKMS module for bcm2079x-i2c NFC driver used in Lenovo ThinkPad T440s. Not useful as-is, because the userspace portion is only make for Android so far."
arch=('i686' 'x86_64')
url="https://patchwork.kernel.org/patch/2847848/"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
#install=${pkgname}.install
source=("${_pkgbase}.c"
        'bcm2079x.h'
        'dkms.conf'
        'Makefile')
md5sums=(SKIP SKIP SKIP SKIP)

build() {
  mkdir -p include/linux/platform_data/
  mv bcm2079x.h include/linux/platform_data/
}

package() {
    find
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
