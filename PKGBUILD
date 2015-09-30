# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Georg Grabler (STiAT) <ggrabler@gmail.com>

_perlmod=DBD-Oracle
_modnamespace=DBD
pkgname=perl-dbd-oracle
pkgver=1.74
pkgrel=2
pkgdesc="DBD::Oracle - Oracle database driver for the DBI module"
arch=('any')
url="http://search.cpan.org/dist/${_perlmod}"
license=('GPL' 'PerlArtistic')
depends=('oracle-instantclient-basic>=10.1' 'perl-dbi>=1.51')
makedepends=('oracle-instantclient-sdk>=10.1' 'perl-data-dumper')
options=('!emptydirs')
source=("http://cpan.org/modules/by-module/${_modnamespace}/${_perlmod}-${pkgver}.tar.gz")
sha512sums=('08e2b39a9102bc7aaa947d8104b99fce40285781f8482f08b4571fa866198f6f36f089771808a6c53eede3eb3b573da6ec7ba6de16d1d5023ceae6be60d3f8f2')

build() {
	cd "${_perlmod}-${pkgver}"

	#
	# How much of this stuff is still necessary?
	#
	if [[ -z ${ORACLE_HOME} ]]; then
		if [[ $(pacman -Qq oracle &>/dev/null) ]]; then
			export ORACLE_HOME="$(ls -dr /home/oracle/app/oracle/product/*)/orarch"
			export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${ORACLE_HOME}/lib"
			_version=$(pacman -Qq oracle 2>/dev/null)
		else
			error "No Oracle / Instant Client installation found."
		fi
	fi
	# AUR workaround
	(( 1 )) && _version=${_version##* }
	# You may need to put your version of Oracle's Instant Client below.
	[[ -z ${_version} ]] && _version=12.1.0.1.0

	PERL_MM_USE_DEFAULT=1 perl Makefile.PL -V ${_version} INSTALLDIRS=vendor -l
	make
}

check() {
	cd "${_perlmod}-${pkgver}"
	make test
}

package() {
	cd "${_perlmod}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
