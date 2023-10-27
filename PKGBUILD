# Maintainer:
# Contributor: Denis Kasak <dkasak|AT|termina.org.uk>
# Contributor: Ameysh <trader9@gmail.com>
# Contributor: xsmile <sascha_r gmx de>

_pkgname="ta-lib"
pkgname="$_pkgname"
pkgver=0.5.0
pkgrel=1
pkgdesc="A library providing common functions for the technical analysis of financial market data"
#url="http://ta-lib.org"
url="https://github.com/TA-Lib/ta-lib"
license=('BSD')
arch=('x86_64' 'i686')

_pkgsrc="$_pkgname-${pkgver%%.r*}"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"https://github.com/TA-Lib/ta-lib/archive/refs/tags/v${pkgver%%.r**}.$_pkgext"

  "0001-fix-werror-format-security.patch"
  "0002-as-needed.patch"

  'LICENSE'
)
sha256sums=(
  '43e3761cf6bc4a5ab6c675268a09a72ea074643c6e06defe5e4b4e51eae1ea50'
  '770c363ecae6fedcf07df1c5e92dff5ac8221c63a93778e1de549b33a65eaa20'
  'c3106f22a2a620f16182f60e862a75aa8555782a8b02c371acabe4c3ef4542c8'
  '10ddcfc0d685173fdee2d7e8791540bb1a8526a0f66f7795bdf7dad23457b10e'
)

prepare() {
  cd "$_pkgsrc"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]] ; then
      printf '\nApplying patch: %s\n' "$src"
      patch -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
}

build() {
  cd "$_pkgsrc"

  autoreconf -i
  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir:?}" install
  install -Dm644 "${srcdir:?}/LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname/"
}
