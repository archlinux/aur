# Maintainer: dreieck
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-DeutscheBahn
_pkgname=perl-travel-status-de-deutschebahn
pkgname="${_pkgname}-git"
_pkgver="latest"
epoch=1
pkgver=6.11+r494.20241011.g5216ef3
pkgrel=1
pkgdesc='Interface to the DeutscheBahn online departure monitor'
url='http://finalrewind.org/projects/Travel-Status-DE-DeutscheBahn/'
license=(
  'Artistic-1.0-Perl'
  'CC0-1.0'
)
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
  'curl>8.7.1' # Because of https://bugs.gentoo.org/930633 / https://github.com/curl/curl/issues/13474
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

  printf '\n'
  printf '%s\n' "  > running 'perl Build.PL installdirs=vendor destdir="${pkgdir}"' ..."
  printf '\n'
  perl Build.PL installdirs=vendor destdir="${pkgdir}"
  printf '\n'

  # printf '\n'
  # printf '%s\n' "  > running './Build manifest' ..."
  # printf '\n'
  # ./Build manifest
  # printf '\n'

  printf '\n'
  printf '%s\n' "  > running './Build' ..."
  printf '\n'
  ./Build
  printf '\n'
}

check() {
  cd "${srcdir}/${_perlmod}"

  printf '\n'
  printf '%s\n' "  > running './Build test' ..."
  printf '\n'
  ./Build test
  printf '\n'
}

package() {
  cd "${srcdir}/${_perlmod}"

  printf '\n'
  printf '%s\n' "  > running './Build install' ..."
  printf '\n'
  ./Build install
  printf '\n'

  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 Changelog "${pkgdir}/usr/share/doc/${_pkgname}/Changelog"
  install -D -v -m644 git.log "${pkgdir}/usr/share/doc/${_pkgname}/git.log"

  install -D -v -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.Travel-Status-DE-DeutscheBahn.PerlArtistic.txt"
  install -D -v -m644 ext/transport-apis/license "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.git_submodule_transport-apis.CC0.txt"
}
