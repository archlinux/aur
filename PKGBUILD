# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: speps <speps at aur dot archlinux dot org>

set -u
_name='cpulimit'
pkgname='limitcpu'
pkgver='3.2'
pkgrel='1'
pkgdesc="A simple ${_name} program that attempts to limit the CPU usage of a process, expressed in percentage."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/${pkgname}/"
license=("GPL-2.0-only")
depends=('glibc')
_verwatch=("https://sourceforge.net/projects/${pkgname}/rss" "\s*<title>.*/${_name}-\([0-9\.]\+\)\.tar\.gz\].*" 'f')
source=("https://downloads.sourceforge.net/sourceforge/${pkgname}/${_name}-${pkgver}.tar.gz")
md5sums=('3b7c40749554fcfd4cb4121b51871fda')
sha256sums=('59ffeb1a3517afe45998714be8419260a43632f7cec08f0b026c1eccdff57cfc')

prepare() {
  local -
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
}

build() {
  local -
  set -u
  cd "${_name}-${pkgver}"
  make -s -j1
}

package() {
  local -
  set -u
  cd "${_name}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
}
set +u
