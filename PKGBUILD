# Maintainer: dreieck
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-DeutscheBahn
_pkgname=perl-travel-status-de-deutschebahn
pkgname="${_pkgname}-git"
_pkgver="latest"
epoch=1
pkgver=4.12+r304.20230703.g46092e3
pkgrel=1
pkgdesc='Interface to the DeutscheBahn online departure monitor'
url='http://finalrewind.org/projects/Travel-Status-DE-DeutscheBahn/'
license=('PerlArtistic')
arch=('any')
depends=(
  'perl-class-accessor'
  'perl-datetime'
  'perl-datetime-format-strptime'
  'perl-json'
  'perl-lwp-protocol-https'
  'perl-libwww'
  'perl-xml-libxml'
)
makedepends=(
  'git'
  'perl-module-build'
  'perl-file-slurp'
  'perl-list-moreutils'
  'perl-test-compile'
  'perl-test-pod'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
# source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
source=("${_perlmod}::git+https://git.finalrewind.org/${_perlmod}")
md5sums=('SKIP')

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
  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 Changelog "${pkgdir}/usr/share/doc/${_pkgname}/Changelog"
}
