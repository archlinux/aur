# Maintainer: Raimar Bühmann ( raimar [at] buehmann [dot] de )
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Austin ( doorknob60 [at] gmail [dot] com )
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=broadcom-wl
pkgver=6.30.223.271
pkgrel=6

pkgdesc='Broadcom 802.11abgn hybrid Linux networking device driver'
url='https://www.broadcom.com/support/802.11'
arch=('i686' 'x86_64')
license=('custom')

depends=('linux')
makedepends=('linux-headers')

source=('modprobe.d'
        'license.patch'
	'wl_linux.c.patch'
        'linux47.patch'
	'linux48.patch'
	'linux411.patch'
	'linux412.patch'
)

source_i686=("https://docs.broadcom.com/docs-and-downloads/docs/linux_sta/hybrid-v35-nodebug-pcoem-${pkgver//./_}.tar.gz")
source_x86_64=("https://docs.broadcom.com/docs-and-downloads/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-${pkgver//./_}.tar.gz")
sha256sums=('b4aca51ac5ed20cb79057437be7baf3650563b7a9d5efc515f0b9b34fbb9dc32'
            '2f70be509aac743bec2cc3a19377be311a60a1c0e4a70ddd63ea89fae5df08ac'
            '583335a6edb2ed1094977c401643d3e60471c6bc5c3ea81f45910a9cccb06032'
            '30ce1d5e8bf78aee487d0f3ac76756e1060777f70ed1a9cf95215c3a52cfbe2e'
            '833af3b209d6a101d9094db16480bda2ad9a85797059b0ae0b13235ad3818e9c'
            '977b1663ce055860b0b60e7cf882658f507d81909f935d1a8b785896f64176e8'
            'a3d13e8abb96ad440dbfae29acae82d31d1ced2ea62052f1efb2c3c4add347ce')
sha256sums_i686=('4f8b70b293ac8cc5c70e571ad5d1878d0f29d133a46fe7869868d9c19b5058cd')
sha256sums_x86_64=('5f79774d5beec8f7636b59c0fb07a03108eef1e3fd3245638b20858c714144be')

install=install

_kernmajor="$(pacman -Q linux | sed -r 's/linux ([0-9]*.[0-9]*).*/\1/')"
_kernver="$(</usr/lib/modules/extramodules-"$_kernmajor"-ARCH/version)"

prepare() {
  patch -p1 -i license.patch
  patch -p1 -i wl_linux.c.patch
  patch -p1 -i linux47.patch
  patch -p1 -i linux48.patch
  patch -p1 -i linux411.patch
  patch -p1 -i linux412.patch

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
