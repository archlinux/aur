# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Original maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=gstreamer-svt-av1
pkgname="$_pkgname-git"
pkgver=r4427.gfdcc1663
pkgrel=1
pkgdesc="This plugin provides svtav1enc element to GStreamer in order to use the Scalable Video Technology for AV1 Encoder (SVT-AV1)"
url="https://gitlab.com/AOMediaCodec/SVT-AV1/-/tree/master/gstreamer-plugin"
license=('BSD-3-Clause-Clear' 'custom: Alliance for Open Media Patent License 1.0')
arch=('x86_64')
provides=("libgstsvtav1enc.so")
depends=('gst-plugins-base-libs' 'svt-av1')
makedepends=('meson')
source=("git+https://gitlab.com/AOMediaCodec/SVT-AV1?path=gstreamer-plugin"
        "https://gitlab.com/AOMediaCodec/SVT-AV1/-/raw/master/LICENSE.md"
        "https://gitlab.com/AOMediaCodec/SVT-AV1/-/raw/master/PATENTS.md")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
_srcdir="SVT-AV1"

pkgver() {
    cd "${srcdir}/${_srcdir}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_srcdir}" || exit
    # Comment out svtav1enc->svt_config->high_dynamic_range_input lines, idk why this fails but :P
	sed -i "s/svtav1enc->svt_config->high_dynamic_range_input/\/\/ svtav1enc->svt_config->high_dynamic_range_input/g" gstreamer-plugin/gstsvtav1enc.c
}

build() {
  arch-meson SVT-AV1/gstreamer-plugin build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE.md PATENTS.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
