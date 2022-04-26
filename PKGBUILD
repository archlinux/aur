# Maintainer: Jiří Klimeš <blueowl@centrum.cz>
# Submitter: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: K. Hampf <k.hampf@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=xmltv
pkgver=1.1.2
pkgrel=1
pkgdesc="Set of utilities to download tv listings and format them in xml"
arch=('any')
url="http://xmltv.org/wiki/"
license=('GPL')
depends=('perl-date-manip>=5.42'
         'perl-file-slurp'
         'perl-json'
         'perl-libwww>=5.65'
         'perl-term-readkey'
         'perl-xml-libxml'
         'perl-xml-parser>=2.34'
         'perl-xml-treepp'
         'perl-xml-twig>=3.28'
         'perl-xml-writer>=0.60'

         'perl-archive-zip'              # for tv_grab_eu_epgdata, tv_grab_uk_bleb
         'perl-cgi'                      # for tv_pick_cgi, core module until 5.20.3
         'perl-data-dump'                # for tv_grab_it_dvb
         'perl-timedate'                 # for tv_grab_ar and some other grabbers
         'perl-timedate'                 # for several grabbers
         'perl-datetime-format-iso8601'  # for tv_grab_zz_sdjson_sqlite
         'perl-datetime-format-sqlite'   # for tv_grab_zz_sdjson_sqlite
         'perl-datetime-format-strptime' # for tv_grab_eu_epgdata
         'perl-datetime-timezone'        # for tv_grab_fr
         'perl-dbd-sqlite'               # for tv_grab_zz_sdjson_sqlite
         'perl-dbi'                      # for tv_grab_zz_sdjson_sqlite
         'perl-digest-sha1'              # for tv_grab_zz_sdjson_sqlite
         'perl-file-homedir'             # for tv_grab_zz_sdjson_sqlite
         'perl-file-which'               # for tv_grab_zz_sdjson_sqlite
         'perl-html-parser'              # for many of the grabbers
         'perl-html-tree'                # for many of the grabbers
         'perl-http-cache-transparent'   # for several grabbers
         'perl-http-cookies'             # for several grabbers
         'perl-http-message'             # for tv_grab_eu_epgdata
         'perl-io-stringy'               # for some of the grabbers
         'perl-list-moreutils'           # for tv_grab_zz_sdjson_sqlite
         'perl-lwp-protocol-https'       # for tv_grab_fi, tv_grab_huro, tv_grab_zz_sdjson
         'perl-lwp-useragent-determined' # for tv_grab_zz_sdjson_sqlite
         'perl-soap-lite>=0.67'          # for tv_grab_na_dd
         'perl-time-piece'               # for tv_grab_huro
         'perl-tk'                       # for tv_check
         'perl-tk-tablematrix'           # for tv_check
         'perl-uri'                      # for some grabbers
         # enable perl-url-encode when AUR perl-url-encode package is fixed
         #'perl-url-encode'               # for tv_grab_pt_vodafone
         'perl-xml-dom'                   # for tv_grab_is
         'perl-xml-libxslt'               # for tv_grab_is
)

optdepends=('perl-file-chdir: testing grabbers'
            'perl-json-xs: faster JSON handling'
            'perl-lingua-preferred: helps with multilingual listings'
            'perl-perlio-gzip: can make tv_imdb a bit faster'
            'perl-term-progressbar: displays pretty progress bars'
            'perl-unicode-string: improved character handling in tv_to_latex'
            'perl-uri-escape-xs: faster URI handling')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/XMLTV/${pkgname}/archive/v${pkgver}.tar.gz"
)
sha256sums=('2ca763fcb8735d66a10bde005f7cf993436e6e5d4b6748ef9dca6626d5f43255')

build() {
  cd "$pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  yes | /usr/bin/perl Makefile.PL PREFIX=/usr INSTALLDIRS=vendor
  make
}

check() {
  cd "$pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
}

package() {
  cd "$pkgname-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="$pkgdir"

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}
