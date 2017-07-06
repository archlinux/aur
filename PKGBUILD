# $Id: PKGBUILD 127137 2015-02-04 23:02:34Z bluewind $
# Maintainer: Daniel Wallace <danielwallace at code gtmanfred com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Krzysztof Raczkowski <raczkow@gnu-tech.pl>

pkgbase=xe-guest-utilities
pkgname=('xe-guest-utilities' 'xenstore')
pkgver=6.2.0
pkgrel=2
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
md5sums=('98644da204b18b695ede0ba45f4df22d'
         '9bd39e95384056069f7faa870a28413a'
         '95064a7d8a32cd3aaca14e3b48c69599'
         '173fed74c76817702b062ed653002db0'
         '3252fa21362fd55246f9d8b923070151'
         'cadad1eb5b1fa6d5fe463a1a0fd82fff')

prepare(){
  patch -d $srcdir/$pkgname-$pkgver -Np1 -i $srcdir/ip_address.patch
  bsdtar xf "$srcdir/$pkgname-$pkgver/xenstore-sources.tar.bz2"
}

build() {
  export CC=gcc
  CFLAGS='-Wall -Wstrict-prototypes -Wno-unused-local-typedefs -Wno-sizeof-pointer-memaccess'
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
