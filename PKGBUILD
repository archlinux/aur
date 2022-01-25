# Maintainer: dreieck

_pkgname=perl-extutils-depends
pkgname="${_pkgname}-git"
pkgver=0.8001.0+r117.20210515.g5ea5430
pkgrel=2
pkgdesc='disables multidimensional array emulation.'
arch=(
  'any'
)
url='https://gitlab.gnome.org/GNOME/perl-extutils-depends'
license=(
  'PerlArtistic'
)
depends=(
  'perl'
  'perl-extutils-makemaker'
)
makedepends=(
  'git'
)
checkdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
options=('!emptydirs')
source=(
  "${_pkgname}::git+https://gitlab.gnome.org/GNOME/perl-extutils-depends.git"
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
  _ver="$(printf '%s' "${_descr}" | awk -F '-' '{print $2"."$3"."$4}')"
  _rev="r$(git rev-list --count HEAD)"
  _hash="$(printf '%s' "${_descr}" | awk -F '-' '{print $5}')"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  printf '%s\n' "${_ver}+${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

check() {
  cd "${srcdir}/${_pkgname}"

  make test
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install

  # remove perllocal.pod and .packlist
  find "${pkgdir}" -name perllocal.pod -delete
  find "${pkgdir}" -name .packlist -delete

  for _docfile in Changes README; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  install -D -v -m644 "${srcdir}/LICENSE.PerlArtistic.txt" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.PerlArtistic.txt"
}

