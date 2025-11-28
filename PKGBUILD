# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Fabiano Furtado - fusca < fusca14 *at* gmail *dot* com >

set -u
pkgname='pev'
#pkgname+='-git'
pkgver='0.85'
pkgrel=1
pkgdesc='command line toolkit to work with and analyze PE (Portable Executables) binaries'
arch=('i686' 'x86_64')
#url='https://pev.sourceforge.io/'
url='https://github.com/mentebinaria/readpe'
license=('GPL-2.0-only')
depends=('glibc' 'openssl') # 'pcre'
#_verwatch=('https://sourceforge.net/projects/pev/rss' ".*<title>.*/${pkgname}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
_srcdir="readpe-${pkgver%.r*}"
_giturl='https://github.com/mentebinaria/readpe'
source=(
  "${_srcdir}.tar.gz::${_giturl}/archive/refs/tags/v${pkgver%.r*}.tar.gz"
)
md5sums=('99275d85513968ebdadd5518e2e32b36')
sha256sums=('2747a3ee87c7fb1ed0a13242816752a94603adb6ae0d9f507b019ac582c394eb')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  makedepends+=('git')
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver%.r*}")
  _srcdir='readpe'
  source[0]='git+${_giturl}.git'
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
  make prefix='/usr'
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make prefix='/usr' DESTDIR="${pkgdir}" install
  set +u
}
set +u
