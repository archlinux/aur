# Maintainer: dreieck

_perlmod=Travel-Routing-DE-HAFAS
_pkgname=perl-travel-routing-de-hafas
pkgname="${_pkgname}-git"
_pkgver='latest'
epoch=1
pkgver=0.10+r125.20250804.g6ceac16
pkgrel=1
pkgdesc='A commandline client and Perl module for HAFAS public transit routing interfaces such as the one operated by VRN or ÖBB.'
url='https://finalrewind.org/projects/Travel-Routing-DE-HAFAS/'
license=('Artistic-1.0-Perl')
arch=('any')
depends=(
  'perl>=5.14.0'
  'perl-datetime'
  'perl-datetime-format-strptime'
  'perl-getopt-long'
  'perl-json'
  'perl-list-moreutils'
  'perl-lwp-protocol-https'
  'perl-travel-status-de-hafas>=6.16'
)
makedepends=(
  'curl>8.7.1' # Because of https://bugs.gentoo.org/930633 / https://github.com/curl/curl/issues/13474
  'git'
  'perl-class-accessor>=0.16'
  'perl-module-build'
)
checkdepends=(
  'perl-test-compile'
  'perl-test-pod'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-zsh-completion=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-zsh-completion"
)
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
