# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: speps <speps at aur dot archlinux dot org>

set -u
_name='cpulimit'
pkgname='limitcpu'
pkgver='3.0'
pkgrel='1'
pkgdesc="A simple ${_name} program that attempts to limit the CPU usage of a process, expressed in percentage."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/${pkgname}/"
license=("GPL")
depends=('glibc')
_verwatch=("https://sourceforge.net/projects/${pkgname}/rss" "\s*<title>.*/${_name}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${_name}-${pkgver}.tar.gz")
md5sums=('bdfae460475241d6253a74abf4dffbad')
sha256sums=('ad2f415eb2bbda3e83a8a2d918ef5e90f52ebcc6fee61e94bf917b3e84ebb49c')

prepare() {
  set -u
  cd "${_name}-${pkgver}"

  # rename to limitcpu to not conflict
  # with cpulimit in [community]

  mv "${_name}.c" "${pkgbase}.c"
  sed -i -e "s|${_name}|${pkgbase}|g" 'Makefile'
  if [ -f "${_name}.1.gz" ]; then
    zcat "${_name}.1.gz" | sed -e "s|${_name}|${pkgbase}|g" | gzip -9 > "${pkgbase}.1.gz"
    rm -f "${_name}.1.gz"
  elif [ -f "${_name}.1" ]; then
    sed -e "s|${_name}|${pkgbase}|g" "${_name}.1" > "${pkgbase}.1"
    rm -f "${_name}.1"
  fi
  set +u
}

build() {
  set -u
  cd "${_name}-${pkgver}"
  make -s -j1
  set +u
}

package() {
  set -u
  cd "${_name}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
  set +u
}
set +u
