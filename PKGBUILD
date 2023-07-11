# Maintainer: dreieck
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-IRIS
_pkgname=perl-travel-status-de-iris
pkgname="${_pkgname}-git"
_pkgver="latest"
epoch=1
pkgver=1.87+r731.20230709.g15ae002
pkgrel=1
pkgdesc='Interface to IRIS-based web departure monitors (as used by DeutscheBahn)'
url='http://finalrewind.org/projects/Travel-Status-DE-IRIS/'
license=('PerlArtistic')
arch=('any')
depends=(
  'perl-cache'
  'perl-class-accessor'
  'perl-datetime'
  'perl-datetime-format-strptime'
  # 'perl-geo-distance'
  'perl-gis-distance' # This one is problematic, since it depends on 'perl-geo-point' which in turn depends on 'perl-geo-proj' which cannot be maintained anymore due to changes in 'proj4'. Upstream should switch to 'perl-geo-distance' instead.
  'perl-list-compare'
  'perl-list-moreutils'
  'perl-list-utilsby'
  'perl-libwww'
  'perl-lwp-protocol-https'
  'perl-package-deprecationmanager'
  'perl-strictures'
  'perl-text-levenshtein'
  'perl-xml-libxml'
)
makedepends=(
  'git'
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
conflicts=("${_pkgname}")
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
#   {
#     grep -e '\$VERSION[[:space:]]*=[[:space:]]*' './bin/db-iris' | head -n 1; echo 'print $VERSION'
#   } | perl

  _descr="$(git describe --tags --long)"
  _ver="$(printf '%s' "${_descr}" | awk -F '-' '{print $1}')"
  _rev="r$(git rev-list --count HEAD)"
  _hash="$(printf '%s' "${_descr}" | awk -F '-' '{print $3}')"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  printf '%s\n' "${_ver}+${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_perlmod}"
  sed -i 's/Text::LevenshteinXS/Text::Levenshtein/' Build.PL lib/Travel/Status/DE/IRIS/Stations.pm.PL # Don't know what this is for, it was here when I adopted this package.
  # sed -i 's/GIS::Distance/Geo::Distance/' Build.PL # Patch to use Geo::Distance instead of GIS::Distance.
  # export DB_IRIS_DEB_BUILD=1 # Also needed in order to use Geo::Distance instead of GIS::Distance.
  perl Build.PL installdirs=vendor destdir="${pkgdir}"
  ./Build
}

# check() {
# ### 2022-01-25: `./Build test` fails, most probably due to the fact that GEO::Proj4 upstream can no longer be maintained due to changes in proj library.
#   cd "${srcdir}/${_perlmod}"
#   ./Build test
# }

package() {
  cd "${srcdir}/${_perlmod}"
  # export DB_IRIS_DEB_BUILD=1 # Also needed in order to use Geo::Distance instead of GIS::Distance.
  ./Build install
  for _docfile in README.md Changelog; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 "${srcdir}/LICENSE.PerlArtistic.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.PerlArtistic.txt"
}
