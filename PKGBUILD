# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgbasename=libxslt
pkgname=lib32-libxslt
pkgver=1.1.30
pkgrel=1
pkgdesc="XML stylesheet transformation library (32-bit)"
arch=('x86_64')
url="http://xmlsoft.org/XSLT/"
license=('custom')
depends=('lib32-libxml2' 'lib32-libgcrypt' 'libxslt' 'lib32-xz')
makedepends=(gcc-multilib git)
options=(!libtool)
_commit=bec1788d0627db0b510dcb337f989fae0440dbd5  # tags/v1.1.30^0
source=("git+https://git.gnome.org/browse/libxslt#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgbasename}"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "${_pkgbasename}"

  sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgbasename}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --without-python
  make
}

package() {
  cd "${_pkgbasename}"
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgbasename} "${pkgdir}"/usr/share/licenses/${pkgname}

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  rm -f "${pkgdir}"/usr/lib/python*/site-packages/*.a
}
