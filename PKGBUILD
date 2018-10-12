# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: willemw <willemw12@gmail.com>
# Contributor: jklee <klee.jonathan@gmail.com>

set -u
pkgname='ngp'
pkgver='1.4'
pkgrel='1'
pkgdesc='ncurses grep tool'
arch=('i686' 'x86_64')
url="https://github.com/jonathanklee/${pkgname}"
license=('GPL')
depends=('git' 'libconfig' 'pcre' 'ncurses')
makedepends=('gcc' 'cmake')
_verwatch=("${url}/releases.atom" "\s\+<title>\([0-9][^<]\+\)</title>.*" 'f')
_srcdir="${pkgname}-${pkgver}"
source=("${_srcdir}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0655c825e12f86ff98dbbd425b38bcd49a565d101028d0454e8e825cb2cd83d4')

build() {
  set -u
  cd "${_srcdir}"
  if [ -s 'autogen.sh' ]; then
    if [ ! -s 'Makefile' ]; then
      ./autogen.sh
      CFLAGS="${CFLAGS} -Wno-error=stringop-overflow=" \
      ./configure --prefix='/usr'
    fi
  else
    mkdir -p 'build'
    cd 'build'
    if [ ! -s 'Makefile' ]; then
      CFLAGS=" ${CFLAGS} -Wno-error=stringop-overflow= -Wno-error=stringop-truncation -Wno-error=return-local-addr" \
      cmake -DCMAKE_INSTALL_PREFIX='/usr' ..
    fi
  fi
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'autogen.sh' ]; then
    cd 'build'
  fi
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
