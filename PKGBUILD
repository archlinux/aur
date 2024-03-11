# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname="perl-latexml"
_realname=LaTeXML
pkgver=0.8.8
pkgrel=1
pkgdesc="LaTeX to XML converter"
arch=("any")
license=("custom")
url="http://dlmf.nist.gov/LaTeXML/"
depends=("perl-pod-parser"
         "perl-parse-recdescent"
         "perl-text-unidecode"
         "imagemagick"
         "perl-xml-libxml"
         "perl-json-xs"
         "perl-xml-libxslt"
         "db"
         "texlive-core"
         "perl-image-size"
         "perl-file-which"
         "perl-libwww"
         "perl-io-string"
         "perl-archive-zip")
options=("!emptydirs")
source=("https://dlmf.nist.gov/$_realname/releases/$_realname-$pkgver.tar.gz")
b2sums=('2660e6a009fa5c3520098201da5113011886031e2336154fc0a218cdf7bbfae40cb2b0b5ebbbae66a8aa25145898a91375339815d021c02727d1a506b2296e13')

build(){
 cd "$_realname-$pkgver"

 # install module in vendor directories.
 perl Makefile.PL \
      INSTALLDIRS=vendor \
      INSTALLVENDORBIN=/usr/bin \
      INSTALLVENDORSCRIPT=/usr/bin \
      TEXMF=/usr/share/texmf
 make
}

package(){
 cd "$_realname-$pkgver"
 make install DESTDIR="$pkgdir"
 # remove perllocal.pod and .packlist
 find "$pkgdir" -name perllocal.pod -delete
 find "$pkgdir" -name .packlist -delete
 # add liense file
 install -D -m 644 "LICENSE"    -t "$pkgdir/usr/share/licenses/$pkgname"
 # add manual
 install -D -m 644 "manual.pdf" -t "$pkgdir/usr/share/$pkgname/doc"
}
