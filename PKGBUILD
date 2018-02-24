# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Tristelune  <tristelune at archlinux dot info>
# Contributor: LeCrayonVert <greenarrow at archlinux dot us>
# Contributor: yugrotavele <yugrotavele at archlinux dot us>
# Contributor: Sven Salzwedel <sven_salzwedel@web.de>
# Contributor: Olaf Leidinger <leidola@newcon.de>

pkgname=gscan2pdf
pkgver=1.8.11
pkgrel=1
pkgdesc='A GUI with OCR capability to produce PDFs or DjVus from scanned documents'
arch=('any')
url='http://gscan2pdf.sourceforge.net/'
license=('GPL')
depends=('imagemagick' 'perl-config-general' 'perl-date-calc' 'perl-goo-canvas'
         'perl-gtk2-ex-simple-list' 'perl-gtk2-imageview' 'perl-data-uuid'
         'perl-filesys-df' 'perl-html-parser' 'perl-list-moreutils' 
         'perl-locale-gettext' 'perl-log-log4perl' 'perl-pdf-api2'
         'perl-proc-processtable' 'perl-readonly' 'perl-sane' 'perl-set-intspan'
         'perl-try-tiny' 'unpaper')
optdepends=('djvulibre: DjVu image format'
            'gocr: OCR support'
            'ocropy: OCR support'
            'xdg-utils: email as PDF'
            'tesseract: OCR support'
            'cuneiform: OCR support'
            'perl-gtk2-ex-podviewer: view inline documentation')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('d4a167ebe36390422472f91a4580f262a543e48f303ff930331a2e7e56491ab7')

build() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install DESTDIR="${pkgdir}"

  # Move files
  mv "${pkgdir}/usr/bin/vendor_perl/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Cleaning
  rm "${pkgdir}/usr/lib/perl5/5.26/core_perl/perllocal.pod"
  rm "${pkgdir}/usr/lib/perl5/5.26/vendor_perl/auto/gscan2pdf/.packlist"
  rmdir "${pkgdir}/usr/lib/perl5/5.26/vendor_perl/auto/gscan2pdf" \
        "${pkgdir}/usr/lib/perl5/5.26/vendor_perl/auto" \
        "${pkgdir}/usr/lib/perl5/5.26/vendor_perl" \
        "${pkgdir}/usr/lib/perl5/5.26/core_perl" \
        "${pkgdir}/usr/lib/perl5/5.26" \
        "${pkgdir}/usr/lib/perl5" \
        "${pkgdir}/usr/lib" \
        "${pkgdir}/usr/bin/vendor_perl"
}
