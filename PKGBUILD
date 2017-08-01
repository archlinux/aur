# Maintainer: dreieck
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

_perlmod=Travel-Status-DE-URA
_pkgname=perl-travel-status-de-ura
pkgname="${_pkgname}-git"
_pkgver='latest'
pkgver=2.01+g5fdcd34
pkgrel=1
pkgdesc='Travel::Status::DE::URA is an inofficial interface to URA-based departure monitors (as used by ASEAG)'
url='http://finalrewind.org/projects/Travel-Status-DE-URA/'
license=('GPL' 'PerlArtistic')
arch=('any')
depends=('perl-class-accessor' 'perl-datetime' 'perl-datetime-format-duration'
          'perl-list-moreutils' 'perl-text-csv')
makedepends=('perl-file-slurp' 'perl-test-pod')
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
# source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz")
source=("${_perlmod}::git+http://git.finalrewind.org/${_perlmod}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_perlmod}"
  _descr="$(git describe --tags --long)"
  _ver="$(echo "${_descr}" | awk -F '-' '{print $1}')"
  _rev="$(echo "${_descr}" | awk -F '-' '{print $3}')"
  echo "${_ver}+${_rev}"
}

build() {
  cd "${srcdir}/${_perlmod}"
  perl Build.PL installdirs=vendor destdir="${pkgdir}"
  ./Build
}

check() {
  cd "${srcdir}/${_perlmod}"
  ./Build test
}

package() {
  cd "${srcdir}/${_perlmod}"
  ./Build install
  install -D -v -m644 COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/COPYING
  install -D -v -m644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -D -v -m644 Changelog "${pkgdir}/usr/share/doc/${_pkgname}/Changelog"
}
