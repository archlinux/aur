# Maintainer: PitBall

pkgname=lib32-openjpeg
pkgver=1.5.2
pkgrel=1
pkgdesc="An open source JPEG 2000 codec (32bit)"
arch=(x86_64)
license=('BSD')
url="http://www.openjpeg.org"
depends=('lib32-glibc' 'openjpeg')
makedepends=('gcc-multilib')
source=(http://downloads.sourceforge.net/openjpeg.mirror/${pkgname//lib32-}-${pkgver}.tar.gz)
sha1sums=('496e99ff1d37b73bbce6a066dd9bd3576ebca0a2')


build() {
  cd ${pkgname//lib32-}-${pkgver}
  export CC="gcc -m32"
  autoreconf -fi
  # make sure we use system libs
  rm -rf thirdparty
  ./configure --prefix=/usr libdir=/usr/lib32 \
   --enable-shared --disable-static --disable-silent-rules
  make -C libopenjpeg
}

package() {
  cd ${pkgname//lib32-}-${pkgver}
  make DESTDIR="${pkgdir}" -C libopenjpeg install
  rm -rf "$pkgdir"/usr/include
  # install pkgconfig files
  install -m755 -d "${pkgdir}"/usr/{lib32/pkgconfig,share/licenses/lib32-openjpeg}
  install -m644 libopenjpeg1.pc "${pkgdir}"/usr/lib32/pkgconfig/
  ln -s libopenjpeg1.pc "${pkgdir}"/usr/lib32/pkgconfig/libopenjpeg.pc
  # install license link
  ln -s "../openjpeg/LICENSE" "${pkgdir}/usr/share/licenses/lib32-openjpeg/LICENSE"
}
