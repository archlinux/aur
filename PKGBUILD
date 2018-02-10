# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=fribidi
pkgname=lib32-${_pkgname}
pkgver=0.19.7
pkgrel=4
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (32 bit)"
arch=('x86_64')
license=('LGPL')
url="https://github.com/fribidi/fribidi/"
depends=('lib32-glib2' "${_pkgname}")
makedepends=(git)
_commit=1a6935cd8cd7d907fb3c5f3bcae174bee727c83d  # tags/0.19.7^0
source=("git+https://github.com/fribidi/fribidi#commit=$_commit")
md5sums=('SKIP')

pkgver() {
cd ${_pkgname}
git describe --tags | sed 's/-/+/g'
}

prepare() {
cd ${_pkgname}
git cherry-pick -n 0efbaa9052320a951823a6e776b30a580e3a2b4e
./bootstrap
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

cd ${_pkgname}
./configure --prefix=/usr --libdir=/usr/lib32
make -j1
}

package() {
make -j1 -C ${_pkgname} DESTDIR="${pkgdir}" install

cd ${pkgdir}/usr/
rm -rf {bin,include,share}

}