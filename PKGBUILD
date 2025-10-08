# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: young.acinonyx <young.acinonyx@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=lib32-libvpx1.10
pkgver=1.10.0
pkgrel=1
pkgdesc='VP8 and VP9 codec, provides libvpx.so.6'
arch=(x86_64)
url="https://www.webmproject.org/"
license=(BSD)
depends=(lib32-gcc-libs libvpx1.10)
makedepends=(git nasm)
provides=(libvpx.so)
source=("https://github.com/webmproject/libvpx/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('85803ccbdbdd7a3b03d930187cb055f1353596969c1f92ebec2db839fa4f834a')

build() {
  cd "$srcdir/libvpx-${pkgver}"

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --target=x86-linux-gcc \
    --disable-install-bins \
    --disable-install-docs \
    --disable-install-srcs \
    --enable-pic \
    --enable-postproc \
    --enable-runtime-cpu-detect \
    --enable-shared \
    --enable-vp8 \
    --enable-vp9 \
    --enable-vp9-highbitdepth \
    --enable-vp9-temporal-denoising \
    --disable-unit-tests
  make
}

package() {
  cd "$srcdir/libvpx-${pkgver}"
  make install DESTDIR="$pkgdir"
  # Remove unneeded files so that only the shared library remains
  rm -rf "$pkgdir/usr"/{bin,include,lib32/{libvpx.{a,so},pkgconfig},share}
  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libvpx1.10 "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
