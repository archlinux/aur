# Maintainer: Amish <contact at via dot aur>

pkgname=squidanalyzer
_gitrev=43ba618
pkgver=6.7b
pkgrel=2
pkgdesc="Squid proxy native log analyser and reports generator"
arch=('any')
url='http://squidanalyzer.darold.net/'
license=('GPL')
options=('!emptydirs' 'purge')
depends=('perl')
#source=("http://downloads.sourceforge.net/project/squid-report/squid-report/${pkgver}/${pkgname}-${pkgver}.tar.gz"
source=("squidanalyzer-${pkgver}-${_gitrev}.tar.gz::https://github.com/darold/${pkgname}/archive/${_gitrev}.tar.gz"
        'squidanalyzer.service'
        'squidanalyzer.timer')
sha256sums=('482a791ac420109a7780b1a06664b2eb8105d26618e875ec89a1dacad8e1c7fa'
            '8fcdedc61fd2d4ff6b7890bd98ec0c170300419c6b15990fa37c1cca01fb9f3d'
            'ce4bcd17582a96ddaf9fe3bbcf299105a1af99e9092aac97c544695047ef31e5')
backup=(
    'etc/squidanalyzer/excluded'
    'etc/squidanalyzer/included'
    'etc/squidanalyzer/network-aliases'
    'etc/squidanalyzer/squidanalyzer.conf'
    'etc/squidanalyzer/url-aliases'
    'etc/squidanalyzer/user-aliases'
    )
install=squidanalyzer.install

build() {
  cd "${srcdir}/${pkgname}-${_gitrev}"*
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
  cd "${srcdir}/${pkgname}-${_gitrev}"*
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "${srcdir}/${pkgname}-${_gitrev}"*
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/system ../squidanalyzer.{service,timer}
}
