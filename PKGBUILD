# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='dmon'
pkgver='0.4.5'
pkgrel='3'
pkgdesc='Toolset for daemonizing and supervising processes'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/aperezdc/dmon'
license=('MIT')
depends=('glibc')
makedepends=('make' 'gnupg' 'git')
validpgpkeys=('5AA3BC334FD7E3369E7C77B291C559DBE4C9123B')
source=("git+https://github.com/aperezdc/dmon.git#tag=v${pkgver}"
        "git+https://github.com/aperezdc/wheel.git")
sha1sums=('SKIP' 'SKIP')

_checktag () {
  local -a line
  while read -r -a line ; do
    if [[ ${line[1]} = VALIDSIG && ${line[-1]} = ${validpgpkeys[0]} ]] ; then
      return 0
    fi
  done < <( git verify-tag "v${pkgver}" --raw 2>&1 )
  return 1
}

prepare () {
  cd dmon
  git submodule init
  git config submodule.wheel.url "${srcdir}/wheel"
  git submodule update
  if ! git verify-tag "v${pkgver}" || ! _checktag ; then
    exit 42
  fi
}

build() {
  cd dmon
  make MULTICALL=1 prefix=/usr
}

package() {
  cd dmon
  make MULTICALL=1 prefix=/usr DESTDIR="${pkgdir}/" install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgver}/README"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
