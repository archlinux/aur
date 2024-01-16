# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Bastien Dejean <baskerville@lavabit.com>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

set -u
_gitauth='fragglet'
_pkgname='lhasa'
pkgname="${_pkgname}-git"
pkgver=0.4.0.r46.g82d1578
pkgrel=1
pkgdesc='Free Software LHA implementation'
arch=('i686' 'x86_64')
url="http://${_gitauth}.github.com/${_pkgname}/"
license=('custom:ISC')
conflicts=('lha')
options=('!libtool')
_giturl="https://github.com/${_gitauth}/${_pkgname}"
#_verwatch=("${_giturl}/releases" "${_giturl#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
_srcdir="${_pkgname}-${pkgver}"
source=("https://github.com/${_gitauth}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('SKIP')
sha256sums=('SKIP')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  unset _giturl
  _srcdir="${_pkgname}"
  makedepends+=('git')
  url="https://github.com/${_gitauth}/${_pkgname}"
  _verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
  source=("${_srcdir}::git+${url}.git")
  :;sha256sums=('SKIP')
  provides=("${_pkgname}=${pkgver%%.r*}")
  conflicts+=("${_pkgname}")
pkgver() {
  set -u
  cd "${_srcdir}"
  local _vcsver="$(git describe --long --tags | sed -e 's:^v::' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g')"
  local _vcsct="$(git rev-list --count HEAD)"
  echo "${_vcsver//.r0./.r${_vcsct}.}"
  set +u
}
fi

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    if [ -s 'autogen.sh' ]; then
      ./autogen.sh --prefix='/usr' --enable-static='no'
    else
      ./configure --prefix='/usr' --enable-static='no'
    fi
  fi
  nice make -s
  set +u
}

package() {
  set -u
  depends=('glibc')
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install

  # license
  install -Dpm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
