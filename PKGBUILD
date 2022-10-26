# Maintainer: 4censord <mail@business-insulting.de>
pkgver=7.22.0
pkgrel=4

pkgbase=xe-guest-utilities-xcp-ng
pkgname=('xe-guest-utilities-xcp-ng' 'xenstore-xcp-ng')
pkgdesc="XenServer Tools, XCP-NG fork version"

url="https://github.com/xcp-ng/xe-guest-utilities"
license=('BSD')

arch=('x86_64')
depends=('lsb-release')
makedepends=('go-pie')
conflicts=('xe-guest-utilities')
source=(https://github.com/xcp-ng/xe-guest-utilities/archive/v$pkgver.tar.gz
  'xe-linux-distribution.service'
  '001-go1.16.patch'
  '002-Fix-archlinux-guestmetric-for-ip-interfaces.patch')
sha256sums=('f1ef8445b11e5c03e9c8f347e243da06d54b09d407b835d2a16db08964ee9f55'
            'a5f725a26140fb4e2d3ec60c32be78ab224a6cc1f7f176fafa65529175b7d731'
            'c4cba12a7bf65021625f2591ee3905e6e6c29428c8d28eae406d64e8551cd2ab'
            '382fe26273cd66675425f506c3055a63ff827c2c805a634cb1593ad70be5383c')

prepare(){
  cd $srcdir/xe-guest-utilities-$pkgver
  patch --forward --strip=1 --input="${srcdir}/001-go1.16.patch"
  patch -p1 --input="${srcdir}/002-Fix-archlinux-guestmetric-for-ip-interfaces.patch"
}


build() {
  cd $srcdir/xe-guest-utilities-$pkgver
  go mod tidy
  go mod download
  make PRODUCT_MAJOR_VERSION=7 PRODUCT_MINOR_VERSION=22 PRODUCT_MICRO_VERSION=0 NUMERIC_BUILD_NUMBER=3
}

package_xenstore-xcp-ng() {
  conflicts=('xenstore')
  install -Dm444 $srcdir/xe-guest-utilities-$pkgver/LICENSE   $pkgdir/usr/share/licenses/xenstore-xcp-ng/LICENSE

  install -Dm544 $srcdir/xe-guest-utilities-$pkgver/build/stage/usr/bin/xenstore $pkgdir/usr/bin/xenstore
  mkdir -p $pkgdir/var/cache/xe-linux-distribution
  
  cd $pkgdir
  ln -s /usr/bin/xenstore usr/bin/xenstore-chmod
  ln -s /usr/bin/xenstore usr/bin/xenstore-exists 
  ln -s /usr/bin/xenstore usr/bin/xenstore-list
  ln -s /usr/bin/xenstore usr/bin/xenstore-ls
  ln -s /usr/bin/xenstore usr/bin/xenstore-read   
  ln -s /usr/bin/xenstore usr/bin/xenstore-rm     
  ln -s /usr/bin/xenstore usr/bin/xenstore-watch
  ln -s /usr/bin/xenstore usr/bin/xenstore-write  
}


package_xe-guest-utilities-xcp-ng() {
  conflicts=('xe-guest-utilities')
  depends=('xenstore-xcp-ng' 'bash')
  install -Dm444 $srcdir/xe-guest-utilities-$pkgver/LICENSE   $pkgdir/usr/share/licenses/xe-guest-utilities-xcp-ng/LICENSE
  mkdir -p $pkgdir/var/cache/xe-linux-distribution

  install -Dm544 $srcdir/xe-guest-utilities-$pkgver/build/stage/usr/sbin/xe-daemon $pkgdir/usr/bin/xe-daemon
  install -Dm544 $srcdir/xe-guest-utilities-$pkgver/build/stage/usr/sbin/xe-linux-distribution $pkgdir/usr/bin/xe-linux-distribution
  install -Dm644 $srcdir/xe-guest-utilities-$pkgver/build/stage/etc/udev/rules.d/z10_xen-vcpu-hotplug.rules $pkgdir/etc/udev/rules.d/z10_xen-vcpu-hotplug.rules
  install -Dm644 $srcdir/xe-linux-distribution.service $pkgdir/usr/lib/systemd/system/xe-linux-distribution.service
}
