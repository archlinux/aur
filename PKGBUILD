# Maintainer: dreieck
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Routing-DE-VRR
_pkgname=perl-travel-routing-de-vrr
pkgname="${_pkgname}-git"
_pkgver='latest'
epoch=1
pkgver=2.20+r380.20230210.g0ab14a0
pkgrel=1
pkgdesc='Unofficial efa.vrr.de command line client and Perl module'
url='http://finalrewind.org/projects/Travel-Routing-DE-VRR/'
license=('custom:WTFPL')
arch=('any')
depends=(
  'perl-class-accessor'
  'perl-exception-class'
  'perl-libwww'
  'perl-lwp-protocol-https'
  'perl-xml-libxml'
)
makedepends=(
  'git'
  'perl-module-build'
  'perl-file-slurp'
  'perl-test-compile'
  'perl-test-fatal'
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
# source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc}
#         'http://www.wtfpl.net/txt/copying/COPYING')
source=(
  "${_perlmod}::git+https://git.finalrewind.org/${_perlmod}"
  'COPYING::http://www.wtfpl.net/txt/copying/COPYING'
)
sha256sums=(
  'SKIP'
  '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5'
)

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
  install -D -v -m644 "${srcdir}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.WTFPL.txt"
  install -D -v -m644 provides/zsh/completions/_efa "${pkgdir}/usr/share/zsh/site-functions/_efa"
  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 Changelog "${pkgdir}/usr/share/doc/${_pkgname}/Changelog"

}
