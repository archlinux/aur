# Maintainer: Sam Simons <mail@samsimons.nl>
_pkgname=marktext-tkaixiang
pkgname=${_pkgname}-bin
pkgver=0.18.2
pkgrel=1
pkgdesc="MarkText (modernized fork by Tkaixiang) – prebuilt binary"
arch=('x86_64')
url="https://github.com/Tkaixiang/marktext"
license=('MIT')
depends=(
  'glibc'        # libc.so.6, ld-linux-x86-64.so.2
  'gtk3'         # libgtk-3.so.0 + big GTK/GLib/Pango/Cairo stack
  'nss'          # libnss3.so, libnssutil3.so, libsmime3.so, libnspr4.so
  'alsa-lib'     # libasound.so.2 (audio)
  'libxss'       # libXss.so.1 (idle/notifications)
  'cups'         # libcups.so.2 (printing support — linked)
  'libxkbcommon' # libxkbcommon.so.0 (keyboard)
  'libxkbfile'    # libxkbfile.so 
  'mesa'         # libgbm.so.1 (GBM), pulls libdrm
  'hicolor-icon-theme' # icon cache integration
)

provides=('marktext')
conflicts=('marktext')
options=('!strip')
source_x86_64=("${url}/releases/download/v${pkgver}/marktext-linux-${pkgver}.tar.gz")
source=("marktext.desktop"
        "${url}/raw/trunk/static/logo-small.png")
sha256sums=('7f5f4c62523895081883fc4ba2c14790620d88178d6c97d52e9cf0850ea6620e'
            '53e9fb3cfe5efb2ca0e77ad7dcbf56835373ae797d36a87479f207ed8a8d90d4')
sha256sums_x86_64=('a8ac4870909bb10d5552bd9c5a773ae8329ef9a2e625f39c76c967fc6ceba4a2')

package() {
  install -dm755 "${pkgdir}/usr/lib/marktext" \
                 "${pkgdir}/usr/bin" \
                 "${pkgdir}/usr/share/applications" \
                 "${pkgdir}/usr/share/icons/hicolor/256x256/apps" \
                 "${pkgdir}/usr/share/licenses/${pkgname}"

  bsdtar -xf "${srcdir}/marktext-linux-${pkgver}.tar.gz" \
         -C "${pkgdir}/usr/lib/marktext" --strip-components 1

  ln -s /usr/lib/marktext/marktext "${pkgdir}/usr/bin/marktext"

  install -m644 "${srcdir}/marktext.desktop" \
          "${pkgdir}/usr/share/applications/marktext.desktop"
  install -m644 "${srcdir}/logo-small.png" \
          "${pkgdir}/usr/share/icons/hicolor/256x256/apps/marktext.png"

  install -m644 "${pkgdir}/usr/lib/marktext/LICENSE"* \
          "${pkgdir}/usr/share/licenses/${pkgname}/" 2>/dev/null || true
}
