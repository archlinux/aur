# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>

pkgname=lib32-libexif
pkgver=0.6.25
pkgrel=1
pkgdesc="A library to parse an EXIF file and read the data from those tags (32-bit)"
arch=('x86_64')
license=('LGPL')
url="https://github.com/libexif/libexif"
depends=("${pkgname#lib32-}" 'lib32-glibc')
makedepends=('gcc-multilib')
options=('!libtool')
source=(${url}/archive/${pkgname#lib32-}-${pkgver//./_}-release.tar.gz)
sha512sums=('9e42af0d898a9d832d7b146a2085fb08eafdbb5ae476184aee1b495632172749d910f581246d22a0c68382ea9d969de54bd9539d4d877ad4dd6ca989e1b6d8db')

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "${pkgname#lib32-}-${pkgname#lib32-}-${pkgver//./_}-release"
  autoreconf -i
  ./configure --build=i686-pc-linux-gnu --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "${pkgname#lib32-}-${pkgname#lib32-}-${pkgver//./_}-release"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{include,share}
}
