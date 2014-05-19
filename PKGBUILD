# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgbasename=libxslt
pkgname=lib32-libxslt
pkgver=1.1.28
pkgrel=2
pkgdesc="XML stylesheet transformation library (32-bit)"
arch=('x86_64')
url="http://xmlsoft.org/XSLT/"
license=('custom')
depends=('lib32-libxml2' 'lib32-libgcrypt' 'libxslt')
makedepends=(gcc-multilib)
options=(!libtool)
source=(ftp://xmlsoft.org/libxslt/${_pkgbasename}-${pkgver}.tar.gz)
md5sums=('9667bf6f9310b957254fdcf6596600b7')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
  ./configure --prefix=/usr --libdir=/usr/lib32 --without-python
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgbasename} "${pkgdir}"/usr/share/licenses/${pkgname}

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  rm -f "${pkgdir}"/usr/lib/python*/site-packages/*.a
}
