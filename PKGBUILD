# Maintainer: pappy <pa314159@users.noreply.github.com>

_cpan_name=Role-Basic
_cpan_desc="Just roles. Nothing else."
_cpan_author=ovid
_cpan_version=0.13
_cpan_md5=2985fbb47bd0a862bd56bc7cbba6e673

pkgrel=3
pkgname=perl-${_cpan_name,,}
pkgdesc=$_cpan_desc
pkgver=$_cpan_version
md5sums=($_cpan_md5)
depends=('perl')
makedepends=('perl-module-build')
checkdepends=('perl-test-simple')

_cpan_path=${_cpan_author:0:1}/${_cpan_author:0:2}/${_cpan_author}

url="http://search.cpan.org/~${_cpan_author}/${_cpan_name}-$pkgver"
source=("http://search.cpan.org/CPAN/authors/id/${_cpan_path^^}/${_cpan_name}-$pkgver.tar.gz")
license=('GPL' 'PerlArtistic')
options=(!emptydirs purge)
arch=('any')


build() {
	cd $srcdir/${_cpan_name}-$pkgver

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
	if [[ -f Build.PL ]]; then
		perl Build.PL
		./Build
	else
		perl Makefile.PL
		make
	fi
}

check() {
	cd $srcdir/${_cpan_name}-$pkgver

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	export PERL_MM_USE_DEFAULT=1
	if [[ -f Build.PL ]]; then
		./Build test
	else
		make test
	fi
}

package() {
	cd $srcdir/${_cpan_name}-$pkgver

	unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
	if [[ -f Build.PL ]]; then
		./Build install --installdirs=vendor --destdir="$pkgdir"
	else
		make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
	fi
}

