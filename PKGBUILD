# Maintainer: dreieck
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-IRIS
_pkgname=perl-travel-status-de-iris
pkgname="${_pkgname}-git"
_pkgver="latest"
pkgver=1.16+g274be67
pkgrel=5
pkgdesc='Interface to IRIS-based web departure monitors (as used by DeutscheBahn)'
url='http://finalrewind.org/projects/Travel-Status-DE-IRIS/'
license=('PerlArtistic')
arch=('any')
depends=(
  'perl-class-accessor'
  'perl-datetime'
  'perl-datetime-format-strptime'
  'perl-geo-distance'
  'perl-list-compare'
  'perl-list-moreutils'
  'perl-list-utilsby'
  'perl-libwww'
  'perl-package-deprecationmanager'
  'perl-text-levenshtein'
  'perl-xml-libxml'
)
makedepends=(
  'perl-file-slurp'
  'perl-module-build'
  'perl-test-compile'
  'perl-test-fatal'
  'perl-test-pod'
  'perl-text-csv'
)
checkdepends=(
  'perl-test-number-delta'
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
#   {
#     grep -e '\$VERSION[[:space:]]*=[[:space:]]*' './bin/db-iris' | head -n 1; echo 'print $VERSION'
#   } | perl

  _descr="$(git describe --tags --long)"
  _ver="$(echo "${_descr}" | awk -F '-' '{print $1}')"
  _rev="$(echo "${_descr}" | awk -F '-' '{print $3}')"
  echo "${_ver}+${_rev}"
}

build() {
  cd "${srcdir}/${_perlmod}"
  sed -i 's/Text::LevenshteinXS/Text::Levenshtein/' Build.PL lib/Travel/Status/DE/IRIS/Stations.pm
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
  install -D -v -m644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -D -v -m644 Changelog "${pkgdir}/usr/share/doc/${_pkgname}/Changelog"
}
