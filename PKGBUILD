# Maintainer: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: zhangkaizhao <zhangkaizhao at gmail dot com>
pkgname=dooble-bin
_pkgname=Dooble
pkgver=2023.08.30
pkgrel=3
pkgdesc="Web browser based on QtWebEngine"
arch=("x86_64")
url="https://textbrowser.github.io/dooble/"
_githuburl="https://github.com/textbrowser/${pkgname%-bin}"
license=('custom')
depends=(
  'at-spi2-core'
  'bash'
  'cairo'
  'freetype2'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gpgme'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  'libcups'
  'libdrm'
  'libglvnd'
  'libx11'
  'libxcb'
  'libxext'
  'libxkbcommon'
  'libxkbcommon-x11'
  'libxrandr'
  'pango'
  'postgresql-libs'
  'qt6-base'
  'qt6-charts'
  'qt6-declarative'
  'qt6-multimedia'
  'qt6-positioning'
  'qt6-serialport'
  'qt6-svg'
  'qt6-tools'
  'qt6-wayland'
  'qt6-webchannel'
  'qt6-webengine'
  'unixodbc'
  'wayland'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'zlib'
)
optdependes=(
  'bzip2: needed in plugins/multimedia/libffmpegmediaplugin.so'
)
makedepends=(
  'findutils'
  'gendesk'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=(
  "${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/textbrowser/dooble/${pkgver}/LICENSE"
)
sha256sums=('407057d48fa3aaf78c378c9b8e9ad8181cf0ee25eb5dbe75801e133718a9d34c'
            'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd')
build() {
    gendesk -q -f -n --categories "Network" --name "${_pkgname}" --exec "${pkgname%-bin}"
    # Fix incorrect permissions
    find "${srcdir}/${pkgname%-bin}" -type d              -print0 | xargs -r0 chmod 0755
    find "${srcdir}/${pkgname%-bin}" -type f -perm 0664   -print0 | xargs -r0 chmod 0644
    find "${srcdir}/${pkgname%-bin}" -type f -perm 0775   -print0 | xargs -r0 chmod 0755
    find "${srcdir}/${pkgname%-bin}" -type f -name '*.so' -print0 | xargs -r0 chmod 0755
    # Remove libraries provided by upstream
    rm -rf "${srcdir}/${pkgname%-bin}/Lib/"
    cp "${srcdir}/${pkgname%-bin}/Translations/${pkgname%-bin}_zh_CN_simple.qm" "${srcdir}/${pkgname%-bin}/Translations/${pkgname%-bin}_zh_CN.qm"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}" "${pkgdir}/opt"
    # Add a symlink to dooble.sh for those who prefer to not use a mouse
    ln -sr "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
# always end a file with a newline
