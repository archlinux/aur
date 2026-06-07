# Maintainer: dreieck

_perlmod=Travel-Status-MOTIS
_pkgname=perl-travel-status-motis
pkgname="${_pkgname}-git"
_pkgver='latest'
epoch=0
pkgver=0.03+r21.20260419.gee32b1e
pkgrel=1
pkgdesc='Commandline client + Perl module for arrival/departure of MOTIS routing interfaces. Can show the arrivals/departures at a specific public transit stop, give details on individual trips, and look up stops by name or geo coordinates.'
url='https://finalrewind.org/projects/Travel-Status-MOTIS/'
license=(
  'Artistic-1.0-Perl'
  'CC0-1.0'
)
arch=('any')
depends=(
  'perl>=5.20.0'
  'perl-class-accessor>=0.16'
  'perl-datetime'
  'perl-datetime-format-iso8601'
  'perl-getopt-long'
  'perl-json'
  'perl-list-moreutils'
  'perl-lwp-protocol-https'
  'perl-uri'
)
makedepends=(
  'curl>8.7.1' # Because of https://bugs.gentoo.org/930633 / https://github.com/curl/curl/issues/13474
  'git'
  'perl-class-accessor>=0.16'
  'perl-module-build'
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
  "transport-apis::git+https://github.com/public-transport/transport-apis.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_perlmod}"

  git submodule init
  git config submodule.ext/transport-apis.url "${srcdir}/transport-apis"
  git -c protocol.file.allow=always submodule update

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
  install -D -v -m644 ext/transport-apis/license "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.git_submodule_transport-apis.CC0.txt"

}
