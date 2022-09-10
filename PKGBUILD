# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: carltonf <xiong[c05]@gmail.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

pkgname=perl-pdl
_pkgname=PDL
pkgver=2.080
pkgrel=2
pkgdesc='The Perl Data Language, a perl extension designed for scientific and bulk numeric data processing and display'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/PDL'
license=('PerlArtistic' 'GPL')
depends=(
	'perl-inline'
	'perl-inline-c'
	'perl-term-readkey'
	'perl-text-balanced>=2.05' #this is because perl provides only 2.04
	'perl-opengl-glut'
	'gsl'
)
makedepends=(
	'fftw2'
	'hdf4'
	'plplot'
	'perl-extutils-f77'
	'proj'
	'perl-extutils-parsexs'
	'perl-devel-checklib'
	'perl-pod-parser'
	'perl-extutils-depends'
	'perl-pgplot'
)
checkdepends=(
	'perl-test-warn'
	'perl-test-exception'
	'perl-test-deep'
)
optdepends=(
	'fftw2: for PDL::FFTW support'
	'hdf4: for HDF files support'
	'perl-astro-fits-header: improved FITS files support'
	'plplot: for PDL::Graphics::PLplot support'
	'proj: for PDL::GIS::Proj and PDL::Transform::Proj4 support'
	'perl-sys-sigaction: Ctrl-C handling in shells'
)
source=(https://cpan.metacpan.org/authors/id/E/ET/ETJ/${_pkgname}-${pkgver}.tar.gz perldl.conf Makefile.patch)
options=(!emptydirs)
md5sums=('554beab90fa3060ae4326841f6500005'
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
