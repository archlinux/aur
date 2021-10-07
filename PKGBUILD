# Maintainer: Doug Newgard <scimmia at archlinux dot org>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=4.10.2209.0
_chrome_ver=94.0.4606.81
pkgrel=2
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
options=('!strip')
source=("https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb")
sha256sums=('bfe97cd8d9f941e4a1e73f53d9de6bb54e73a007ee4ce5d4e94a9a65ae2d7fb4')

prepare() {
  bsdtar -x --strip-components 4 -f data.tar.xz opt/google/chrome/WidevineCdm
}

pkgver() {
  awk 'match($0,/"version": "([0-9.]*)"/,a) {print a[1];}' WidevineCdm/manifest.json
}

package() {
  depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')

  install -dm755 "$pkgdir/usr/lib/chromium/"
  cp -a WidevineCdm "$pkgdir/usr/lib/chromium/"
  find "$pkgdir" -name '*.so' -exec chmod +x {} \;
  install -Dm644 WidevineCdm/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
# backward compatibility
  ln -s WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so "$pkgdir/usr/lib/chromium/libwidevinecdm.so"
}
