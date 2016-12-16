# Maintainer: Raimar Bühmann ( raimar [at] buehmann [dot] de )
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Austin ( doorknob60 [at] gmail [dot] com )
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=broadcom-wl-lts
pkgver=6.30.223.271
pkgrel=2

pkgdesc='Broadcom 802.11abgn hybrid Linux networking device driver for LTS kernal'
url='https://www.broadcom.com/support/802.11'
arch=('i686' 'x86_64')
license=('custom')

depends=('linux-lts')
makedepends=('linux-lts-headers')

source=('modprobe.d'
        'license.patch'
	'wl_linux.c.patch'
)
source_i686=("https://docs.broadcom.com/docs-and-downloads/docs/linux_sta/hybrid-v35-nodebug-pcoem-6_30_223_271.tar.gz")
source_x86_64=("https://docs.broadcom.com/docs-and-downloads/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-6_30_223_271.tar.gz")
sha256sums=('b4aca51ac5ed20cb79057437be7baf3650563b7a9d5efc515f0b9b34fbb9dc32'
            '2f70be509aac743bec2cc3a19377be311a60a1c0e4a70ddd63ea89fae5df08ac'
            '583335a6edb2ed1094977c401643d3e60471c6bc5c3ea81f45910a9cccb06032')
sha256sums_i686=('4f8b70b293ac8cc5c70e571ad5d1878d0f29d133a46fe7869868d9c19b5058cd')
sha256sums_x86_64=('5f79774d5beec8f7636b59c0fb07a03108eef1e3fd3245638b20858c714144be')

install=install

_kernmajor="$(pacman -Q linux-lts | sed -r 's/linux-lts ([0-9]*.[0-9]*).*/\1/')"
_kernver="$(</usr/lib/modules/extramodules-"$_kernmajor"-lts/version)"

prepare() {
  patch -p1 -i license.patch
  patch -p1 -i wl_linux.c.patch

  sed -e "/BRCM_WLAN_IFNAME/s:eth:wlan:" \
      -i src/wl/sys/wl_linux.c
}

build() {
  make -C /usr/lib/modules/${_kernver}/build M=`pwd`
}

package() {
  install -Dm644 wl.ko "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-lts/wl.ko
  gzip                 "$pkgdir"/usr/lib/modules/extramodules-"$_kernmajor"-lts/wl.ko

  install -Dm644 lib/LICENSE.txt "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 modprobe.d "$pkgdir"/usr/lib/modprobe.d/broadcom-wl-lts.conf
}
