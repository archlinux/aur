# Maintainer: Julian Brost <julian@0x4a42.net>
# Maintainer: Christopher Kreft <email@christopherkreft.de>

pkgname=check-nwc-health
pkgver=12.13.2.2
pkgrel=1
pkgdesc="Monitoring check for various network equipment"
arch=('any')
url='https://labs.consol.de/nagios/check_nwc_health/'
license=('GPL-2.0-only' 'Artistic-2.0')
depends=('perl' 'perl-json' 'perl-json-xs' 'perl-file-slurp')
makedepends=('git' 'autoconf' 'automake')
optdepends=('perl-net-snmp: checks based on SNMP'
            'perl-soap-lite: checks based on UPnP'
            'perl-xml-libxml: checks based on UPnP'
            'perl-xml-treebuilder: FritzBox checks')
conflicts=('check-nwc-health-git')
source=("${pkgname}::git+https://github.com/lausser/check_nwc_health.git#tag=${pkgver}"
        "GLPlugin::git+https://github.com/lausser/GLPlugin.git")
sha256sums=('1bc19c3a3ed16c0563bc743ded07d329d4a04f80ef0e8e10a62dbf45cd5114ed'
            'SKIP')
# GLPlugin is pinned via the superproject tag's submodule commit; checksums for the
# superproject verify that exact commit, so a separate checksum here is redundant.

prepare() {
  cd "$pkgname"

  git config submodule.GLPlugin.url "$srcdir/GLPlugin"
  git -c protocol.file.allow=always submodule update --init

  autoreconf
}

build() {
  cd "$srcdir/GLPlugin"

  perl Makefile.PL INSTALLDIRS=vendor
  make

  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --libexecdir=/usr/lib/monitoring-plugins --disable-standalone
  make
}

check() {
  cd "$srcdir/GLPlugin"
  make test

  cd "$srcdir/$pkgname"
  export PERL5LIB="$srcdir/GLPlugin/blib/lib:$srcdir/GLPlugin/blib/arch:$PERL5LIB"
  ./plugins-scripts/check_nwc_health --help > /dev/null
}

package() {
  cd "$srcdir/GLPlugin"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}
