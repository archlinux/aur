# Maintainer: Moritz Bunkus <moritz@bunkus.org>

pkgname=perl-file-extattr
pkgver='1.09'
pkgrel='7'
pkgdesc="Perl extension for accessing extended attributes of files"
arch=("i686" "x86_64" "arm")
url="http://search.cpan.org/dist/File-ExtAttr"
license=('GPL' 'PerlArtistic')
options=('!emptydirs')
depends=('perl')
source=("https://cpan.metacpan.org/authors/id/R/RI/RICHDAWE/File-ExtAttr-${pkgver}.tar.gz"
        "0001-Port-Linux-to-sys-xattr.h.patch"
        "0002-Remove-dependency-on-attr-library-on-Linux.patch")
sha512sums=('eca00420bef313ac711bf1d64323e051acc8eb77ab8e267067f586e78dc42d43f685fe571c7856186c998e939dd2761d24650c61297c24486bc005dddf6b4bb3'
            '5025f2bbfa5f7e543a693aab87774ed2b514de12192886c366aebdf58f3a12fbc7047dc97b61a5577557497bc66ebb25c6c7f52b79f8efbe565943e9c01c57d6'
            '2ba18bf66f11d85acc0002b94a48e5f3943ac994d43825f49fd16b41d5728285786913df1bca0fb648e08545ae8a34b301c61c93c7661ecd0722587343247ede')

prepare_environment() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
    PERL_AUTOINSTALL=--skipdeps                            \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  cd "${srcdir}/File-ExtAttr-${pkgver}"
}

build() {
  prepare_environment

  # Patches taken from upstream bug report at
  # https://rt.cpan.org/Public/Bug/Display.html?id=125804
  patch -p1 < "${srcdir}/0001-Port-Linux-to-sys-xattr.h.patch"
  patch -p1 < "${srcdir}/0002-Remove-dependency-on-attr-library-on-Linux.patch"

  /usr/bin/perl Makefile.PL
  make
}

check() {
  prepare_environment
  make test
}

package() {
  prepare_environment
  make install
  find "$pkgdir" -type f -name '*.so' -exec strip {} \+ # 'strip' option doesn't work because files are read-only
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
