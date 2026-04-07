# Maintainer: Samueru-sama <xdglawyer@outlook.com>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libavif-noglycin
conflicts=(libavif)
provides=(libavif)
pkgver=1.4.1
pkgrel=1
_libargparse=ee74d1b53bd680748af14e737378de57e2a0a954 # should match cmake/Modules/LocalLibargparse.cmake
pkgdesc="Library for encoding and decoding .avif files, for gdk-pixbuf2-noglycin"
arch=('x86_64' 'aarch64')
url="https://github.com/AOMediaCodec/libavif"
license=(LicenseRef-libavif)
depends=(aom
         dav1d
         glibc
         libgcc
         libjpeg-turbo
         libpng
         libstdc++
         libwebp
         libxml2
         libyuv
         rav1e
         svt-av1)
makedepends=(cmake
             gdk-pixbuf2-noglycin
             git
             nasm
             pandoc-cli)
source=(git+https://github.com/AOMediaCodec/libavif#tag=v$pkgver
        git+https://github.com/kmurray/libargparse#commit=$_libargparse)
sha256sums=('d9a958dfc7953c1c2ffb7fdf2ae670ea87c7972598bc55d8519d440670bd95bc'
            '235020da02227503eb09961efd664aca6e544a8b3ed5533cf81e1862bb94f48f')

prepare() {
  cp -r libargparse libavif/ext
}
build() {
  cmake -B build -S ${pkgname%-noglycin} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAVIF_BUILD_APPS=ON \
    -DAVIF_BUILD_MAN_PAGES=ON \
    -DAVIF_CODEC_AOM=SYSTEM \
    -DAVIF_CODEC_DAV1D=SYSTEM \
    -DAVIF_CODEC_RAV1E=SYSTEM \
    -DAVIF_CODEC_SVT=SYSTEM \
    -DAVIF_LIBSHARPYUV=SYSTEM \
    -DAVIF_LIBXML2=SYSTEM \
    -DAVIF_BUILD_GDK_PIXBUF=ON
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 ${pkgname%-noglycin}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname%-noglycin}
}
