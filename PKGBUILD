# Maintainer: Doug Newgard <scimmia at archlinux dot org>

pkgname=chromium-widevine
pkgdesc='A browser plugin designed for the viewing of premium video content'
pkgver=4.10.1440.18
_chrome_ver=75.0.3770.80
_license_date=$(curl -sI https://www.google.com/intl/en/chrome/privacy/eula_text.html | sed -n '/^last-modified/ s/.*: //p' | date +"%Y%m%d" -f -)
_license_last=20190307
pkgrel=1
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
sha256sums=('e1e2a694ffe71476b2aefbca64fe470095210c2eb2235c645ca73160cc0b21ea'
            '5cf83f72c2c75f0babf508d6a85879335e9ee55f1445cbdae395094197f84f0d'
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
