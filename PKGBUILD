# Maintainer: graysky <graysky AT archlinux DOT org>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: Armin K. <krejzi at email dot com>
# Contributor: Austin ( doorknob60 [at] gmail [dot] com )
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=broadcom-wl-ck
pkgver=6.30.223.271
pkgrel=96
_pkgdesc='Broadcom 802.11abgn hybrid Linux networking device driver for linux-ck.'
_extramodules="extramodules-ck"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"
pkgdesc="${_pkgdesc}"
arch=('x86_64')
url='https://www.broadcom.com/support/download-search/?pf=Wireless+LAN+Infrastructure'
license=('custom')
depends=('linux-ck>=4.19' 'linux-ck<4.20')
makedepends=('linux-ck-headers>=4.19' 'linux-ck-headers<4.20')
#replaces=()
#groups=('ck-generic')
source=(
  "https://docs.broadcom.com/docs-and-downloads/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-${pkgver//./_}.tar.gz"
  '001-null-pointer-fix.patch'
  '002-rdtscl.patch'
  '003-linux47.patch'
  '004-linux48.patch'
  '005-debian-fix-kernel-warnings.patch'
  '006-linux411.patch'
  '007-linux412.patch'
  '008-linux415.patch'
  'modprobe.d'
)
sha256sums=('5f79774d5beec8f7636b59c0fb07a03108eef1e3fd3245638b20858c714144be'
            '32e505a651fdb9fd5e4870a9d6de21dd703dead768c2b3340a2ca46671a5852f'
            '4ea03f102248beb8963ad00bd3e36e67519a90fa39244db065e74038c98360dd'
            '30ce1d5e8bf78aee487d0f3ac76756e1060777f70ed1a9cf95215c3a52cfbe2e'
            '09d709df0c764118ca43117f5c096163d9669a28170da8476d4b8211bd225d2e'
            '2306a59f9e7413f35a0669346dcd05ef86fa37c23b566dceb0c6dbee67e4d299'
            '5bc12cb57712e6a944dff1c90de50135c2508085d8497ab99284ccccdb35c32b'
            'a3d13e8abb96ad440dbfae29acae82d31d1ced2ea62052f1efb2c3c4add347ce'
            '08c24157cf3b93b60e67e600d1d90223447361990df09acfb00281d79813d167'
            'b4aca51ac5ed20cb79057437be7baf3650563b7a9d5efc515f0b9b34fbb9dc32')

prepare() {
  patch -Np1 -i "$srcdir/001-null-pointer-fix.patch"
  patch -Np1 -i "$srcdir/002-rdtscl.patch"
  patch -Np1 -i "$srcdir/003-linux47.patch"
  patch -Np1 -i "$srcdir/004-linux48.patch"
  patch -Np1 -i "$srcdir/005-debian-fix-kernel-warnings.patch"
  patch -Np1 -i "$srcdir/006-linux411.patch"
  patch -Np1 -i "$srcdir/007-linux412.patch"
  patch -Np1 -i "$srcdir/008-linux415.patch"
  
  sed -i -e '/BRCM_WLAN_IFNAME/s/eth/wlan/' src/wl/sys/wl_linux.c
}

build() {
  make -C /usr/lib/modules/"${_kernver}"/build M=`pwd`
}

package() {
  install -Dm644 wl.ko "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"
  # makepkg does not do this automatically for this pkg so do it here
  gzip "${pkgdir}/usr/lib/modules/${_extramodules}/wl.ko"
  install -Dm644 lib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 modprobe.d "${pkgdir}/usr/lib/modprobe.d/broadcom-wl_ck.conf"
}

# vim: ts=2 sw=2 et:
