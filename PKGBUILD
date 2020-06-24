# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>

pkgname=perl-gnome2-wnck+
_cpanname=Gnome2-Wnck
pkgver=0.16
pkgrel=16
pkgdesc="Perl interface to the Window Navigator Construction Kit (improved)"
arch=('i686' 'x86_64')
license=("GPL" "PerlArtistic")
url="http://search.cpan.org/dist/${_cpanname}"
provides=('perl-gnome2-wnck')
conflicts=('perl-gnome2-wnck')
depends=('perl>=0' 'gtk2-perl' 'libwnck+')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig'
'perl-class-load-xs'
'perl-class-xsaccessor'
'perl-json-xs'
'perl-module-build-xsutil'
'perl-package-stash-xs'
'perl-text-csv-xs'
'perl-xs-object-magic'
)
options=('!emptydirs')
source=("http://search.cpan.org/CPAN/authors/id/T/TS/TSCH/${_cpanname}-${pkgver}.tar.gz"
	"libwnck+.patch")
md5sums=('439f4569ffd7af96ef1d3feaab23760e'
         'ae7baf7c409334354d2aaa244ff316f7')
sha512sums=('d8ed39cd19ccaeb5995d97b392d1cc97fe0c9bb66781efb70d6160f50a212e263be3bb89c33ca1ff0ed3da3c55fd9968fa4026abcf8593996760831164acd00a'
            '5af5b5c421e8ad2f9b8138bd9fd6b4c746bf14ace2aec0f632c388143bf3bf2b799f5b396fb28eed6f1476e3d46afff993db156b0bac9b624e6ed4911438e1ad')

prepare() {
  cd ${_cpanname}-${pkgver}
  patch -Np2 -b -z .orig <../libwnck+.patch
}

build() {
  cd ${_cpanname}-${pkgver}
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                  \
      PERL_AUTOINSTALL=--skipdeps                             \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"      \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"  \
      MODULEBUILDRC=/dev/null

    /usr/bin/perl Makefile.PL
    sed -i -e 's,q(build/doc.pl),q(./build/doc.pl),' Makefile
    make
  )
}

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
}

package() {
  cd ${_cpanname}-${pkgver}
  make install
  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
  _perl_depends
}
