# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps dot aur dot archlinux dot org>

_rtkver=0.4.3
_fftwver=3.3.4
pkgname=meters-lv2
pkgver=0.9.0
pkgrel=2
pkgdesc="Collection of LV2 plug-ins for audio-level metering from x42"
arch=('i686' 'x86_64')
url="http://x42.github.io/meters.lv2/"
license=('GPL')
groups=('lv2-plugins')
depends=('jack' 'lv2' 'pango')
# for building statically linked libfftw
makedepends=('gcc-fortran')
optdepends=('jack: standalone jack client'
            'liblo: standalone jack client')
# old names of this package
provides=('lv2-meters' 'meters.lv2')
conflicts=('lv2-meters' 'meters.lv2' 'x42-plugins')
source=("$url/archive/v$pkgver.tar.gz"
        "http://www.fftw.org/fftw-${_fftwver}.tar.gz"
        "https://github.com/x42/robtk/archive/v$_rtkver.tar.gz")
md5sums=('afcef1e4c71044216b05fd82f16b405b'
         '2edab8c06b24feeb3b82bbb3ebf3e7b3'
         '66aa0f53081037b229a076c6ed4f6959')


build() {
  cd "${srcdir}/fftw-$_fftwver"

  CFLAGS+=" -fvisibility=hidden -fPIC -Wl,--exclude-libs,ALL" \
  ./configure \
    --enable-single --enable-sse --enable-sse2 --enable-avx --disable-mpi \
    --disable-shared --enable-static
  make

  cd "${srcdir}/meters.lv2-$pkgver"

  export RW=../robtk-$_rtkver/
  ln -sf "${srcdir}/fftw-$_fftwver"
  make submodules
  make
}

package() {
  cd "${srcdir}/meters.lv2-$pkgver"

  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
