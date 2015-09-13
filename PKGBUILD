# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: speps <speps at aur dot archlinux dot org>

set -u
_name='cpulimit'
pkgname='limitcpu'
pkgver='2.2'
pkgrel='1'
pkgdesc="A simple ${_name} program that attempts to limit the CPU usage of a process, expressed in percentage."
arch=('i686' 'x86_64')
url="http://${pkgname}.sourceforge.net/"
license=("GPL")
depends=('glibc')
_verwatch=("http://sourceforge.net/projects/${pkgname}/files/${pkgname}/" "/projects/${pkgname}/files/${pkgname}/${_name}-\([0-9\.]\+\)\.tar\.gz/stats/timeline" 'l')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${_name}-${pkgver}.tar.gz")
sha256sums=('3f64daa5c4ab9245fa6ae5b564a2ffb3ae60677785103a207fd5f9c5c4cc29e4')

prepare() {
  set -u
  cd "${srcdir}/${_name}-${pkgver}"

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
  cd "${srcdir}/${_name}-${pkgver}"
  make # -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${_name}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
  set +u
}
set +u
