# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=perl-latexml
_realname=LaTeXML
pkgver=0.8.7
pkgrel=1
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
sha512sums=('3936ec54ce74aa4486b8be7ba3f9810ce76f5660a7434c7d291dc87cacf23181169698efffa5d0860411cbbadf87cd47f94541a59ced0a8aca7aa82dc92bc8dd')

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
