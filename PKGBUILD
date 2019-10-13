# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Andrey Vihrov <andrey.vihrov@gmail.com>
# Contributor: Frank Vanderham <twelve.eighty@gmail.com>
# Contributor: Jacob McSwain <jacob.a.mcswain@gmail.com>
# Contributor: Thomas Braby <thomas@mykolab.com>

pkgname=broadcom-wl-ck-dkms
pkgver=6.30.223.271
pkgrel=1
pkgdesc='Broadcom 802.11 Linux STA wireless driver'
arch=(x86_64)
url='https://www.broadcom.com/support/download-search/?pf=Wireless+LAN+Infrastructure'
license=(custom)
depends=(dkms)
install=broadcom-wl-ck-dkms.install
source=('broadcom-wl-ck-dkms.conf'
        'dkms.conf.in'
        '001-null-pointer-fix.patch'
        '002-rdtscl.patch'
        '003-linux47.patch'
        '004-linux48.patch'
        '005-debian-fix-kernel-warnings.patch'
        '006-linux411.patch'
        '007-linux412.patch'
        '008-linux415.patch'
        '009-fix_mac_profile_discrepancy.patch'
        "https://docs.broadcom.com/docs-and-downloads/docs/linux_sta/hybrid-v35_64-nodebug-pcoem-${pkgver//./_}.tar.gz")
sha256sums=('b97bc588420d1542f73279e71975ccb5d81d75e534e7b5717e01d6e6adf6a283'
            'f1df2aa45416b4ac61ea1501602bd1f205a416e1bf1664f23b3761a84d035b26'
            '32e505a651fdb9fd5e4870a9d6de21dd703dead768c2b3340a2ca46671a5852f'
            '4ea03f102248beb8963ad00bd3e36e67519a90fa39244db065e74038c98360dd'
            '30ce1d5e8bf78aee487d0f3ac76756e1060777f70ed1a9cf95215c3a52cfbe2e'
            '09d709df0c764118ca43117f5c096163d9669a28170da8476d4b8211bd225d2e'
            '2306a59f9e7413f35a0669346dcd05ef86fa37c23b566dceb0c6dbee67e4d299'
            '5bc12cb57712e6a944dff1c90de50135c2508085d8497ab99284ccccdb35c32b'
            'a3d13e8abb96ad440dbfae29acae82d31d1ced2ea62052f1efb2c3c4add347ce'
            '08c24157cf3b93b60e67e600d1d90223447361990df09acfb00281d79813d167'
            '4e73e50653bb612946edd34bf31ca5a0b80f632d47a08766ae6042880927c98d'
            '5f79774d5beec8f7636b59c0fb07a03108eef1e3fd3245638b20858c714144be')

prepare() {
  sed -i -e '/BRCM_WLAN_IFNAME/s/eth/wlan/' src/wl/sys/wl_linux.c
  sed -i -e "/EXTRA_LDFLAGS/s|\$(src)/lib|/usr/lib/$pkgname|" Makefile
  sed -e "s/@PACKAGE_VERSION@/$pkgver/" dkms.conf.in > dkms.conf
  sed -n -e '/Copyright/,/SOFTWARE\./{s/^ \* //;p}' src/wl/sys/wl_linux.c
  sed -i 's/get_ds()/KERNEL_DS/g' src/wl/sys/wl_iw.c
  sed -i 's/get_ds()/KERNEL_DS/g' src/wl/sys/wl_cfg80211_hybrid.c
}

package() {
  local dest="$pkgdir/usr/src/${pkgname/-dkms/}-$pkgver"
  install -Dm644 Makefile "$dest/Makefile"
  install -Dm644 dkms.conf "$dest/dkms.conf"
  install -Dm644 -t "$dest/patches" *.patch
  cp -a src "$dest"

  install -Dm644 lib/wlc_hybrid.o_shipped \
    "$pkgdir/usr/lib/$pkgname/wlc_hybrid.o_shipped"
  install -Dm644 broadcom-wl-ck-dkms.conf \
    "$pkgdir/usr/lib/modprobe.d/broadcom-wl-ck-dkms.conf"

  install -Dm644 lib/LICENSE.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.shipped"
}

# vim: ts=2 sw=2 et:
