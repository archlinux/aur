# Maintainer: Doug Newgard <scimmia at archlinux dot org>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=4.10.1610.0
_chrome_ver=81.0.4044.129
pkgrel=1
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
provides=("chromium-widevine-dev=$pkgver")
conflicts=('chromium-widevine-dev')
options=('!strip')
source=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb")
sha256sums=('fe140112304b243240a5f6b287105fd5b7d6e48c6ff682194a62c8d08fd0ed5b')

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
