# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: zhangkaizhao <zhangkaizhao at gmail dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus at seistrup dot dk>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>

pkgname="dooble-bin"
pkgver=2023.07.15
pkgrel=5
pkgdesc="Web browser based on QtWebEngine"
arch=(x86_64)
url="https://textbrowser.github.io/dooble/"
_githuburl="https://github.com/textbrowser/${pkgname%-bin}"
license=('custom')
depends=(
  #'alsa-lib'
  'at-spi2-core'
  'bash'
  'bzip2'
  'cairo'
  #'dbus'
  #'expat'
  #'fontconfig'
  'freetype2'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gpgme'
  'gst-plugins-base-libs'
  'gstreamer'
  'gtk3'
  #'krb5'
  #'libassuan'
  'libcups'
  'libdrm'
  'libglvnd'
  #'libgpg-error'
  'libx11'
  'libxcb'
  #'libxcomposite'
  #'libxdamage'
  'libxext'
  #'libxfixes'
  #'libxi'
  'libxkbcommon'
  'libxkbcommon-x11'
  #'libxkbfile'
  'libxrandr'
  #'libxrender'
  #'libxshmfence'
  #'libxtst'
  #'nspr'
  #'nss'
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
  #'sqlite'
  'unixodbc'
  'wayland'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'zlib'
)
makedepends=(
  'findutils'
  'gendesk'
)
conflicts=("${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
source=(
  "${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/${pkgver}/Dooble-${pkgver}.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/textbrowser/dooble/master/LICENSE"
)
sha256sums=(
  'b02e95a85082bcc4c12fce1e547ebfacfe24c70a5e98140a15c570030023ecba'
  'c60bf2d6a8bfdf7c7418bba91c6767cbb4b48dccae36dd5d9ffdb48f756815dd'
)
package() {
  install -Dm755 -d "${pkgdir}/opt"
  bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${pkgdir}/opt" --gname root --uname root
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
  gendesk -f -n --icon "${pkgname%-bin}" --categories "Network" --name "Dooble" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}.sh"
  install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  # Fix incorrect permissions
  find "${pkgdir}" -type d              -print0 | xargs -r0 chmod 0755
  find "${pkgdir}" -type f -perm 0664   -print0 | xargs -r0 chmod 0644
  find "${pkgdir}" -type f -perm 0775   -print0 | xargs -r0 chmod 0755
  find "${pkgdir}" -type f -name '*.so' -print0 | xargs -r0 chmod 0755
  # Add a symlink to dooble.sh for those who prefer to not use a mouse
  install -dm0755 "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
  # Remove libraries provided by upstream
  rm -rf "${pkgdir}/opt/${pkgname%-bin}/Lib/"
}

# eof
