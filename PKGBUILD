# Maintainer: Anton Leontiev <bunder /at/ t-25.ru>
_pkgname=perl-pdl
pkgname=$_pkgname-git
pkgver=20131205.3765
pkgrel=1
pkgdesc='The Perl Data Language, a perl extension designed for scientific and bulk numeric data processing and display'
arch=('i686' 'x86_64')
url='http://search.cpan.org/dist/PDL'
license=('PerlArtistic' 'GPL')

depends=(
	'perl>=5.8.9'
	'perl-inline>=0.43'
	'gsl'
)
makedepends=(
	'perl>=5.11.3' # To provide ExtUtils::MakeMaker 6.56
	'fftw2'
	'hdf4'
	'perl-opengl>=0.63'
	'plplot'
	'perl-extutils-f77'
	'proj'
)
optdepends=(
	'fftw2: for PDL::FFTW support'
	'hdf4: for HDF files support'
	'perl-astro-fits-header: improved FITS files support'
#	'perl-convert-uu: for the case when something wrong with Unicode support'  # It is necessary on *BSD systems
#	'perl-extutils-f77: for PDL::Slatec and PDL::Minuit support'               # It is not necessary at runtime
	'perl-opengl>=0.63: for PDL::Graphics::TriD support'
	'plplot: for PDL::Graphics::PLplot support'
	'proj: for PDL::GIS::Proj and PDL::Transform::Proj4 support'
)

provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://pdl.git.sourceforge.net/gitroot/pdl/pdl" 'perldl.conf')
md5sums=('SKIP' '8e1f6285ce4ee9439dc1088709cfec18')

pkgver() {
	cd "$_pkgname"
	echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
	cd "$_pkgname"
	F77LIBS='-lgfortran -lm' PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor PDLCONF=$srcdir/perldl.conf
    make
}

check() {
	cd "$_pkgname"
	make test
}

package() {
	cd "$_pkgname"
	make install DESTDIR="$pkgdir"
	find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
