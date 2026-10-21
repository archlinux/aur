# Maintainer: liblaf <30631553+liblaf@users.noreply.github.com>
# SPDX-License-Identifier: 0BSD
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=manggo
pkgver=1.2.0
pkgrel=1
pkgdesc='Desktop translation and screenshot OCR assistant'
arch=('x86_64' 'aarch64')
url='https://manggo.pylogmon.cn/'
license=('LicenseRef-Manggo-Proprietary')
depends=(
  'dbus'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'krb5'
  'libdrm'
  'libglvnd'
  'libpulse'
  'libx11'
  'libxcb'
  'libxext'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'mesa'
  'openssl'
  'shared-mime-info'
  'wayland'
  'xcb-util'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'zlib'
  'zstd'
)
depends_aarch64=(
  'brotli'
  'gst-plugins-bad-libs'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gstreamer'
  'libice'
  'libsm'
)
makedepends=('patchelf')
optdepends=(
  'at-spi2-core: accessibility support for selection features'
  'libpipewire: PipeWire audio and screen capture integration'
  'libva: VA-API video acceleration (also requires a driver for your GPU)'
  'wl-clipboard: clipboard integration on Wayland'
  'xdg-desktop-portal: desktop integration on Wayland (install a backend for your desktop)'
)
# Preserve bundled libraries, Qt plugins, models, and relative library paths.
options=('!strip' '!debug')
source_x86_64=("manggo_${pkgver}_amd64.deb::https://gitcode.com/Pylogmon/Manggo/releases/download/${pkgver}/manggo_${pkgver}_amd64.deb")
sha256sums_x86_64=('d3ebbbdc6cc697304c4c75649b729e6dc46f6bb1b752fd02d752856dadf6a66e')
source_aarch64=("manggo_${pkgver}_arm64.deb::https://gitcode.com/Pylogmon/Manggo/releases/download/${pkgver}/manggo_${pkgver}_arm64.deb")
sha256sums_aarch64=('f80492b862413b238d407a42e1f5bb2fd968a04fbc64171215624f811d222730')

package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

  # This Apache-2.0 library leaks an upstream CI path; use its bundled peers.
  # shellcheck disable=SC2016
  patchelf --set-rpath '$ORIGIN:$ORIGIN/..' \
    "${pkgdir}/usr/lib/manggo/bin/libsherpa-onnx-c-api.so"

  # Keep the upstream executable name for desktop actions and plugin handling.
  ln -s Manggo "${pkgdir}/usr/bin/manggo"

  install -Dm644 "${pkgdir}/usr/share/doc/Manggo/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgdir}/usr/share/doc/Manggo/USER_AGREEMENT.zh-CN.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/USER_AGREEMENT.zh-CN.txt"
}
