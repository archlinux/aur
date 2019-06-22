# Maintainer: Amish <contact at via dot aur>

pkgname=squidanalyzer
pkgver=6.6
pkgrel=5
pkgdesc="Squid proxy native log analyser and reports generator"
arch=('any')
url='http://squidanalyzer.darold.net/'
license=('GPL')
options=('!emptydirs' 'purge')
depends=('cron' 'perl')
source=("http://downloads.sourceforge.net/project/squid-report/squid-report/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.cron"
	daterange.patch
       )
md5sums=('d70f5c747d0666a92410fdca734c494b'
         'e8c2657f7a2eb544d6c246f5eca02e8b'
         '6849c57c38774b2c115f5421c7a3fd4f')
backup=(
    'etc/squidanalyzer/excluded'
    'etc/squidanalyzer/included'
    'etc/squidanalyzer/network-aliases'
    'etc/squidanalyzer/squidanalyzer.conf'
    'etc/squidanalyzer/user-aliases'
    )

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i ../daterange.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL \
            INSTALLDIRS=vendor \
	    QUIET=1 \
	    LOGFILE=/var/log/squid/access.log \
	    BINDIR=/usr/bin \
	    CONFDIR=/etc/${pkgname} \
	    HTMLDIR=/srv/http/${pkgname} \
	    BASEURL=/${pkgname} \
	    MANDIR=/usr/share/man/man3 \
	    DOCDIR=/usr/share/doc/${pkgname} \
	    DESTDIR="$pkgdir"
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  install -dm755 "${pkgdir}"/etc/cron.daily
  install -Dm700 ../${pkgname}.cron "${pkgdir}"/etc/cron.daily/${pkgname}
}
