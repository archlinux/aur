# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=perl-latexml
_realname=LaTeXML
pkgver=0.8.2
pkgrel=3
pkgdesc="LaTeX to XML converter"
arch=('any')
license=('custom')
url="http://dlmf.nist.gov/LaTeXML/"
depends=('perl' 'perl-parse-recdescent' 'perl-text-unidecode'
	 'imagemagick6' 'perl-xml-libxml' 'perl-json-xs' 'perl-xml-libxslt'
	 'db' 'texlive-core' 'perl-image-size' 'perl-file-which'
	 'perl-libwww' 'perl-io-string' 'perl-archive-zip')
options=('!emptydirs')
source=("http://dlmf.nist.gov/$_realname/releases/$_realname-$pkgver.tar.gz")
sha512sums=('521134f7b3820c2cbf8fbf60778f03f40b8bb6900311d82da986e8dd3ee1a0d518ef9bb4b852bd95a5bac758bb65b159218602f4adf454c77dfbf6280a4bd1a4')

build() {
  cd ${_realname}-$pkgver

  # install module in vendor directories.
  perl Makefile.PL INSTALLDIRS=vendor INSTALLVENDORBIN=/usr/bin INSTALLVENDORSCRIPT=/usr/bin TEXMF=/usr/share/texmf
  make
}

package() {
  cd ${_realname}-$pkgver
  make install DESTDIR="$pkgdir"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name perllocal.pod -delete
  find "$pkgdir" -name .packlist -delete
  # add liense file
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  # add manual
  install -Dm644 manual.pdf "$pkgdir"/usr/share/$pkgname/doc/manual.pdf
}
