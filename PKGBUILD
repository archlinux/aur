# Maintainer: Amish <contact at via dot aur>

pkgname=squidanalyzer
_gitrev=e55c24b
pkgver=6.7b
pkgrel=9
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
sha256sums=('96738907429c57cf1e33df19d58c94ab96f7a9635b050f222347b4da73366da9'
            '276c5d0a794ef59665d7ab7c7f5cb130c7987a70a2faffc33fbb58ee89a28b7e'
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
