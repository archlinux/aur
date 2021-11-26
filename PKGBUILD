# Maintainer: MatrixDJ96
# Contributor: mirh
# Contributor: DJ_L
# Contributor: josephgbr

pkgname=lib32-sane
pkgver=1.0.32
pkgrel=1
pkgdesc="Scanner Access Now Easy (32 bit)"
url="http://www.sane-project.org/"
arch=('x86_64')
license=('GPL')
depends=('lib32-poppler-glib' 'lib32-libtiff>=4.0.0' 'lib32-libgphoto2' 'lib32-libjpeg' 'lib32-libusb' 'lib32-libieee1284' 'lib32-v4l-utils' 'lib32-avahi' 'bash' 'lib32-net-snmp' 'sane')
makedepends=('gcc-multilib')
source=("https://gitlab.com/sane-project/backends/uploads/104f09c07d35519cc8e72e604f11643f/sane-backends-${pkgver}.tar.gz")
sha512sums=('416757d9a69bbc18678d1f16a024ba5a949c571204a68f36009d416be28723886ccea71daaa7da90d20eac9696cd44e567802d6c21c3fc5914b97213bbedb6d5')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'  
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "sane-backends-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib32 \
    --with-docdir=/usr/share/doc/sane \
    --with-avahi \
    --enable-pthread \
    --disable-rpath \
    --enable-libusb_1_0 \
    --disable-locking

  make
}

package() {
  cd "sane-backends-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  rm -rf "${pkgdir}/usr"/{bin,include,share/{doc,locale,man,sane}}
  rm -rf "${pkgdir}/etc"
}
