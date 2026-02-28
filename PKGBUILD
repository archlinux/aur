# Maintainer: Samueru-sama <xdglawyer@outlook.com>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=libavif-noglycin
conflicts=(libavif)
provides=(libavif)
pkgver=1.3.0
pkgrel=5
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
         libyuv
         rav1e
         svt-av1)
makedepends=(cmake
             gdk-pixbuf2-noglycin
             git
             nasm
             pandoc-cli)
source=(git+https://github.com/AOMediaCodec/libavif#tag=v$pkgver)
sha256sums=('71f5a51a8e1a9198cd9f2e38c158e50815989bb1fe28cc80e481aa16a3e1ec2d')

prepare() {
  cd ${pkgname%-noglycin}
  # SVT AV1 4.0 Rebuild
  # https://github.com/AOMediaCodec/libavif/pull/2971
  git cherry-pick -n 34a14decb6732c8abf01e6135a9a1dd55b58e33a
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
    -DAVIF_BUILD_GDK_PIXBUF=ON
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
  install -Dm644 ${pkgname%-noglycin}/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname%-noglycin}
}
