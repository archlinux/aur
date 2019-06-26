# Maintainer: Doug Newgard <scimmia at archlinux dot org>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=4.10.1440.18
_chrome_ver=75.0.3770.100
_license_date=$(curl -sI https://www.google.com/intl/en/chrome/privacy/eula_text.html | sed -n '/^last-modified/ s/.*: //p' | date +"%Y%m%d" -f -)
_license_last=20190626
pkgrel=2
epoch=1
arch=('x86_64')
url='https://www.widevine.com/'
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')
provides=("chromium-widevine-dev=$pkgver")
conflicts=('chromium-widevine-dev')
options=('!strip')
source=("chrome-eula_text-$_license_date.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html"
        "https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${_chrome_ver}-1_amd64.deb"
        get_cdm_version.c)
sha256sums=('5d675e1125ede0bf4676ced3da2f7c90c641269f5b158bf003c9322bf0129d43'
            '25c558f79e5b0461ee63ca8e95bf26030a917d6b96dbdf3e6f6c75dc829eb746'
            '3fda44a5b8b222434530f27923568de1fda1eb0caa8621b56a8b2a6a2a2e3d5d')

prepare() {
  bsdtar -x --strip-components 4 -f data.tar.xz opt/google/chrome/libwidevinecdm.so
  gcc get_cdm_version.c -o get_cdm_version -ldl
}

pkgver() {
  ./get_cdm_version
}

package() {
  install -Dm644 libwidevinecdm.so -t "$pkgdir/usr/lib/chromium/"
  install -d "$pkgdir/usr/lib/chromium-dev/"
  ln -s ../chromium/libwidevinecdm.so "$pkgdir/usr/lib/chromium-dev/libwidevinecdm.so"
  install -Dm644 chrome-eula_text-$_license_date.html "$pkgdir/usr/share/licenses/$pkgname/eula_text.html"
}
