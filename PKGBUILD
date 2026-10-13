# Maintainer: Muhammed Dali <dali.nira.12.1453kerinyoli@gmail.com>

pkgname=dalinira
pkgver=8.0.2
pkgrel=1
pkgdesc="DaliNira Browser native binary package"
arch=('x86_64')
url="https://github.com/Muhammed-Dali/DaliNira-Browser"
# DaliNira itself, then its private WebKitGTK runtime (the same license set
# Arch Linux's webkit2gtk-4.1 declares; texts in
# /usr/share/licenses/dalinira-browser/webkitgtk/LICENSE.WebKitGTK).
license=(
  'GPL-3.0-only'
  'AFL-2.0 OR GPL-2.0-or-later'
  'Apache-2.0'
  'Apache-2.0 WITH LLVM-exception'
  'BSD-2-Clause'
  'BSD-2-Clause-Views'
  'BSD-3-Clause'
  'BSD-Source-Code'
  'BSL-1.0'
  'bzip2-1.0.6'
  'GPL-2.0-only'
  'GPL-3.0-only WITH Autoconf-exception-3.0'
  'GPL-3.0-or-later WITH Bison-exception-2.2'
  'ICU'
  'ISC'
  'LGPL-2.1-only'
  'LGPL-2.1-or-later'
  'MIT'
  'MPL-1.1'
  'MPL-2.0'
  'NCSA'
  'NCSA OR MIT'
  'OFL-1.1'
  'SunPro'
  'Unicode-TOU'
)
depends=(
  'ffmpeg'
  'libpsl'
  'openssl'
  'qt6-base'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-webengine'
  # The WebKit engine's HTML5 media runtime (docs/webkit-media-runtime.md).
  # gst-plugins-good: autoaudiosink (WebKitGTK aborts the web process without
  # it), WebM/MP4 demuxers, VP9; gst-plugins-bad: opusparse, which YouTube's
  # Opus audio needs through MSE; gst-libav: H.264 and AAC.
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-libav'
  # Libraries of the private WebKitGTK runtime (packaging/webkit-runtime),
  # which replaces the system webkit2gtk-4.1 for DaliNira.
  # The runtime's web-process sandbox runs /usr/bin/bwrap and
  # /usr/bin/xdg-dbus-proxy, as Arch's webkit2gtk-4.1 depends on them.
  'bubblewrap'
  'xdg-dbus-proxy'
  # libegl, libgl, libgles: loaded at run time through libepoxy.
  'at-spi2-core'
  'cairo'
  'enchant'
  'expat'
  'fontconfig'
  'freetype2'
  'glib2'
  'glibc'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'harfbuzz'
  'harfbuzz-icu'
  'hyphen'
  'icu'
  'lcms2'
  'libatomic'
  'libavif'
  'libdrm'
  'libegl'
  'libepoxy'
  'libgcc'
  'libgcrypt'
  'libgl'
  'libgles'
  'libjpeg-turbo'
  'libjxl'
  'libmanette'
  'libpng'
  'libseccomp'
  'libsecret'
  'libsoup3'
  'libstdc++'
  'libsystemd'
  'libtasn1'
  'libwebp'
  'libx11'
  'libxml2'
  'libxslt'
  'mesa'
  'pango'
  'sqlite'
  'ttf-font'
  'wayland'
  'zlib'
)
optdepends=(
  'qt6-wayland: native Wayland windows for the Chromium engine (QT_QPA_PLATFORM=wayland)'
)
provides=('dalinira-browser' 'dalinira-bin' 'dalinira-webmedia')
conflicts=('dalinira-browser' 'dalinira-bin' 'dalinira-webmedia')
replaces=('dalinira-bin' 'dalinira-webmedia')
# The portable archive is built on Debian 12; its WebKit runtime is replaced
# by the same patched runtime built on Arch Linux (the libraries it links,
# ICU and libxml2 among them, differ between the two).
_runtime="dalinira-webkit-runtime-${pkgver}-arch-x86_64.tar.zst"
source=("dalinira-browser-${pkgver}-linux-x86_64.tar.zst::https://github.com/Muhammed-Dali/DaliNira-Browser/releases/download/v${pkgver}/dalinira-browser-${pkgver}-linux-x86_64.tar.zst"
        "${_runtime}::https://github.com/Muhammed-Dali/DaliNira-Browser/releases/download/v${pkgver}/${_runtime}")
noextract=("${_runtime}")
sha256sums=('73ffa7adb04d24e8b6de6714570d5697ec240d79ec86620fd892c05321a0ec35'
            '9f3cde1b065f3f9306ff68b28d70ffb7111fc9611054ee6a54e78809ca8dc124')

package() {
  install -dm755 "${pkgdir}/usr"
  cp -R "${srcdir}/usr/." "${pkgdir}/usr/"
  rm -rf "${pkgdir}/usr/lib/dalinira-browser/webkit" "${pkgdir}/usr/share/doc/dalinira-browser/webkitgtk"
  bsdtar -xf "${srcdir}/${_runtime}" -C "${pkgdir}"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  # WebKitGTK licenses, patches, build record and source notice.
  ln -s ../../doc/dalinira-browser/webkitgtk "${pkgdir}/usr/share/licenses/${pkgname}/webkitgtk"
}
