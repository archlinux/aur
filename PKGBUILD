# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=1.4.9.1070
_chrome_ver=65.0.3325.181
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
options=('!strip')
source=('chrome-eula_text.html::https://www.google.com/intl/en/chrome/browser/privacy/eula_text.html'
        "https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb")
sha256sums=('e93c01576427cad9099f2cf0df0be70d0a2cc0a3a66c743318b2138aa7c4ed93'
            '2668878e7f9eff2a2ffbf2c4393b783e3d67da599b5ff94714ef1fa548e22464')

prepare() {
  bsdtar -x --strip-components 4 -f data.tar.xz opt/google/chrome/libwidevinecdm.so
}

pkgver() {
  awk 'match($0,/widevine.cdm.version\0Google\0ChromeCDM\0([0-9.]+)/,a) {print a[1];}' libwidevinecdm.so
}

package() {
  depends=('chromium' 'gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')

  install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/chromium/"
  install -Dm644 chrome-eula_text.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
