# $Id: PKGBUILD 127137 2015-02-04 23:02:34Z bluewind $
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Daniel Wallace <danielwallace at code gtmanfred com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Krzysztof Raczkowski <raczkow@gnu-tech.pl>

pkgbase=xe-guest-utilities
pkgname=('xe-guest-utilities' 'xenstore')
pkgver=6.2.0
pkgrel=4
pkgdesc="Citrix XenServer Tools"
arch=('i686' 'x86_64')
url="http://citrix.com/English/ps2/products/product.asp?contentID=683148&ntref=hp_nav_US"
license=('GPL' 'LGPL')
makedepends=(python2)
options=(staticlibs)
source=("https://sources.archlinux.org/other/community/$pkgbase/${pkgbase}_${pkgver}-1120.tar.gz"
      	'ip_address.patch'
        'xe-linux-distribution.service'
        'xe-daemon.service'
        'proc-xen.mount'
        'tmpfile')
sha512sums=('6b9b59facf6cce6eff4586423e11e82dcb0666584832a4fe2c545fb39596d96741ecb3a2c8df11a6de57c8d1e2060b2000443c4e889ac8f501d28b186dcd3d5b'
            '05e75229319904a20325850fc35bb66f84811b82efe458dad42fff5d5a31e8cf9d23d9864c8f152d1b6b782cdddf286d2e7ffb05e952e28694b6f27579f04313'
            '1673e9f88675fbe884b29a5a17e8d930ec37e244065becea81ab270becd5b846b23aefb12fe67abaf7b9c4527c0a9d7e5da6aa6750208575686202eff673ec96'
            '746dcaa4ed4784b7c27d2ad98a5f1f2fa2aed02f3df375b6c2bb1551822dee445eecef260081cb567a7b507a57a5b2278430033b545a4cd56e3bdfd53d427d2f'
            '6afdf16e32bb837faf6333334f86855a746f1f46fee9673a4fddc62eecf41f9856bc34397807203c6f5071f0b1ce74532214084042154585c0d39514450db25c'
            '39dfab424375fb05d973883e9ec6b9a58041aeb5d104e9c58e41ef0f358e027702d2e8ae6fc64a9d752b089497584aeaf691d2dfa3dee61fa5738ec5d04eb423')

prepare(){
  patch -d $srcdir/$pkgname-$pkgver -Np1 -i $srcdir/ip_address.patch
  bsdtar xf "$srcdir/$pkgname-$pkgver/xenstore-sources.tar.bz2"
}

build() {
  export CC=gcc
  CFLAGS='-Wall -Wstrict-prototypes -Wno-unused-local-typedefs -Wno-sizeof-pointer-memaccess -Wno-maybe-uninitialized -Wno-stringop-truncation -Xlinker "--allow-multiple-definition"'
  export CFLAGS
  export PYTHON=python2
  cd "$srcdir/uclibc-sources"
  make -C tools/include
  make -C tools/libxc
  make -C tools/xenstore
}

package_xenstore() {
  depends=(bzip2 lzo zlib xz)
  export CFLAGS+='-Wall -Wstrict-prototypes -Wno-unused-local-typedefs -Wno-sizeof-pointer-memaccess'
  if [[ $CARCH == x86_64 ]]; then
    export LIBLEAFDIR_x86_64=lib
  fi
  for f in include libxc xenstore; do
    [[ ! -d "$srcdir"/uclibc-sources/tools/$f ]] && continue
    make -C ""$srcdir"/uclibc-sources/tools/$f" DESTDIR="$pkgdir" SBINDIR=/usr/bin install
  done
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm644 "COPYING.LGPL" "$pkgdir/usr/share/licenses/$pkgname/COPYING.LGPL"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 $srcdir/proc-xen.mount "$pkgdir/usr/lib/systemd/system/proc-xen.mount"
  install -Dm644 $srcdir/tmpfile "$pkgdir/usr/lib/tmpfiles.d/30-xenstored.conf"
  rm -r "$pkgdir"/var
}

package_xe-guest-utilities(){
  cd "$srcdir/$pkgname-$pkgver"
  depends=('xenstore' 'bash' 'lsb-release')
  install -Dm755 xe-linux-distribution "$pkgdir/usr/bin/xe-linux-distribution"
  install -Dm755 xe-update-guest-attrs "$pkgdir/usr/bin/xe-update-guest-attrs"
  install -Dm755 xe-daemon "$pkgdir/usr/bin/xe-daemon"
  install -Dm644 xen-vcpu-hotplug.rules "$pkgdir/usr/lib/udev/rules.d/10-xen-vcpu-hotplug.rules"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 $srcdir/xe-daemon.service "$pkgdir/usr/lib/systemd/system/xe-daemon.service"
  install -Dm644 $srcdir/xe-linux-distribution.service "$pkgdir/usr/lib/systemd/system/"
  sed -i 's:sbin:bin:' $pkgdir/usr/bin/xe-daemon
}

# vim:set ts=2 sw=2 et:
