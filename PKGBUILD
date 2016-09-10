# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

_pkgname=tevent
pkgname=lib32-${_pkgname}
pkgver=0.9.30
pkgrel=1
pkgdesc="An event system based on the talloc memory management library (lib32)"
arch=('x86_64')
url="https://tevent.samba.org"
source=("http://samba.org/ftp/tevent/${_pkgname}-${pkgver}.tar.gz")
license=('GPL3')
depends=('lib32-talloc')
makedepends=('python2')
optdepends=('python2: for python bindings')
md5sums=('c0bcce72229976d4b71ef0d1106172e2')

build() {
  cd "${_pkgname}-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  # change to use python2
  sed -i -e "s|/usr/bin/env python$|/usr/bin/env python2|" buildtools/bin/waf
  export PYTHON=/usr/bin/python2
  
  ./configure --prefix=/usr \
              --libdir=/usr/lib32 \
              --bundled-libraries=NONE \
              --builtin-libraries=replace \
              --disable-python
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  
  make DESTDIR="${pkgdir}" install
  
  rm -rf "${pkgdir}"/usr/{include,share}
}

