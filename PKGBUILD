# Maintainer: dreieck
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

_perlmod=Travel-Status-DE-URA
_pkgname=perl-travel-status-de-ura
pkgname="${_pkgname}-git"
_pkgver='latest'
epoch=1
pkgver=2.01+r144.20230904.gff68e30
pkgrel=2
pkgdesc='Travel::Status::DE::URA is an inofficial interface to URA-based departure monitors (as used by ASEAG)'
url='http://finalrewind.org/projects/Travel-Status-DE-URA/'
license=('GPL' 'PerlArtistic')
arch=('any')
depends=(
  'perl-class-accessor'
  'perl-datetime'
  'perl-datetime-format-duration'
  'perl-list-moreutils'
  'perl-lwp-protocol-https'
  'perl-text-csv'
)
makedepends=(
  'curl>8.7.1' # Because of https://bugs.gentoo.org/930633 / https://github.com/curl/curl/issues/13474
  'git'
  'perl-file-slurp'
  'perl-test-pod'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
options=('!emptydirs')
# source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz")
source=(
  "${_perlmod}::git+https://git.finalrewind.org/${_perlmod}"
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_perlmod}"
  _descr="$(git describe --tags --long)"
  _ver="$(printf '%s' "${_descr}" | awk -F '-' '{print $1}')"
  _rev="r$(git rev-list --count HEAD)"
  _hash="$(printf '%s' "${_descr}" | awk -F '-' '{print $3}')"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  printf '%s\n' "${_ver}+${_rev}.${_date}.${_hash}"
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
  install -D -v -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.PerlArtistic.txt"
  install -D -v -m644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -D -v -m644 Changelog "${pkgdir}/usr/share/doc/${_pkgname}/Changelog"
}
