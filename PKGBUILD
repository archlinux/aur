# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Mark Weiman <mark dot weiman at markzz dot com>

_name=tevent
pkgname=lib32-${_name}
pkgver=0.9.37
pkgrel=1
pkgdesc="An event system based on the talloc memory management library (lib32)"
arch=('x86_64')
url="https://tevent.samba.org"
license=('GPL3')
source=("https://samba.org/ftp/${_name}/${_name}-${pkgver}.tar.gz")
depends=('lib32-talloc' 'tevent')
makedepends=('lib32-python2')
optdepends=('lib32-python2: for python bindings')
sha256sums=('168345ed65eac03785cf77b95238e7dc66cbb473a42811693a6b0916e5dae7e0')

prepare() {
  cd ${_name}-${pkgver}
  sed -i -e "s|/usr/bin/env python$|/usr/bin/env python2|" buildtools/bin/waf
}

build() {
  cd ${_name}-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PYTHON='/usr/bin/python2-32'
  export PYTHON_CONFIG='/usr/bin/python2-32-config'
  
  ./configure --prefix=/usr \
    --libdir=/usr/lib32 \
    --bundled-libraries=NONE \
    --builtin-libraries=replace
    
  make
}

package() {
  cd ${_name}-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}
