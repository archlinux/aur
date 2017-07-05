# Maintainer: graysky <graysky AT archlinux DOT org>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Austin ( doorknob60 [at] gmail [dot] com )
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=broadcom-wl-ck
pkgver=6.30.223.271
pkgrel=45
_pkgdesc='Broadcom 802.11abgn hybrid Linux networking device driver for linux-ck.'
_extramodules="extramodules-4.11-ck"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
pkgdesc="${_pkgdesc}"
arch=('i686' 'x86_64')
url='https://www.broadcom.com/support/802.11'
license=('custom')
depends=('linux-ck>=4.11' 'linux-ck<4.12')
makedepends=('linux-ck-headers>=4.11' 'linux-ck-headers<4.12')
#replaces=()
#groups=('ck-generic')
source=(
        '001-null-pointer-fix.patch'
        '002-rdtscl.patch'
        '003-linux47.patch'
        '004-linux48.patch'
        '005-debian-fix-kernel-warnings.patch'
        '006-linux411.patch'
        'modprobe.d'
        )
source_i686=("https://docs.broadcom.com/docs-and-downloads/docs/linux_sta/hybrid-v35-nodebug-pcoem-${pkgver//./_}.tar.gz")
source_x86_64=("http://www.broadcom.com/docs-and-downloads/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-${pkgver//./_}.tar.gz")
sha256sums=('32e505a651fdb9fd5e4870a9d6de21dd703dead768c2b3340a2ca46671a5852f'
            '4ea03f102248beb8963ad00bd3e36e67519a90fa39244db065e74038c98360dd'
            '30ce1d5e8bf78aee487d0f3ac76756e1060777f70ed1a9cf95215c3a52cfbe2e'
            '09d709df0c764118ca43117f5c096163d9669a28170da8476d4b8211bd225d2e'
            '2306a59f9e7413f35a0669346dcd05ef86fa37c23b566dceb0c6dbee67e4d299'
            '5bc12cb57712e6a944dff1c90de50135c2508085d8497ab99284ccccdb35c32b'
            'b4aca51ac5ed20cb79057437be7baf3650563b7a9d5efc515f0b9b34fbb9dc32')
sha256sums_i686=('4f8b70b293ac8cc5c70e571ad5d1878d0f29d133a46fe7869868d9c19b5058cd')
sha256sums_x86_64=('5f79774d5beec8f7636b59c0fb07a03108eef1e3fd3245638b20858c714144be')

install=readme.install

prepare() {
  patch -Np1 -i $srcdir/001-null-pointer-fix.patch
  patch -Np1 -i $srcdir/002-rdtscl.patch
  patch -Np1 -i $srcdir/003-linux47.patch
  patch -Np1 -i $srcdir/004-linux48.patch
  patch -Np1 -i $srcdir/005-debian-fix-kernel-warnings.patch
  patch -Np1 -i $srcdir/006-linux411.patch
}


build() {
  sed -i -e "/BRCM_WLAN_IFNAME/s:eth:wlan:" -i src/wl/sys/wl_linux.c
  #sed -i -e "/EXTRA_LDFLAGS/s|\$(src)/lib|/usr/lib/${pkgname}|" Makefile
  make -C /usr/lib/modules/"${_kernver}"/build M=`pwd`
}

package() {
  install -Dm644 wl.ko "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"

  # makepkg does not do this automatically for this pkg so do it here
  gzip -9 "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"
  install -Dm644 lib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 modprobe.d "${pkgdir}/usr/lib/modprobe.d/broadcom-wl_ck.conf"
}
