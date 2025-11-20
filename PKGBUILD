# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=grok-jpeg2000-git
pkgver=20.0.2.r2.gf1f36f1
pkgrel=1
pkgdesc="A high performance open source JPEG 2000 codec"
arch=(x86_64)
url="https://github.com/GrokImageCompression/grok"
license=(AGPL-3.0-only)
depends=(glibc gcc-libs libpng libtiff lcms2 libjpeg perl-image-exiftool
		 'perl>=5.42' 'perl<5.43'
		)
makedepends=(git cmake cli11 doxygen python-sphinx patchelf)
provides=(grok-jpeg2000)
conflicts=(grok-jpeg2000)
source=("grok-jpeg2000::git+https://github.com/GrokImageCompression/grok.git")
sha256sums=('SKIP')

pkgver() {
  cd grok-jpeg2000
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF
    -DGRK_BUILD_DOC=ON
    -DGRK_BUILD_JPEG=OFF
    -DGRK_BUILD_LCMS2=OFF
    -DGRK_BUILD_LIBPNG=OFF
    -DGRK_BUILD_LIBTIFF=OFF
  )

  cmake -B build -S "grok-jpeg2000" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  # patchelf --replace-needed liboriginal.so.1 libreplacement.so.1 my-program
  patchelf --replace-needed libperl.so /usr/lib/perl5/5.42/core_perl/CORE/libperl.so build/bin/libgrokj2kcodec.so.20.0.2

  DESTDIR="${pkgdir}" cmake --install build
}
