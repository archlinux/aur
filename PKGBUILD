# Maintainer: Alfredo Luque <skipeaksrc@gmail.com>

pkgname=vpnc-juniper-git
pkgver=0.5.3r550jnpr1
pkgrel=3
pkgdesc="VPNC With Juniper patchset"
url="https://github.com/ndpgroup/vpnc"
license=('GPL')
depends=('libgcrypt' 'openssl' 'iproute2')
makedepends=('git')
provides=('vpnc')
conflicts=('vpnc')
optdepends=('openresolv: Let vpnc manage resolv.conf')
arch=('i686' 'x86_64')
source=("${pkgname}::git+https://github.com/ndpgroup/vpnc.git#branch=master"
        "vpnc-scripts::git://git.infradead.org/users/dwmw2/vpnc-scripts.git#commit=df5808b"
        'vpnc.conf'
        'vpnc-juniper.conf'
        'vpnc@.service')
backup=('etc/vpnc/default.conf')
md5sums=('SKIP'
         'SKIP'
         'a3f4e0cc682f437e310a1c86ae198e45'
         '804ffae88091bc9795b2ef6cffbd7c80'
         '09cfded435c43dd2adb5a8863bd74cfc')

prepare() {
  # Build hybrid support
  sed -i 's|^#OPENSSL|OPENSSL|g' ${pkgname}/Makefile

  # fix resolvconf location for community/openresolv
  sed -i 's|/sbin/resolvconf|/usr&|g' vpnc-scripts/vpnc-script
}

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="$pkgdir" PREFIX=/usr SBINDIR=/usr/bin install
  install -Dm644 "$srcdir"/vpnc.conf "$pkgdir"/etc/vpnc/default.conf
  install -Dm644 "$srcdir"/vpnc-juniper.conf "$pkgdir"/etc/vpnc/default-juniper.conf
  install -Dm755 "$srcdir"/vpnc-scripts/vpnc-script "$pkgdir"/etc/vpnc/vpnc-script
  install -Dm644 "$srcdir"/vpnc@.service "$pkgdir"/usr/lib/systemd/system/vpnc@.service
}

