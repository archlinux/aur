# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-libexosip2
pkgver=5.0.0
pkgrel=2
pkgdesc="A library that hides the complexity of using SIP for multimedia session establishement (32-bit)"
arch=('x86_64')
url="https://savannah.nongnu.org/projects/exosip/"
license=('GPL')
depends=('lib32-glibc' 'lib32-libosip2>=4.0.0' 'lib32-openssl' 'libexosip2')
makedepends=('lib32-gcc-libs')
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')
source=("https://download.savannah.gnu.org/releases/exosip/libexosip2-${pkgver}.tar.gz"
        "openssl110.patch")
sha256sums=('a26558594de95405d3adeee554a7c10cb3ec5a9316a879e679b53a99a9cf2e1f'
            'e60ef8fe99e7aa8641398a70708ab1e4f85d04872f1c658949afc4fd657c4d5a')

prepare() {
  cd "${srcdir}/libexosip2-${pkgver}"
  patch -Np1 -i "${srcdir}/openssl110.patch"
}

build() {
  cd "${srcdir}/libexosip2-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
  ./configure --prefix=/usr --libdir=/usr/lib32
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "${srcdir}/libexosip2-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
