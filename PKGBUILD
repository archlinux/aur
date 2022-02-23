# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgbasename=libxslt
pkgname=lib32-libxslt
pkgver=1.1.35
pkgrel=1
pkgdesc="XML stylesheet transformation library (32-bit)"
arch=('x86_64')
url="http://xmlsoft.org/XSLT/"
license=('custom')
depends=('lib32-libxml2' 'lib32-libgcrypt' 'libxslt' 'lib32-xz')
makedepends=(git)
_commit=50af4e65da712ceb59f98a7feeeab2ddc3324ab9  # tags/v1.1.35^0
source=("git+https://gitlab.gnome.org/GNOME/libxslt.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgbasename}"
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgbasename}"

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
