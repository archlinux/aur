# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: quequotion <quequotion at bugmenot dot com>
# Contributor: Andrea Scarpino <andrea at archlinux dot org>
# Contributor: Pierre Schmitz <pierre at archlinux dot de>

pkgname=lib32-libical
pkgver=1.0.1
pkgrel=1
pkgdesc="An open source reference implementation of the icalendar data type and serialization format (32-bit)"
arch=('x86_64')
url='https://github.com/libical/libical'
license=('LGPL' 'MPL')
depends=('lib32-glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname#lib32-}/${pkgname#lib32-}/archive/v${pkgver}.tar.gz")
sha512sums=('efce88c73352fc34e9f7eda2234bdb593e917b33d1373cc6e6a21a72db1b14f2ed72976d6084dddcd8f07b08a15d5f04370bc825695d2fd40cc7b8488a7a977f')

prepare() {
  cd "${srcdir}/${pkgname#lib32-}-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export LDFLAGS='-m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  [ -d build ] || mkdir build
}

build() {
  cd "${srcdir}/${pkgname#lib32-}-${pkgver}/build"
  cmake ../ \
        -DCMAKE_BUILD_TYPE=Release \
        -DSHARED_ONLY=true \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DLIB_SUFFIX=32
  make
}

package() {
  cd "${srcdir}/${pkgname#lib32-}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{share,include,bin}}
}
