#  Maintainer: Jacob S. Gordon <jacob.as.gordon@gmail.com>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

# shellcheck disable=SC2034,SC2154,SC2164
_pkgbase=perl-latexml
_realname=LaTeXML
pkgname=${_pkgbase}-git
pkgver=0.8.8.r79.g5e47b3b1
pkgrel=1
pkgdesc="A LaTeX to XML/HTML/MathML Converter"
arch=('any')
license=('LicenseRef-NIST-PD-LaTeXML')
url="http://dlmf.nist.gov/LaTeXML/"
depends=('perl'
         'perl-pod-parser'
         'perl-parse-recdescent'
         'perl-text-unidecode'
         'imagemagick'
         'perl-xml-libxml'
         'perl-json-xs'
         'perl-xml-libxslt'
         'db'
         'texlive-core'
         'perl-image-size'
         'perl-file-which'
         'perl-libwww'
         'perl-io-string'
         'perl-archive-zip')
makedepends=('git')
options=('!emptydirs')
conflicts=("${_pkgbase}")
source=("git+https://github.com/brucemiller/LaTeXML.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_realname}"
    git describe --tags | cut -c2- | sed 's+-+.r+' | tr - .
}

build() {
    cd "${srcdir}/${_realname}"
    perl Makefile.PL \
         INSTALLDIRS=vendor \
         INSTALLVENDORBIN=/usr/bin \
         INSTALLVENDORSCRIPT=/usr/bin \
         TEXMF=/usr/share/texmf
    make
}

check() {
    cd "${srcdir}/${_realname}"
    make fulltest
}

package() {
    cd "${srcdir}/${_realname}"
    make install DESTDIR="${pkgdir}"
    find "${pkgdir}" \( -name perllocal.pod -o -name .packlist \) -delete
    install -Dm644 LICENSE    -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 manual.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
}
