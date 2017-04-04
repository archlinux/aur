# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: speps <speps at aur dot archlinux dot org>

set -u
_name='cpulimit'
pkgname='limitcpu'
pkgver='2.5'
pkgrel='1'
pkgdesc="A simple ${_name} program that attempts to limit the CPU usage of a process, expressed in percentage."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/${pkgname}/"
license=("GPL")
depends=('glibc')
_verwatch=("https://sourceforge.net/projects/${pkgname}/rss" "\s*<title>.*/${_name}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${_name}-${pkgver}.tar.gz")
sha256sums=('9706d2dd22981b8fb4c0e3424c3cb1813e77257df5d3de22d2e8441b531e34f0')

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
