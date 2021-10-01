# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=perl-latexml
_realname=LaTeXML
pkgver=0.8.6
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
sha512sums=('6025e524515a40a3d1678cb679924ca3dd33a8063a7552e33ff1d00941ff71f28eb6d1d04de890dd51077eb3716890a6294b9a19696e6d514fc05d24cb7ed06d')

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
