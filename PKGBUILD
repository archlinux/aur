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
noextract=("google-chrome-unstable-${_rpm_ver_i686}-${_rpm_rel_i686}.i386.rpm"
           "google-chrome-unstable-${_rpm_ver_x86_64}-${_rpm_rel_x86_64}.x86_64.rpm")

pkgver() {
  if [ "${CARCH}" = "i686" ]; then
  bsdtar -xf "google-chrome-unstable-${_rpm_ver_i686}-${_rpm_rel_i686}.i386.rpm" opt/google/chrome-unstable/{chrome,libwidevinecdm.so}
  elif [ "${CARCH}" = "x86_64" ]; then
  bsdtar -xf "google-chrome-unstable-${_rpm_ver_x86_64}-${_rpm_rel_x86_64}.x86_64.rpm" opt/google/chrome-unstable/{chrome,libwidevinecdm.so}
  fi
  echo "$(strings opt/google/chrome-unstable/chrome | sed -n '/ (version:/{n;p}')"
}

package() {
  install -Dm755 opt/google/chrome*/libwidevinecdm.so "${pkgdir}/usr/lib/chromium-dev/libwidevinecdm.so"

  install -Dm644 eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"
}
