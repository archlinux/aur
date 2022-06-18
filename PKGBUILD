# AUR maintainer: Swyter <swyterzone+aur@gmail.com>
# 64-bit Maintainer: Ivy Foster <code@escondida.tk>
# Reference: PKGBUILD(5)

pkgname=lib32-sndio
pkgver=1.8.1
pkgrel=2
pkgdesc='A small audio and MIDI framework part of the OpenBSD project (32 bit)'
arch=('x86_64')
url='http://www.sndio.org'
license=('ISC')

# sndio can be built without libbsd, but there are a bunch of individual
# ISC-licensed files by different authors to extract the licenses from
# if done that way. Licenses are complicated.
depends=(lib32-alsa-lib lib32-libbsd)

source=("http://www.sndio.org/sndio-$pkgver.tar.gz")
sha256sums=('f81d37189e072cb4804ac98a059d74f963f69e9945eaff3d0d6a2f98d71a6321')
backup=(etc/default/sndiod)

build() {
  # Modify environment to generate 32-bit ELF. Respects flags defined in makepkg.conf
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
  export LDFLAGS="-m32 ${LDFLAGS}"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PKG_CONFIG_LIBDIR='/usr/lib32/pkgconfig'

  cd "sndio-${pkgver}"

  ./configure \
    --enable-alsa \
    --with-libbsd \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --pkgconfdir=/usr/lib32/pkgconfig

  make
}

package() {
  # as noted by @MarsSeed: Reason: sndio is not actually needed during
  # the build, but it is needed if it is installed. (Because only the
  # x86_64 packages carry the include headers needed if someone wants
  # to run a lib32 build using lib32-sndio.)
  depends+=('sndio')

  cd "sndio-${pkgver}"
  make DESTDIR="$pkgdir/" install

  ln -s "libsndio.so.7.0" "$pkgdir"/usr/lib32/libsndio.so.6.1

  # swy: get rid of the duplicated man files, binaries and headers
  #      install the normal 64-bit sndio package for them
  rm -rf "${pkgdir}/usr"/{share,include}

  # swy: rename the 32-bit utilities to avoid clashes with the
  #      64-bit version counterparts: https://stackoverflow.com/a/208220/674685
  for filename in ${pkgdir}/usr/bin/*; do mv "$filename"{,32}; done;
}

