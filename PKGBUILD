# Maintainer: mirh
# Contributor: DJ_L
# Contributor: josephgbr

pkgname=lib32-sane
pkgver=1.0.29
pkgrel=1
pkgdesc="Scanner Access Now Easy (32 bit)"
url="http://www.sane-project.org/"
arch=('x86_64')
license=('GPL')
depends=('lib32-libtiff>=4.0.0' 'lib32-libgphoto2' 'lib32-libjpeg>=8' 'lib32-libusbx' 'lib32-libieee1284' 'lib32-v4l-utils' 'lib32-avahi' 'bash' 'net-snmp' 'sane')
makedepends=('gcc-multilib')
source=("https://gitlab.com/sane-project/backends/uploads/54f858b20a364fc35d820df935a86478/sane-backends-$pkgver.tar.gz"
        'network.patch')
sha512sums=('9ee431b0c048119719e15905f8743c7a0fd8bc6fcee81d75df8459a989cab7e39bf045518976713a7e1d94c816dd1a1e0fa190612d815c0ddb6a51d2abf3fd54'
            '04b65a06d2c76dde6fce501ba823e999eb89ea41573f887f9e7d5347f3aa5e35310fad69313e99f873640e29a9849372d2ff995678593a0781fba73b464bec0d')

prepare() {
   cd "sane-backends-${pkgver}"
   # fix http://vasks.debian.org/tracker/?func=detail&atid=410366&aid=313760&group_id=30186
   patch -Np1 -i "${srcdir}/network.patch"
   # fix https://gitlab.com/sane-project/backends/-/issues/239
   sed -i 's@CIES = $(COMMON_LIBS)@CIES = ../lib/liblib.la@g' backend/Makefile*
}

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
