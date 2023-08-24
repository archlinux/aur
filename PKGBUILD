# Maintainer: Yuji Hagiwara <yuuzi41 at gmail dot com>

pkgname=openvswitch-dpdk
pkgver=3.2.0
pkgrel=1
pkgdesc="Production Quality, Multilayer Open Virtual Switch, with DPDK feature"
url="http://openvswitch.org"
license=('APACHE')
arch=(x86_64)
install=openvswitch.install
source=("http://openvswitch.org/releases/openvswitch-$pkgver.tar.gz"
	docs-add-nowarn-region-option-to-tables.patch
	docs-run-tbl-preprocessor-in-manpage-check-rule.patch
	openvswitch.tmpfiles
	ovsdb-server.service
	ovs-vswitchd.service)
depends=('openssl' 'libcap-ng' 'dpdk')
makedepends=('python-six')
optdepends=('python-six')
provides=('openvswitch')
options=('debug')
sha256sums=('ce917e78cc0addff834af3c4f6b8d2d5071a407ecc553a71ad532d4e015914c4'
            'bc7d115c1843b95fe3a8036d30c9e06e0971812ced3893c1dfc0cb3f494083ba'
            '3170b2f8cf05c8aba2de3325394d30de6720c7d186fc4fac66257edddcd6fa55'
            'e8dc21e50fc886bfd6aa55991bdb3cb66907e11b071045452bb12de01a3ecbd9'
            'fa2412b81c77921418131a4f6fd38956f50ffcc7b908ec91f94d3607a05d060b'
            '412a8d9a2d71f61b915d5e29c0ba44baae7770f564d885f99460b27a4cf1d398')

prepare() {
  cd "$srcdir/openvswitch-$pkgver"
  patch -Np1 -i "${srcdir}/docs-add-nowarn-region-option-to-tables.patch"
  patch -Np1 -i "${srcdir}/docs-run-tbl-preprocessor-in-manpage-check-rule.patch"
  sed -i \
    -e 's|$(sysconfdir)/bash_completion.d|/usr/share/bash-completion/completions|g' \
    Makefile.am
}

build() {
  cd "$srcdir/openvswitch-$pkgver"
  ./boot.sh
  export CFLAGS="$CFLAGS -ffat-lto-objects"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --with-rundir=/run/openvswitch \
    --sbindir=/usr/bin \
    --with-dpdk=static \
    PYTHON=/usr/bin/python2
  make
}

package() {
  cd "$srcdir/openvswitch-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 "$srcdir"/openvswitch.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/openvswitch.conf"
  install -Dm0644 "$srcdir"/ovsdb-server.service "$pkgdir/usr/lib/systemd/system/ovsdb-server.service"
  install -Dm0644 "$srcdir"/ovs-vswitchd.service "$pkgdir/usr/lib/systemd/system/ovs-vswitchd.service"
  install -dm0755 "$pkgdir/etc/openvswitch"
  rm -rf "$pkgdir"/run
}
