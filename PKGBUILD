# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Austin ( doorknob60 [at] gmail [dot] com )
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=broadcom-wl
pkgver=6.30.223.248
pkgrel=6

pkgdesc='Broadcom 802.11abgn hybrid Linux networking device driver'
url='http://www.broadcom.com/support/802.11/linux_sta.php'
arch=('i686' 'x86_64')
license=('custom')

depends=('linux')
makedepends=('linux-headers')

source=('modprobe.d'
        'license.patch'
        'linux-recent.patch'
        'gcc.patch')
source_i686=("http://www.broadcom.com/docs/linux_sta/hybrid-v35-nodebug-pcoem-${pkgver//./_}.tar.gz")
source_x86_64=("http://www.broadcom.com/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-${pkgver//./_}.tar.gz")

sha256sums=('b4aca51ac5ed20cb79057437be7baf3650563b7a9d5efc515f0b9b34fbb9dc32'
            '2f70be509aac743bec2cc3a19377be311a60a1c0e4a70ddd63ea89fae5df08ac'
            '922a5b183643db256d03b147f051fbf2032be8104412a661296efe4f781f2e59'
            'b07ce80f2e079cce08c8ec006dda091f6f73f158c8a62df5bac2fbabb6989849')
sha256sums_i686=('b196543a429c22b2b8d75d0c1d9e6e7ff212c3d3e1f42cc6fd9e4858f01da1ad')
sha256sums_x86_64=('3d994cc6c05198f4b6f07a213ac1e9e45a45159899e6c4a7feca5e6c395c3022')

install=install

_kernmajor="$(pacman -Q linux | sed -r 's/linux ([0-9]*.[0-9]*).*/\1/')"
_kernver="$(</usr/lib/modules/extramodules-"$_kernmajor"-ARCH/version)"

prepare() {
  patch -p1 -i linux-recent.patch
  patch -p1 -i license.patch
  patch -p1 -i gcc.patch

  sed -e "/BRCM_WLAN_IFNAME/s:eth:wlan:" \
      -i src/wl/sys/wl_linux.c
}

build() {
  make -C /usr/lib/modules/${_kernver}/build M=`pwd`
}

package() {
  install -Dm644 wl.ko "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-ARCH/wl.ko
  gzip                 "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-ARCH/wl.ko

  install -Dm644 lib/LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 modprobe.d "$pkgdir"/usr/lib/modprobe.d/broadcom-wl.conf
}
