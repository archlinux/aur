# Maintainer: MatrixDJ96
# Contributor: mirh
# Contributor: DJ_L
# Contributor: josephgbr

pkgname=lib32-sane
pkgver=1.2.1
pkgrel=2
pkgdesc='Scanner Access Now Easy (32-bits)'
url='http://www.sane-project.org'
arch=('x86_64')
license=('GPL')
depends=(
  'lib32-gcc-libs'
  'lib32-glibc'
  'lib32-libpng'
  'lib32-libieee1284'
  'lib32-net-snmp'
  'lib32-v4l-utils'
  "sane=${pkgver}"
)
makedepends=('autoconf-archive'
  'lib32-avahi'
  'lib32-curl'
  'lib32-glib2'
  'lib32-libjpeg-turbo'
  'lib32-libtiff'
  'lib32-libusb'
  'lib32-libxml2'
  'lib32-poppler-glib'
  'gcc-multilib'
  'texlive-latexextra'
)
provides=('libsane.so')
source=("https://gitlab.com/sane-project/backends/-/archive/${pkgver}/backends-${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  mkdir -p build

  cd "backends-${pkgver}"
  # create version files, so that autotools macros can use them:
  # https://gitlab.com/sane-project/backends/-/issues/440
  echo "${pkgver}" > .tarball-version
  echo "${pkgver}" > .version
  autoreconf -fiv
}

build() {

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export SNMP_CONFIG_PATH="/usr/bin/net-snmp-config-32"

  cd build
  ../"backends-${pkgver}"/configure \
    --prefix=/usr \
    --disable-locking \
    --disable-rpath \
    --with-docdir=/usr/share/doc/sane \
    --enable-pthread \
    --localstatedir=/var \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libdir=/usr/lib32 \
    --with-avahi \
    --with-libcurl \
    --with-pic \
    --with-poppler-glib \
    --with-usb \
    --host=i686-linux-gnu

  # circumvent overlinking in libraries
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool

  make
}

package() {
  depends+=(
    'lib32-avahi' 'libavahi-client.so' 'libavahi-common.so'
    'lib32-curl' 'libcurl.so'
    'lib32-libgphoto2' 'libgphoto2.so' 'libgphoto2_port.so'
    'lib32-glib2' 'libgobject-2.0.so'
    'lib32-poppler-glib' 'libpoppler-glib.so'
    'lib32-libtiff' 'libtiff.so'
    'lib32-libusb' 'libusb-1.0.so'
    'lib32-libxml2' 'libxml2.so'
    'lib32-cairo' 'libcairo.so'
  )

  make -C build DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/etc"
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share"


  install -Dm644 "backends-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
