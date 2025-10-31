# Maintainer: dreieck

_perlmod=Travel-Status-DE-DBRIS
_pkgname=perl-travel-status-de-dbris
pkgname="${_pkgname}-git"
_pkgver='latest'
epoch=1
pkgver=0.15+r109.20251026.g5374c3e
pkgrel=1
pkgdesc='dbris-m is a commandline client and Perl module for bahn.de public transit interfaces. It can show the arrivals/departures at a specific public transit stop, give details on individual journeys, and look up stops by name or geo coordinates.'
url='https://finalrewind.org/projects/Travel-Status-DE-DBRIS'
license=(
  'Artistic-1.0-Perl'
  'CC0-1.0'
)
arch=('any')
depends=(
  'perl>=5.20.0'
  'perl-class-accessor>=0.16'
  'perl-datetime'
  'perl-datetime-format-strptime'
  'perl-getopt-long'
  'perl-json'
  'perl-list-moreutils'
  'perl-lwp-protocol-https'
)
makedepends=(
  'curl>8.7.1' # Because of https://bugs.gentoo.org/930633 / https://github.com/curl/curl/issues/13474
  'git'
  'perl-module-build>=0.40'
  'perl-test-compile'
  'perl-test-pod'
)
checkdepends=(
  'perl-file-slurp'
  'perl-test-compile'
  'perl-test-pod'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
options=('!emptydirs')
source=(
  "${_perlmod}::git+https://git.finalrewind.org/${_perlmod}"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_perlmod}"

  git log > git.log
}

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

  install -D -v -m644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md Changelog
  install -D -v -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
