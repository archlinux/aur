# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=gstreamer-svt-av1
pkgver=3.1.2
pkgrel=1
pkgdesc="This plugin provides svtav1enc element to GStreamer in order to use the Scalable Video Technology for AV1 Encoder (SVT-AV1)"
url="https://gitlab.com/AOMediaCodec/SVT-AV1/-/tree/master/gstreamer-plugin"
license=('BSD-3-Clause-Clear' 'custom: Alliance for Open Media Patent License 1.0')
arch=('x86_64')
provides=("libgstsvtav1enc.so")
depends=('gst-plugins-base-libs' 'svt-av1')
makedepends=('meson')
source=("SVT-AV1-v$pkgver.tar.bz2::https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v$pkgver/SVT-AV1-v$pkgver.tar.bz2?path=gstreamer-plugin"
        "https://gitlab.com/AOMediaCodec/SVT-AV1/-/raw/v$pkgver/LICENSE.md"
        "https://gitlab.com/AOMediaCodec/SVT-AV1/-/raw/v$pkgver/PATENTS.md")
sha256sums=('b3c0f2d8c3fcd356c008c39dd6e4c68f54a57054c5b4d1f6e45cc0d45451cba6'
            '0acc2fcb27472bdc9aaf8b71f37055bbdac4f54671b7d922f241bd7fcd0dd3e6'
            '20678ab10402659106dc4c147c97b2a6e94b5c0695415e15a8f195ebc3547922')

prepare() {
# Comment out svtav1enc->svt_config->high_dynamic_range_input lines
# Fixes build, thanks @That1Calculator
  cd SVT-AV1-v$pkgver-gstreamer-plugin/gstreamer-plugin
  sed -i "s/svtav1enc->svt_config->high_dynamic_range_input/\/\/ svtav1enc->svt_config->high_dynamic_range_input/g" gstsvtav1enc.c
}

build() {
  arch-meson SVT-AV1-v$pkgver-gstreamer-plugin/gstreamer-plugin build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE.md PATENTS.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
