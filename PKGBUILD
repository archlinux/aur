# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: carltonf <xiong[c05]@gmail.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=perl-pdl
_pkgname=PDL
pkgver=2.079
pkgrel=1
pkgdesc='The Perl Data Language, a perl extension designed for scientific and bulk numeric data processing and display'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/PDL'
license=('PerlArtistic' 'GPL')
depends=(
	'perl'
	'perl-inline'
	'perl-term-readkey'
	'gsl'
)
makedepends=(
	'perl'
	'fftw2'
	'hdf4'
	'perl-opengl'
	'plplot'
	'perl-extutils-f77'
	'proj'
	'perl-extutils-parsexs'
	'perl-convert-uu'
	'perl-inline-c'
	'perl-module-compile'
	'perl-devel-checklib'
	'perl-pod-parser'
	'perl-extutils-depends'
)
checkdepends=(
	'perl-test-warn'
	'perl-perlio-layers'
	'perl-file-map'
	'perl-test-exception'
	'perl-test-deep'
)
optdepends=(
	'fftw2: for PDL::FFTW support'
	'hdf4: for HDF files support'
	'perl-astro-fits-header: improved FITS files support'
#	'perl-convert-uu: for the case when something wrong with Unicode support'  # It is necessary on *BSD systems
#	'perl-extutils-f77: for PDL::Slatec and PDL::Minuit support'               # It is not necessary at runtime
	'perl-opengl: for PDL::Graphics::TriD support'
	'plplot: for PDL::Graphics::PLplot support'
	'proj: for PDL::GIS::Proj and PDL::Transform::Proj4 support'
)
source=(https://cpan.metacpan.org/authors/id/E/ET/ETJ/${_pkgname}-${pkgver}.tar.gz perldl.conf Makefile.patch)
options=(!emptydirs)
md5sums=('420150b5543bc3087003f1304606db6c'
         'ac56f2a88b89d359a0dc80063d31cf59'
         'e2b2dff48643a5051a8f7d1ee9dc4ea9')

build() {
	cd "${_pkgname}-${pkgver}"
	F77LIBS='-lgfortran -lm' PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor PDLCONF=${srcdir}/perldl.conf
        patch < "${srcdir}/Makefile.patch"
        make
}

check() {
	cd "${_pkgname}-${pkgver}"
	make test
}

package() {
	cd "${_pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
        make doc_install DESTDIR="${pkgdir}"
	find "${pkgdir}" -name .packlist -o -name perllocal.pod -delete
}
