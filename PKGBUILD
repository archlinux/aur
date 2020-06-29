# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=perl-latexml
_realname=LaTeXML
pkgver=0.8.4
pkgrel=2
pkgdesc="LaTeX to XML converter"
arch=('any')
license=('custom')
url="http://dlmf.nist.gov/LaTeXML/"
depends=('perl-pod-parser' 'perl-parse-recdescent' 'perl-text-unidecode'
	 'imagemagick' 'perl-xml-libxml' 'perl-json-xs' 'perl-xml-libxslt'
	 'db' 'texlive-core' 'perl-image-size' 'perl-file-which'
	 'perl-libwww' 'perl-io-string' 'perl-archive-zip')
options=('!emptydirs')
source=("http://dlmf.nist.gov/$_realname/releases/$_realname-$pkgver.tar.gz")
sha512sums=('1799a89c98d3457d813735679ade005645bfa8a1b264aab08f9baf8fc4fc91cb00978e6168d26a614beefdaac4b3dcbe63ba3504ae69a2c889e28d177bc6b01c')

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
