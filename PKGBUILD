# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Kiko <kikocorsentino@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

set -u
_gitauth='lavv17'
_pkgname='le'
pkgname="${_pkgname}"
pkgver=1.16.4
pkgrel=1
pkgdesc='A text editor in memorial to Norton Editor with block and binary operations'
arch=('i686' 'x86_64')
#url='https://directory.fsf.org/wiki/Le_editor'
url="https://github.com/${_gitauth}/${_pkgname}"
license=('GPL3')
makedepends=('git')
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
_srcdir="${_pkgname}-${pkgver}"
#source=("http://fossies.org/linux/misc/${_pkgname}-${pkgver}.tar.xz")
#source=("http://lav.yar.ru/download/le/${_pkgname}-${pkgver}.tar.gz")
source=(
  'git://git.sv.gnu.org/gnulib'
  "${_pkgname}-${pkgver}.tar.gz::https://github.com/${_gitauth}/${_pkgname}/archive/v${pkgver}.tar.gz"
  '0000-le-curses.patch' # https://github.com/lavv17/le/issues/16
)
sha256sums=('SKIP'
            'c50c986b64ab8b4bffee6fbc6d0fcc331c66495b8c03f5b3a83fe44182a483e9'
            '236ce2c5fff8c91fcb4a77244ed1e43b58aa36fadb05a5b00edb5275448512a0')

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
  # diff -pNaru5 src{.old,}/le-1.16.4 > '0000-le-curses.patch'
  patch -Nup2 < '../0000-le-curses.patch'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    if [ -s 'autogen.sh' ]; then
      #chmod 770 "${srcdir}/gnulib/gnulib-tool"
      PATH="$PATH:${srcdir}/gnulib" \
      ./autogen.sh --prefix='/usr'
    else
      ./configure --prefix='/usr'
    fi
  fi
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  nice make -s -j "${_nproc}"
  set +u
}

package() {
  set -u
  depends=('gcc-libs' 'ncurses')
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}" install
  set +u
}
set +u
