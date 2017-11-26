#Maintainer: ajs124 < aur AT ajs124 DOT de>

pkgname=tgt-rdma
pkgver=1.0.72
pkgrel=1
pkgdesc="iSCSI Target STGT with iSER/RDMA support"
arch=('x86_64' 'i686' 'arm')
url="http://stgt.sourceforge.net/"
license=('GPL')
depends=('perl-config-general' 'libxslt' 'libaio' 'rdma-core')
makedepends=('docbook-xsl' 'docbook-xml')
optdepends=('sg3_utils')
conflicts=('tgt')
provides=('tgt')
backup=('etc/tgt/targets.conf')
source=(https://github.com/fujita/tgt/archive/v$pkgver.tar.gz)
sha512sums=('9dce5f61561c53a11581da21e913e06df50b098c868f65ac43524ffcb8fea731e3d6bcacb6e3f798da5b1e295277e9b1c6023a1208ba39a552dd0a2a502948a5')

build() {
  cd "$srcdir/${pkgname/-rdma/}-$pkgver"
  sed -i 's_http://docbook.sourceforge.net/release/xsl/current_/usr/share/xml/docbook/xsl-stylesheets-1.79.2_g' doc/Makefile
  make sbindir=/usr/bin ISCSI_RDMA=1 ISCSI=1 PREFIX="$pkgdir"
}

package() {
  cd "$srcdir/${pkgname/-rdma/}-$pkgver"
  make DESTDIR="$pkgdir" sbindir=/usr/bin install
  install -Dm644 "$srcdir/${pkgname/-rdma}-$pkgver/scripts/tgtd.service" "$pkgdir/usr/lib/systemd/system/tgtd.service"
}

# vim:set ts=2 sw=2 et:
