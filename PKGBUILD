# Maintainer: dreieck

_pkgname=perl-gis-distance
pkgname="${_pkgname}-git"
pkgver=0.20.0+r114.20230607.g7611336
pkgrel=2
pkgdesc='GIS::Distance -- Perl interface to calculate calculate geographic distances.'
arch=(
  'any'
)
url='https://github.com/bluefeet/GIS-Distance'
license=(
  'PerlArtistic'
)
depends=(
  'perl'
  'perl-bareword-filehandles'
  'perl-const-fast'
  'perl-indirect'
  'perl-multidimensional'
)
makedepends=(
  'git'
  'perl-module-build-tiny'
)
optdepends=(
  "perl-class-measure:  For haversine."
  "perl-geo-point:      To be able to handle 'Geo::Point' objects."
)
checkdepends=(
  'perl-test2-suite'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
options=('!emptydirs')
source=(
  "${_pkgname}::git+https://github.com/bluefeet/GIS-Distance.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _descr="$(git describe --tags --long)"
  _ver="$(printf '%s' "${_descr}" | awk -F '-' '{print $1"."$2}')"
  _rev="r$(git rev-list --count HEAD)"
  _hash="$(printf '%s' "${_descr}" | awk -F '-' '{print $3}')"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  printf '%s\n' "${_ver}+${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  # install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Build.PL
  ./Build
}

# check() {
# ### 2022-01-25: `./Build test` fails, most probably due to the fact that GEO::Proj4 upstream can no longer be maintained due to changes in proj library.
#   cd "${srcdir}/${_pkgname}"
#   ./Build test
# }

package() {
  cd "${srcdir}/${_pkgname}"

  ./Build install --installdirs=vendor --destdir="$pkgdir"

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete

  for _docfile in README.md Changes; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

