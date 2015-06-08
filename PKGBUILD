# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>
# Contributor: Ner0 (based on chromium-pepperflash-dev PKGBUILD)

pkgname=chromium-widevine-dev
pkgver=1.4.8.824
pkgrel=1
pkgdesc="The Widevine Media Optimizer is a browser plugin designed for the viewing of premium video content (only for chromium-dev)"
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
depends=('gcc-libs')
options=('!strip')

[ "${CARCH}" = "i686" ] && _rpm_arch="i386"
[ "${CARCH}" = "x86_64" ] && _rpm_arch="x86_64"

source=('https://www.google.com/chrome/intl/en/eula_text.html')
sha1sums=('1ffba5152cb749300a016efec909b828eba9a64a')
_metadata="$(curl -sL "https://dl.google.com/linux/chrome/rpm/stable/${_rpm_arch}/repodata/other.xml.gz" | gzip -df)"
_rpm_ver="$(echo "${_metadata}" | grep -e unstable | awk -v FS='ver="' -v RS='" ' '$0=$2'  | head -n 1)"
_rpm_rel="$(echo "${_metadata}" | grep -e unstable | awk -v FS='rel="' -v RS='"/' '$0=$2' | head -n 1)"
_rpm_sha1sum="$(echo "${_metadata}" | grep -e unstable | awk -v FS='pkgid="' -v RS='" ' '$0=$2' | head -n 1)"
source+=("http://dl.google.com/linux/chrome/rpm/stable/${_rpm_arch}/google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.${_rpm_arch}.rpm")
sha1sums+=("${_rpm_sha1sum}")
noextract=("google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.${_rpm_arch}.rpm")

pkgver() {
  bsdtar -xf "google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.${_rpm_arch}.rpm" opt/google/chrome-unstable/{chrome,libwidevinecdm.so}
  echo "$(strings opt/google/chrome-unstable/chrome | sed -n '/ (version:/{n;p}')"
}

package() {
  install -Dm755 opt/google/chrome*/libwidevinecdm.so "${pkgdir}/usr/lib/chromium-dev/libwidevinecdm.so"

  install -Dm644 eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"
}
