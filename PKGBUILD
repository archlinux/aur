# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Silvio Fricke <silvio.fricke@gmail.com>
# Contributor: 2ion <dev@2ion.de>

set -u
pkgname="miller"
#pkgname+='-git'
pkgver='5.10.0'
pkgrel='1'
pkgdesc='sed, awk, cut, join, and sort for name-indexed data such as CSV and tabular JSON.'
arch=('x86_64' 'i686')
url='https://github.com/johnkerl/miller'
license=('MIT')
depends=('glibc')
makedepends=('make' 'gcc' 'flex' 'ctags' 'valgrind' 'asciidoc' 'autoconf')
_verwatch=("${url}/releases" ".*/mlr-\([0-9.]\+\)\.tar\.gz.*" 'f') # mlr RSS is filled with everything but releases
_srcdir="mlr-${pkgver%.r*}"
source=("${url}/releases/download/v${pkgver%.r*}/mlr-${pkgver%.r*}.tar.gz")
#source[0]='https://github.com/johnkerl/miller/archive/master.tar.gz'; _srcdir='miller-master'
md5sums=('9a35e38cc0f168a57cdd60b470f02234')
sha256sums=('1e964a97ee0333a57966a2e8d1913aebc28875e9bee3effbbc51506ca5389200')

if [ "${pkgname%-git}" != "${pkgname}" ]; then
  md5sums[0]='SKIP'
  sha256sums[0]='SKIP'
  source[0]="${url//https/git}"
  makedepends+=('git')
  conflicts=("${pkgname%-git}")
  provides=("${pkgname%-git}=${pkgver%.r*}")
  _srcdir="${pkgname%-git}"
pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g' -e 's:^v::g'
  set +u
}
elif [ "${pkgver%.r*}" != "${pkgver}" ]; then
pkgver() {
  echo "${pkgver%.r*}"
}
fi

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then # 2.2.1 and newer
    autoreconf -fiv
    ./configure --prefix='/usr'
  fi
  if grep -q 'am__is_gnu_make' 'Makefile'; then # 2.2.1 and newer
    local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
    nice make -s -j "${_nproc}"
  else
    make -s -j1
  fi
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  if [ -d 'docs' ]; then
    install -Dpm644 docs/*.1 -t "${pkgdir}/usr/share/man/man1/"
  fi
  set +u
}
set +u
