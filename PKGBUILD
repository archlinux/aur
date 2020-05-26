# Maintainer: mirh
# Contributor: DJ_L
# Contributor: josephgbr

pkgname=lib32-sane
pkgver=1.0.30
pkgrel=1
pkgdesc="Scanner Access Now Easy (32 bit)"
url="http://www.sane-project.org/"
arch=('x86_64')
license=('GPL')
depends=('lib32-libtiff>=4.0.0' 'lib32-libgphoto2' 'lib32-libjpeg>=8' 'lib32-libusbx' 'lib32-libieee1284' 'lib32-v4l-utils' 'lib32-avahi' 'bash' 'lib32-net-snmp' 'sane')
makedepends=('gcc-multilib')
source=("https://gitlab.com/sane-project/backends/uploads/c3dd60c9e054b5dee1e7b01a7edc98b0/sane-backends-$pkgver.tar.gz")
sha512sums=('e9f4ab1f21d5ab0e09b101389c325947824945af968f08b307485f79d4dc4c134b8a1979fb0cf0cfa72435abffe70d0060748a2c2ec46514eb15a0442ee181a5')

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'  
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "sane-backends-${pkgver}"

  ./configure --prefix=/usr --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libdir=/usr/lib32 \
    --with-docdir=/usr/share/doc/sane \
    --enable-avahi \
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
