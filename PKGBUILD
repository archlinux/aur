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
  'lib32-gcc-libs' # 'libgcc_s.so' 'libstdc++.so' 'libc.so'
  'lib32-glibc' # 'libm.so'
  'lib32-libieee1284' # 'libieee1284.so'
  'lib32-net-snmp' # 'libnetsnmp.so'
  'lib32-v4l-utils' # 'libv4l1.so'
  'lib32-avahi' # 'libavahi-client.so' 'libavahi-common.so'
  'lib32-curl' 'libcurl.so'
  'lib32-libgphoto2' # 'libgphoto2.so' 'libgphoto2_port.so'
  'lib32-glib2' 'libglib-2.0.so' 'libgobject-2.0.so'
  'lib32-poppler-glib' 'libpoppler-glib.so'
  'lib32-libtiff' 'libtiff.so'
  'lib32-libusb' 'libusb-1.0.so'
  'lib32-libxml2' 'libxml2.so'
  'lib32-cairo' 'libcairo.so'
  'lib32-libjpeg-turbo' 'libjpeg.so'
  'lib32-libpng' 'libpng16.so'
  "sane=${pkgver}"
)
makedepends=(
  'autoconf-archive'
  'texlive-latexextra'
)
provides=('libsane.so')
source=("https://gitlab.com/sane-project/backends/-/archive/${pkgver}/backends-${pkgver}.tar.gz")
sha256sums=('11be4ef05a61277d18698c2c9d86495dff97557bc8da7af44e3f6ef5154e9ea8')

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
  export PKG_CONFIG='/usr/bin/i686-pc-linux-gnu-pkg-config'

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
  make -C build DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/etc"
  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share"

  install -Dm644 "backends-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
