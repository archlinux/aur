# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>
# Contributor: Ner0 (based on chromium-pepperflash-dev PKGBUILD)

pkgname=chromium-widevine-dev
pkgver=4.10.1188.0
pkgrel=1
pkgdesc="The Widevine Media Optimizer is a browser plugin designed for the viewing of premium video content (Only for chromium-dev)"
arch=('x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
depends=('chromium-dev'
         'gcc-libs'
         )
options=('!strip')
source=('https://www.google.com/chrome/intl/en/eula_text.html')
sha1sums=('9deae92612b49634c02c6e6b3f5f02086e2cf19f')
_metadata="$(curl -sL "https://dl.google.com/linux/chrome/rpm/stable/x86_64/repodata/other.xml.gz" | gzip -df)"
_rpm_ver="$(echo "${_metadata}" | grep -m1 -e unstable | awk -v FS='ver="' -v RS='" ' '$0=$2')"
_rpm_rel="$(echo "${_metadata}" | grep -m1 -e unstable | awk -v FS='rel="' -v RS='"/' '$0=$2')"
_rpm_sha1sum="$(echo "${_metadata}" | grep -m1 -e unstable | awk -v FS='pkgid="' -v RS='" ' '$0=$2')"
source+=("http://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.x86_64.rpm")
sha1sums+=("${_rpm_sha1sum}")
noextract=("google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.x86_64.rpm")

pkgver() {
  awk 'match($0,/widevine.cdm.version\0Google\0ChromeCDM\0([0-9.]+)/,a) {print a[1];}' libwidevinecdm.so
}

prepare() {
  bsdtar -x --strip-components 4 -f "google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.x86_64.rpm" opt/google/chrome-unstable/libwidevinecdm.so
}

package() {
  install -Dm755 libwidevinecdm.so "${pkgdir}/usr/lib/chromium-dev/libwidevinecdm.so"
  install -Dm644 eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"
}
