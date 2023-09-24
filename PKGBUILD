# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Fabiano Furtado - fusca < fusca14 *at* gmail *dot* com >

set -u
pkgname='pev'
#pkgname+='-git'
pkgver='0.82'
pkgrel=1
pkgdesc='command line toolkit to work with and analyze PE (Portable Executables) binaries'
arch=('i686' 'x86_64')
#url='https://pev.sourceforge.io/'
url='https://github.com/mentebinaria/readpe'
license=('GPL')
depends=('glibc' 'openssl') # 'pcre'
#_verwatch=('https://sourceforge.net/projects/pev/rss' ".*<title>.*/${pkgname}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
_srcdir="readpe-${pkgver%.r*}"
source=(
  "${_srcdir}.tar.gz::https://github.com/mentebinaria/readpe/archive/refs/tags/v${pkgver%.r*}.tar.gz"
)
md5sums=('ec6d5248221509d4815290e534138227')
sha256sums=('6ee625acedb3cbe636afe41f854b6eed5aac466d7fad52e3a48557083f8acecc')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  makedepends+=('git')
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver%.r*}")
  _srcdir='readpe'
  source[0]='git+https://github.com/mentebinaria/readpe.git'
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
pkgver() {
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g'
}
elif [ "${pkgver%.r*}" != "${pkgver}" ]; then
pkgver() {
  printf '%s' "${pkgver%.r*}"
}
fi

build() {
  set -u
  cd "${_srcdir}"
  nice make prefix='/usr'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make prefix='/usr' DESTDIR="${pkgdir}" install
  set +u
}
set +u
