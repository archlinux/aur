# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=perl-latexml
_realname=LaTeXML
pkgver=0.8.3
pkgrel=2
pkgdesc="LaTeX to XML converter"
arch=('any')
license=('custom')
url="http://dlmf.nist.gov/LaTeXML/"
depends=('perl' 'perl-parse-recdescent' 'perl-text-unidecode'
	 'imagemagick' 'perl-xml-libxml' 'perl-json-xs' 'perl-xml-libxslt'
	 'db' 'texlive-core' 'perl-image-size' 'perl-file-which'
	 'perl-libwww' 'perl-io-string' 'perl-archive-zip')
options=('!emptydirs')
source=("http://dlmf.nist.gov/$_realname/releases/$_realname-$pkgver.tar.gz")
sha512sums=('b1dac0e4d0e484d39e83d47c071e411b896a4ca3946a7cf42ca3f7087450636773d4722db0c2d88b52c917a6629c054cd41c7abfc99de4c2364372f1898b1511')

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
