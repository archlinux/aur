# Maintainer: dreieck

_pkgname=perl-geo-point
pkgname="${_pkgname}-git"
pkgver=0.99.0+r29.20210209.g1f1234c
pkgrel=2
pkgdesc='One location on the globe, in any coordinate system. This package tries to hide the maths and the coordinate system in which the point is represented.'
arch=(
  'any'
)
url='https://metacpan.org/pod/Geo::Point'
license=(
  'PerlArtistic'
)
depends=(
  'perl'
  'perl-geo-proj4'
)
makedepends=(
  'git'
  #'perl-b-hooks-op-check'
  #'perl-extutils-depends'
  'perl-extutils-makemaker'
  #'perl-extutils-makemaker-dist-zilla-develop' # for generating ppport.h
)
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "perl-geo-line=${pkgver}"
  "perl-geo-proj=${pkgver}"
  "perl-geo-shape=${pkgver}"
  "perl-geo-space=${pkgver}"
  "perl-geo-surface=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "perl-geo-line"
  "perl-geo-proj"
  "perl-geo-shape"
  "perl-geo-space"
  "perl-geo-surface"
)
options=('!emptydirs')
source=(
  "${_pkgname}::git+https://github.com/markov2/perl5-Geo-Point.git"
  'LICENSE.PerlArtistic.txt'
)
sha256sums=(
  'SKIP'
  '916a330e64df209a924120bfddea0373db385eb3854e96d1a3dda6e0ea130c80'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  perl Makefile.PL
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _descr="$(git describe --tags --long)"
  _ver="$(printf '%s' "${_descr}" | awk -F '-' '{print $1"."$2}' | sed 's|^v||')"
  _rev="r$(git rev-list --count HEAD)"
  _hash="$(printf '%s' "${_descr}" | awk -F '-' '{print $3}')"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  printf '%s\n' "${_ver}+${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

# check() {
# ### 2022-01-25: `make test` fails, most probably due to the fact that GEO::Proj4 cannot be maintained anymore due to changes in proj library.
#   cd "${srcdir}/${_pkgname}"
# 
#   make test # test succeeds only with the dist-zilla Makefile
# }

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete

  for _docfile in ChangeLog README.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 "${srcdir}/LICENSE.PerlArtistic.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.PerlArtistic.txt"
}
