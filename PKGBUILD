# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Kiko <kikocorsentino@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

set -u
_pkgname='le'
pkgname="${_pkgname}-git"
pkgver=v1.15.1.r9.g179ba50
pkgrel=1
pkgdesc='A text editor in memorial to Norton Editor with block and binary operations'
arch=('i686' 'x86_64')
url='https://directory.fsf.org/wiki/Le_editor'
license=('GPL3')
_srcdir="${_pkgname}-${pkgver}"
#source=("http://fossies.org/linux/misc/${_pkgname}-${pkgver}.tar.xz")
source=("http://lav.yar.ru/download/le/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('db5baabc1b80c42504d64484a83d48388ecbb3b216a7de9c67fea8b19f1c95bd')

if [ "${pkgname%-git}" != "${pkgname}" ]; then # this is easily done with case
  makedepends=('git')
  provides=("${_pkgname}=${pkgver%%.r*}")
  conflicts=("${_pkgname}")
  _srcdir="${_pkgname}"
  source=('git://git.sv.gnu.org/gnulib' 'git://github.com/lavv17/le.git')
  :;sha256sums=('SKIP' 'SKIP')
pkgver() {
  set -u
  cd "${_srcdir}"
  #printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's|-|.|g'
  git describe --long | sed -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}
fi

prepare() {
  set -u
  cd "${_srcdir}"
  if [ -z "${SKIP_PREPARE:-}" ]; then
    if [ -s 'autogen.sh' ]; then
      chmod 770 "${srcdir}/gnulib/gnulib-tool"
      PATH="$PATH:${srcdir}/gnulib"
      ./autogen.sh
    fi
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
