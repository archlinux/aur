# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
pkgname=openstack-guest-agents-unix
pkgver=1.39.1
epoch=1
pkgrel=1
pkgdesc="This is the Unix Guest Agent for Openstack"
arch=('i686' 'x86_64')
url="https://github.com/rackerlabs/openstack-guest-agents-unix"
license=('GPL')
depends=('python2-simplejson' 'python2-crypto' 'patchelf' 'python2-xenstore')
makedepends=('git')
options=(!emptydirs)
source=("$pkgname::git://github.com/rackerlabs/${pkgname%-git}#tag=$pkgver" 'default-source.patch')
md5sums=('SKIP'
         'b23830e3ea12db0b5e9568df02629e7e')

prepare(){
  cd "$srcdir/$pkgname"
  git apply $srcdir/default-source.patch
  find . -name \*.py -exec sed -i '1s/python$/&2/' {} +
}

build() {
  cd "$srcdir/$pkgname"
  sh autogen.sh
  ./configure CC=gcc --prefix=/usr --sbindir=/usr/bin --bindir=/usr/bin
  make sbindir=/usr/bin/
}

package() {
  make -C "$srcdir/$pkgname" bintar
  tar -C "$pkgdir" -xf $srcdir/$pkgname/nova-agent-Linux-$CARCH-${pkgver}.tar.gz
  install -dm755 $pkgdir/usr/bin
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
  install -Dm644 $pkgname/scripts/systemd/nova-agent.service \
    $pkgdir/usr/lib/systemd/system/nova-agent.service
}

# vim:set ts=2 sw=2 et:
