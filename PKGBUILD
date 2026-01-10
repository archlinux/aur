# Maintainer: Christopher Kreft <email@christopherkreft.de>

pkgname=check-nwc-health-git
pkgver=12.10.1.r0.g52ca174
pkgrel=1
pkgdesc="Monitoring plugin for various network equipment (git version)"
arch=('any')
url='https://labs.consol.de/nagios/check_nwc_health/'
license=('GPL-2.0-only')
depends=('perl' 'perl-json' 'perl-json-xs' 'perl-file-slurp')
makedepends=('git' 'autoconf' 'automake')
optdepends=('perl-net-snmp: checks based on SNMP'
            'perl-soap-lite: checks based on UPnP'
            'perl-xml-libxml: checks based on UPnP'
            'perl-xml-treebuilder: FritzBox checks')
provides=('check-nwc-health')
conflicts=('check-nwc-health')
source=("${pkgname}::git+https://github.com/lausser/check_nwc_health.git"
        "GLPlugin::git+https://github.com/lausser/GLPlugin.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

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

