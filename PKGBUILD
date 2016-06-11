# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Kiko <kikocorsentino@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

set -u
_gitauth='lavv17'
_pkgname='le'
pkgname="${_pkgname}-git"
pkgver=1.16.3.r0.g5bb2515
pkgrel=1
pkgdesc='A text editor in memorial to Norton Editor with block and binary operations'
arch=('i686' 'x86_64')
#url='https://directory.fsf.org/wiki/Le_editor'
url="https://github.com/${_gitauth}/${_pkgname}"
license=('GPL3')
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
_srcdir="${_pkgname}-${pkgver}"
#source=("http://fossies.org/linux/misc/${_pkgname}-${pkgver}.tar.xz")
#source=("http://lav.yar.ru/download/le/${_pkgname}-${pkgver}.tar.gz")
source=('git://git.sv.gnu.org/gnulib' "${_pkgname}-${pkgver}.tar.gz::https://github.com/${_gitauth}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP'
            '23a826afdea4fd43167367c25625ca52aaa2c941c1710990a6dc59fac7eddaed')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  unset _verwatch
  makedepends=('git')
  provides=("${_pkgname}=${pkgver%%.r*}")
  conflicts=("${_pkgname}")
  _srcdir="${_pkgname}"
  source=('git://git.sv.gnu.org/gnulib' "${url//https:/git:}.git")
  :;sha256sums=('SKIP' 'SKIP')
pkgver() {
  set -u
  cd "${_srcdir}"
  #printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's|-|.|g'
  git describe --long | sed -e 's:^v::g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}
fi

prepare() {
  set -u
  cd "${_srcdir}"
  if [ -s 'autogen.sh' ]; then
    #chmod 770 "${srcdir}/gnulib/gnulib-tool"
    PATH="$PATH:${srcdir}/gnulib" \
    ./autogen.sh --prefix='/usr'
  else
    ./configure --prefix='/usr'
  fi
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  depends=('gcc-libs' 'ncurses')
  cd "${_srcdir}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
