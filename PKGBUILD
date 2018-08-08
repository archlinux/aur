# Maintainer: Doug Newgard <scimmia at archlinux dot org>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=4.10.1146.0
_chrome_ver=68.0.3440.106
pkgrel=2
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
options=('!strip')
source=('chrome-eula_text.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html'
        "https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb")
sha256sums=('8a0e9057c2a27bfcc74e210b848e6824e3c6c8f41232ca034362bcddfb95acbd'
            'b2dd6af541bf4f44b65d487f7b208ee5ae922c78800d6d21786098c055156534')

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
