# Maintainer: dreieck
# Maintainer: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-DeutscheBahn
_pkgname=perl-travel-status-de-deutschebahn
pkgname="${_pkgname}-git"
_pkgver="latest"
pkgver=2.02+gc8185a7
pkgrel=2
pkgdesc='Interface to the DeutscheBahn online departure monitor'
url='http://finalrewind.org/projects/Travel-Status-DE-DeutscheBahn/'
license=('PerlArtistic')
arch=('any')
depends=(
  'perl-class-accessor'
  'perl-libwww'
  'perl-xml-libxml'
)
makedepends=(
  'perl-module-build'
  'perl-file-slurp'
  'perl-json'
  'perl-list-moreutils'
  'perl-test-compile'
  'perl-test-pod'
)
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
# source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
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
