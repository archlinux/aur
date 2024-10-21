# Maintainer: 4censord <mail@business-insulting.de>
pkgver=v7.21.0.r52.gbf10940
pkgrel=1
pkgbase=xe-guest-utilities-xcp-ng-git
pkgname=('xe-guest-utilities-xcp-ng-git' 'xenstore-xcp-ng-git')
pkgdesc="XenServer Tools, XCP-NG fork version, built from git"

url="https://github.com/xcp-ng/xe-guest-utilities"
license=('BSD')

arch=('x86_64')
depends=('lsb-release')
makedepends=('go-pie')
conflicts=('xe-guest-utilities')
source=('xe-guest-utilities::git+https://github.com/xcp-ng/xe-guest-utilities.git#branch=7.30.0-8.2'
  '0001-imports.patch'
  'xe-linux-distribution.service')
sha256sums=('SKIP'
            '5dc2d7aeeab582d78ff76accf5cfd303fa5806bb4b54ba00610a45770cf803fc'
            'a5f725a26140fb4e2d3ec60c32be78ab224a6cc1f7f176fafa65529175b7d731')

prepare(){
  cd $srcdir/xe-guest-utilities
  patch --forward --strip=1 --input="${srcdir}/0001-imports.patch"
  rm -rf vendor
}

pkgver() {
  cd xe-guest-utilities
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/xe-guest-utilities
  go mod tidy
  go mod download
  go mod vendor
  make PRODUCT_MAJOR_VERSION=7 PRODUCT_MINOR_VERSION=30 PRODUCT_MICRO_VERSION=0 NUMERIC_BUILD_NUMBER=$(git rev-parse HEAD | cut -b 1-7)
}

package_xenstore-xcp-ng-git() {
  conflicts=('xenstore')
  install -Dm444 $srcdir/xe-guest-utilities/LICENSE   $pkgdir/usr/share/licenses/xenstore-xcp-ng/LICENSE

  install -Dm544 $srcdir/xe-guest-utilities/build/stage/usr/bin/xenstore $pkgdir/usr/bin/xenstore
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


package_xe-guest-utilities-xcp-ng-git() {
  conflicts=('xe-guest-utilities')
  depends=('xenstore-xcp-ng' 'bash')
  install -Dm444 $srcdir/xe-guest-utilities/LICENSE   $pkgdir/usr/share/licenses/xe-guest-utilities-xcp-ng/LICENSE
  mkdir -p $pkgdir/var/cache/xe-linux-distribution

  install -Dm544 $srcdir/xe-guest-utilities/build/stage/usr/sbin/xe-daemon $pkgdir/usr/bin/xe-daemon
  install -Dm544 $srcdir/xe-guest-utilities/build/stage/usr/sbin/xe-linux-distribution $pkgdir/usr/bin/xe-linux-distribution
  install -Dm644 $srcdir/xe-guest-utilities/build/stage/etc/udev/rules.d/z10_xen-vcpu-hotplug.rules $pkgdir/etc/udev/rules.d/z10_xen-vcpu-hotplug.rules
  install -Dm644 $srcdir/xe-linux-distribution.service $pkgdir/usr/lib/systemd/system/xe-linux-distribution.service
}
