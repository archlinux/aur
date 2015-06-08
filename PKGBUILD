# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Ner0

pkgname=chromium-pepper-flash-dev
pkgver=18.0.0.160
pkgrel=1
pkgdesc="Google Chrome's Pepper Flash plugin for Chromium (Dev Channel)"
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
optdepends=('pulseaudio-alsa: For PulseAudio users')
conflicts=('chromium-pepper-flash' 'chromium-pepper-flash-stable')
provides=('chromium-pepper-flash')
options=('!emptydirs' '!strip')
install=chromium-pepper-flash-dev.install

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
  bsdtar -xf "google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.${_rpm_arch}.rpm" opt/google/chrome*/PepperFlash
  echo "$(cat opt/google/chrome-unstable/PepperFlash/manifest.json | grep version | cut -d '"' -f4)"
}

package() {
  install -Dm644 opt/google/chrome-unstable/PepperFlash/manifest.json "${pkgdir}/usr/lib/PepperFlash/manifest.json"
  install -Dm755 opt/google/chrome-unstable/PepperFlash/libpepflashplayer.so "${pkgdir}/usr/lib/PepperFlash/libpepflashplayer.so"

  install -Dm644 eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"
}
