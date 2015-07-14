# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Ner0

pkgname=chromium-pepper-flash-dev
pkgver=18.0.0.205
pkgrel=1
pkgdesc="Google Chrome's Pepper Flash plugin for Chromium (Dev Channel)"
arch=('i686' 'x86_64')
url="http://www.google.com/chrome"
license=('custom:chrome')
optdepends=('pulseaudio-alsa: For PulseAudio users')
conflicts=('chromium-pepper-flash' 'chromium-pepper-flash-stable')
provides=('chromium-pepper-flash')
options=('!emptydirs' '!strip')
source=('https://www.google.com/chrome/intl/en/eula_text.html')
sha1sums=('1ffba5152cb749300a016efec909b828eba9a64a')
#-i686
_metadata_i686="$(curl -sL "https://dl.google.com/linux/chrome/rpm/stable/i386/repodata/other.xml.gz" | gzip -df)"
_rpm_ver_i686="$(echo "${_metadata_i686}" | grep -m1 -e unstable | awk -v FS='ver="' -v RS='" ' '$0=$2')"
_rpm_rel_i686="$(echo "${_metadata_i686}" | grep -m1 -e unstable | awk -v FS='rel="' -v RS='"/' '$0=$2')"
_rpm_sha1sum_i686="$(echo "${_metadata_i686}" | grep -m1 -e unstable | awk -v FS='pkgid="' -v RS='" ' '$0=$2')"
source_i686=("http://dl.google.com/linux/chrome/rpm/stable/i386/google-chrome-unstable-${_rpm_ver_i686}-${_rpm_rel_i686}.i386.rpm")
sha1sums_i686=("${_rpm_sha1sum_i686}")
#-x86_64
_metadata_x86_64="$(curl -sL "https://dl.google.com/linux/chrome/rpm/stable/x86_64/repodata/other.xml.gz" | gzip -df)"
_rpm_ver_x86_64="$(echo "${_metadata_x86_64}" | grep -m1 -e unstable | awk -v FS='ver="' -v RS='" ' '$0=$2')"
_rpm_rel_x86_64="$(echo "${_metadata_x86_64}" | grep -m1 -e unstable | awk -v FS='rel="' -v RS='"/' '$0=$2')"
_rpm_sha1sum_x86_64="$(echo "${_metadata_x86_64}" | grep -m1 -e unstable | awk -v FS='pkgid="' -v RS='" ' '$0=$2')"
source_x86_64=("http://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-unstable-${_rpm_ver_x86_64}-${_rpm_rel_x86_64}.x86_64.rpm")
sha1sums_x86_64=("${_rpm_sha1sum_x86_64}")
install=chromium-pepper-flash-dev.install
noextract=("google-chrome-unstable-${_rpm_ver_i686}-${_rpm_rel_i686}.i386.rpm"
           "google-chrome-unstable-${_rpm_ver_x86_64}-${_rpm_rel_x86_64}.x86_64.rpm")

pkgver() {
  if [ "${CARCH}" = "i686" ]; then
  bsdtar -xf "google-chrome-unstable-${_rpm_ver_i686}-${_rpm_rel_i686}.i386.rpm" opt/google/chrome*/PepperFlash
  elif [ "${CARCH}" = "x86_64" ]; then
  bsdtar -xf "google-chrome-unstable-${_rpm_ver_x86_64}-${_rpm_rel_x86_64}.x86_64.rpm" opt/google/chrome*/PepperFlash
  fi
  echo "$(cat opt/google/chrome-unstable/PepperFlash/manifest.json | grep version | cut -d '"' -f4)"
}

package() {
  install -Dm644 opt/google/chrome-unstable/PepperFlash/manifest.json "${pkgdir}/usr/lib/PepperFlash/manifest.json"
  install -Dm755 opt/google/chrome-unstable/PepperFlash/libpepflashplayer.so "${pkgdir}/usr/lib/PepperFlash/libpepflashplayer.so"

  install -Dm644 eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"
}
