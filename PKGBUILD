# Maintainer: dreieck
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-DBWagenreihung
_pkgname=perl-travel-status-de-dbwagenreihung
pkgname="${_pkgname}-git"
_pkgver="latest"
epoch=0
pkgver=0.08+r63.20230213.gc843388
pkgrel=1
pkgdesc='Interface to the DeutscheBahn coach order API.'
url='https://finalrewind.org/projects/Travel-Status-DE-DBWagenreihung/'
license=('PerlArtistic')
arch=('any')
depends=(
  'perl>=5.20'
  'perl-lwp-protocol-https'
  'perl-travel-status-de-iris'
)
makedepends=(
  'git'
  'perl-module-build'
  'perl-file-slurp'
  'perl-list-moreutils'
  'perl-test-compile'
  'perl-test-pod'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
options=('!emptydirs')
# source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
source=(
  "${_perlmod}::git+https://git.finalrewind.org/${_perlmod}"
  'LICENSE.PerlArtistic.txt'
)
sha256sums=(
  'SKIP'
  '916a330e64df209a924120bfddea0373db385eb3854e96d1a3dda6e0ea130c80'
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
  install -D -v -m644 "${srcdir}/LICENSE.PerlArtistic.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.PerlArtistic.txt"
  install -D -v -m644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -D -v -m644 Changelog "${pkgdir}/usr/share/doc/${_pkgname}/Changelog"
}
