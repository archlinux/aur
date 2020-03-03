# Maintainer: Doug Newgard <scimmia at archlinux dot org>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=4.10.1610.0
_chrome_ver=80.0.3987.132
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
provides=("chromium-widevine-dev=$pkgver")
conflicts=('chromium-widevine-dev')
options=('!strip')
source=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb")
sha256sums=('681161c5f418c7fda572b1e0dc7df32983b94bc5cb5a7db31d7a92a33353b003')

prepare() {
  bsdtar -x --strip-components 4 -f data.tar.xz opt/google/chrome/WidevineCdm
}

pkgver() {
  awk 'match($0,/"version": "([0-9.]*)"/,a) {print a[1];}' WidevineCdm/manifest.json
}

package() {
  depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')

  install -dm755 "$pkgdir/usr/lib/"chromium{,-dev}/
  cp -a WidevineCdm "$pkgdir/usr/lib/chromium/"
  ln -s ../chromium/WidevineCdm "$pkgdir/usr/lib/chromium-dev/WidevineCdm"
  install -Dm644 WidevineCdm/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
# backward compatibility
  ln -s WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so "$pkgdir/usr/lib/chromium/libwidevinecdm.so"
}
