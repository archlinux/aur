# Contributor: DJ_L
# Contributor: josephgbr

pkgname=lib32-sane
pkgver=1.0.24
pkgrel=6
pkgdesc="Scanner Access Now Easy (32 bit)"
url="http://www.sane-project.org/"
arch=('x86_64')
license=('GPL')
depends=('lib32-libtiff>=4.0.0' 'lib32-libgphoto2' 'lib32-libjpeg>=8' 'lib32-libusbx' 'lib32-libcups' 'lib32-libieee1284' 'lib32-v4l-utils' 'lib32-avahi' 'bash' 'net-snmp' 'sane')
makedepends=('gcc-multilib' 'texlive-core')
source=("https://alioth.debian.org/frs/download.php/latestfile/176/sane-backends-${pkgver}.tar.gz"
        'network.patch'
        'segfault-avahi-fix-kodakio.patch')
md5sums=('1ca68e536cd7c1852322822f5f6ac3a4'
         '44e77692c52db15b0f530a1d9a8e1296'
         '039524a38af8721f2e97d45e889295ca')

prepare() {
   cd "sane-backends-${pkgver}"
   # fix http://vasks.debian.org/tracker/?func=detail&atid=410366&aid=313760&group_id=30186
   patch -Np1 -i "${srcdir}/network.patch"
   # fix http://anonscm.debian.org/gitweb/?p=sane/sane-backends.git;a=commit;h=37523b867d411c2f82d08128246be7e38bc9812c
   # #37525
   # https://alioth.debian.org/tracker/?group_id=30186&atid=410366&func=detail&aid=314301
   patch -Np1 -i "${srcdir}/segfault-avahi-fix-kodakio.patch"
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

