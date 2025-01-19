# Maintainer: dreieck
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Routing-DE-VRR
_pkgname=perl-travel-routing-de-efa
pkgname="${_pkgname}-git"
_pkgver='latest'
epoch=1
pkgver=2.24+r410.20240921.gf67c404
pkgrel=1
pkgdesc='Commandline client and Perl module for EFA-based public transit routing interfaces provided by e.g. VRR or VVO. It can request itineraries for train/tram/bus/ferry connections throughout most of Germany, as well as parts of Austria, Switzerland and UK.'
url='http://finalrewind.org/projects/Travel-Routing-DE-VRR/'
license=(
  'Artistic-1.0-Perl'
)
arch=('any')
depends=(
  'perl>=5.10.1'
  'perl-class-accessor'
  'perl-exception-class'
  'perl-getopt-long'
  'perl-lwp-protocol-https'
  'perl-xml-libxml'
)
makedepends=(
  'curl>8.7.1' # Because of https://bugs.gentoo.org/930633 / https://github.com/curl/curl/issues/13474
  'git'
  'perl-module-build'
  'perl-file-slurp'
  'perl-test-compile'
  'perl-test-fatal'
  'perl-test-pod'
)
checkdepends=(
  'perl-file-slurp'
  'perl-test-compile'
  'perl-test-fatal'
  'perl-test-pod'
)
provides=(
  "${_pkgname}=${pkgver}"
  "perl-travel-routing-de-vrr-git=${pkgver}"
  "perl-travel-routing-de-vrr=${pkgver}"
  "${_pkgname}-zsh-completion=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "perl-travel-routing-de-vrr"
  "${_pkgname}-zsh-completion"
)
replaces=(
  "perl-travel-routing-de-vrr"
)
options=('!emptydirs')
source=(
  "${_perlmod}::git+https://git.finalrewind.org/${_perlmod}"
)
sha256sums=(
  'SKIP'
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

  install -D -v -m644 provides/zsh/completions/_efa "${pkgdir}/usr/share/zsh/site-functions/_efa"
  install -D -v -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 Changelog "${pkgdir}/usr/share/doc/${_pkgname}/Changelog"

}
