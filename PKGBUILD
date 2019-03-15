# Maintainer: Ryan Gonzalez <rymg19@gmail.com>
# Contributor: Tom Zander
# Contributor: Christoph Vigano <mail@cvigano.de>
pkgname=ikiwiki
pkgver=3.20190228
pkgrel=1
pkgdesc='wiki/blog compiler'
arch=(any)
license=('GPL')
url='https://ikiwiki.info'
depends=(perl-yaml perl-text-markdown perl-cgi-session perl-cgi-formbuilder perl-timedate perl-html-parser perl-html-scrubber perl-mail-sendmail perl-time-duration perl-uri perl-html-template perl-locale-gettext perl-rpc-xml perl-yaml-libyaml)
source=("http://deb.debian.org/debian/pool/main/i/${pkgname}/${pkgname}_${pkgver}.orig.tar.xz")
backup=('etc/ikiwiki/wikilist')
sha256sums=('d07a4d0da60c3e4de698a4dc54d0445547e762b37f0d433b0d664d88155dfe9e')

build() {
  cd "IkiWiki-$pkgver"

  # Install module into the vendor directories
  sed -i -e 's/sbin/bin/g' Makefile.PL

  perl Makefile.PL PREFIX="/usr" INSTALL_BASE= INSTALLDIRS=vendor
  make PREFIX="/usr"
}

package() {
  cd "IkiWiki-$pkgver"

  make install DESTDIR="$pkgdir"

  # otherwise perl breaks
  find "$pkgdir" -name '.packlist' -or -name '*.pod' -exec rm '{}' +
}
