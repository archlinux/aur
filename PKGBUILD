# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Frank Vanderham <twelve.eighty (at) gmail.>
# Contributor: yafengabc <yafengabc (at) gmail.>

pkgname=broadcom-wl-dkms-248
pkgver=6.30.223.248
pkgrel=1
pkgdesc="Broadcom 802.11 Linux STA wireless driver Old version for some bcm card kernel crash"
arch=('i686' 'x86_64')
url="https://www.broadcom.com/support/?gid=1"
license=('custom')
depends=('dkms')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS Arch kernel')
conflicts=('broadcom-wl' 'broadcom-wl-dkms')
backup=('etc/modprobe.d/broadcom-wl-dkms.conf')
install=broadcom-wl-dkms.install
source=('broadcom-wl-dkms.conf'
        'dkms.conf.in'
        'license.patch'
        'linux-recent.patch'
        'gcc.patch'
        'fix-linux4.2.patch'
        )

source_i686=("https://www.broadcom.com/docs/linux_sta/hybrid-v35-nodebug-pcoem-${pkgver//./_}.tar.gz")
source_x86_64=("https://www.broadcom.com/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-${pkgver//./_}.tar.gz")
sha256sums=('b97bc588420d1542f73279e71975ccb5d81d75e534e7b5717e01d6e6adf6a283'
            'c59c3ccf5238fe93cc671e6fa2f6614c0bfec073dc79bfda4d14e3a5be96eac8'
            '2f70be509aac743bec2cc3a19377be311a60a1c0e4a70ddd63ea89fae5df08ac'
            '922a5b183643db256d03b147f051fbf2032be8104412a661296efe4f781f2e59'
            'b07ce80f2e079cce08c8ec006dda091f6f73f158c8a62df5bac2fbabb6989849'
            '0e82973d37d12f678618413d21dd772e619a85a9e6827550c41ea458a94362d6')
sha256sums_i686=('b196543a429c22b2b8d75d0c1d9e6e7ff212c3d3e1f42cc6fd9e4858f01da1ad')
sha256sums_x86_64=('3d994cc6c05198f4b6f07a213ac1e9e45a45159899e6c4a7feca5e6c395c3022')

prepare() {
  cd "${srcdir}"
  patch -p1 -i linux-recent.patch
  patch -p1 -i license.patch
  patch -p1 -i gcc.patch
  patch -p1 -i fix-linux4.2.patch
 
  sed -e "s/@PACKAGE_VERSION@/${pkgver}/" dkms.conf.in > dkms.conf

  sed -i -e "/BRCM_WLAN_IFNAME/s:eth:wlan:" src/wl/sys/wl_linux.c
}

package() {
  cd "${srcdir}"

  local dest="${pkgdir}/usr/src/${pkgname/-dkms/}-${pkgver}"

  mkdir -p "${dest}"
  cp -RL src lib Makefile dkms.conf "${dest}"
  chmod a-x "${dest}/lib/LICENSE.txt" # Ships with executable bits set

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -rs "${dest}/lib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m 644 broadcom-wl-dkms.conf "${pkgdir}/etc/modprobe.d/broadcom-wl-dkms.conf"
}

# vim:set ts=2 sw=2 et:

