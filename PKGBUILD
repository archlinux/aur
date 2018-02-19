# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=fribidi
pkgname=lib32-${_pkgname}
pkgver=1.0.1+8+gdf7252b
pkgrel=2
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (32 bit)"
arch=('x86_64')
license=('LGPL')
url="https://github.com/fribidi/fribidi/"
depends=('lib32-glibc' "${_pkgname}")
makedepends=('git' 'lib32-glib2')
_commit=df7252be3fd94ceae8141a09ee86421fdd8b3b7e # master
source=("git+https://github.com/fribidi/fribidi#commit=$_commit")
md5sums=('SKIP')

pkgver() {
cd ${_pkgname}
git describe --tags | sed -e 's/-/+/g' -e 's/^v//'
}

prepare() {
cd ${_pkgname}
NOCONFIGURE=1 ./autogen.sh
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

cd ${_pkgname}
./configure --prefix=/usr --libdir=/usr/lib32
sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
make -j1
}

package() {
make -C ${_pkgname} DESTDIR="${pkgdir}" install

cd ${pkgdir}/usr/
rm -rf {bin,include,share}
}

check() {
cd "${srcdir}/${_pkgname}"
make check
}

