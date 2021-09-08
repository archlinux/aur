# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgbasename=libxslt
pkgname=lib32-libxslt
pkgver=1.1.34
pkgrel=2
pkgdesc="XML stylesheet transformation library (32-bit)"
arch=('x86_64')
url="http://xmlsoft.org/XSLT/"
license=('custom')
depends=('lib32-libxml2' 'lib32-libgcrypt' 'libxslt' 'lib32-xz')
makedepends=(git)
_commit=3653123f992db24cec417d12600f4c67388025e3  # tags/v1.1.34^0
source=("git+https://gitlab.gnome.org/GNOME/libxslt.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgbasename}"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgbasename}"

  # Fix build with libxml libxml2-2.9.12
  git cherry-pick -n 9ae2f94df1721e002941b40665efb762aefcea1a
  git cherry-pick -n 824657768aea2cce9c23e72ba8085cb5e44350c7
  git cherry-pick -n 77c26bad0433541f486b1e7ced44ca9979376908

  sed -e 's|/usr/bin/python -u|/usr/bin/python2 -u|g' -e 's|/usr/bin/python$|/usr/bin/python2|g' -i python/tests/*.py
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "${_pkgbasename}"
  ./configure --prefix=/usr --libdir=/usr/lib32 --without-python --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${_pkgbasename}"
  make check
}

package() {
  cd "${_pkgbasename}"
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/usr/share/licenses
  ln -s ${_pkgbasename} "${pkgdir}"/usr/share/licenses/${pkgname}

  rm -rf "${pkgdir}"/usr/{include,share,bin}
  rm -f "${pkgdir}"/usr/lib/python*/site-packages/*.a
}
