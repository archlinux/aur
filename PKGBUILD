# Maintainer: dreieck
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-VRR
_pkgname=perl-travel-status-de-vrr
pkgname="${_pkgname}-git"
_pkgver='latest'
epoch=1
pkgver=3.02+r296.20241021.gb4f7b26
pkgrel=1
pkgdesc='Interface to the efa.vrr.de departure monitor'
url='http://finalrewind.org/projects/Travel-Status-DE-VRR/'
license=(
  'Artistic-1.0-Perl'
  'CC0-1.0'
)
arch=('any')
depends=(
  'perl-class-accessor'
  'perl-libwww'
  'perl-lwp-protocol-https'
  'perl-xml-libxml'
)
makedepends=(
  'curl>8.7.1' # Because of https://bugs.gentoo.org/930633 / https://github.com/curl/curl/issues/13474
  'git'
  'perl-module-build'
  'perl-file-slurp'
  'perl-test-pod'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
# source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
source=(
  "${_perlmod}::git+http://git.finalrewind.org/${_perlmod}"
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
  install -D -v -m644 git.log "${pkgdir}/usr/share/doc/${_pkgname}/git.log"

  install -D -v -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.Travel-Status-DE-DeutscheBahn.PerlArtistic.txt"
  install -D -v -m644 ext/transport-apis/license "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.git_submodule_transport-apis.CC0.txt"
}
