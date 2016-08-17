# $Id: PKGBUILD 165400 2016-03-06 17:17:18Z pierre $
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Pedro Martinez-Julia (pedromj@um.es)
# Contributor: Matt Monaco <net 0x01b dgbaley27>

pkgname=openvswitch-git
pkgver=2.5.0.r80.g042326c
pkgrel=1
epoch=1
pkgdesc="Production Quality, Multilayer Open Virtual Switch"
url="http://openvswitch.org"
license=('APACHE')
arch=(x86_64 i686)
install=openvswitch.install
source=("$pkgname::git+https://github.com/openvswitch/ovs.git#branch=branch-2.5"
	openvswitch.tmpfiles
	ovsdb-server.service
	ovs-vswitchd.service)
depends=('openssl' 'libcap-ng')
makedepends=('python2' 'git')
optdepends=('python2')
md5sums=('SKIP'
         '0534c19ed27d2ff8c6b32d87c07bc76f'
         '3a1b706c1adfb1166b58bc9d65ea396f'
         '4ec9c05448d6910c5fd581e964518ef7')
provides=('openvswitch')
conflicts=('openvswitch')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  sed -i \
    -e 's|$(sysconfdir)/bash_completion.d|/usr/share/bash-completion/completions|g' \
    Makefile.am
  sed -i -r -e 's,python,&2,;t' vtep/ovs-vtep
  sed -i -r -e 's,python,&2,;t' ovn/utilities/ovn-docker-overlay-driver
  sed -i -r -e 's,python,&2,;t' ovn/utilities/ovn-docker-underlay-driver
}

build() {
  cd $pkgname
  ./boot.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-rundir=/run/openvswitch \
    --sbindir=/usr/bin \
    PYTHON=/usr/bin/python2
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm0644 $srcdir/openvswitch.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/openvswitch.conf"
  install -Dm0644 $srcdir/ovsdb-server.service "$pkgdir/usr/lib/systemd/system/ovsdb-server.service"
  install -Dm0644 $srcdir/ovs-vswitchd.service "$pkgdir/usr/lib/systemd/system/ovs-vswitchd.service"
  install -dm0755 "$pkgdir/etc/openvswitch"
  rm -rf $pkgdir/run
}
