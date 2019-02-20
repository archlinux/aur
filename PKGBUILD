# Maintainer: Gustavo alvarez <sl1pkn07@gmail.com>
# Contributor: Ner0 (based on chromium-pepperflash-dev PKGBUILD)

pkgname=chromium-widevine-dev
pkgver=4.10.1303.0
pkgrel=1
pkgdesc="The Widevine Media Optimizer is a browser plugin designed for the viewing of premium video content (Only for chromium-dev)"
arch=('x86_64')
url='http://www.google.com/chrome'
license=('custom:chrome')
depends=('chromium-dev'
         'gcc-libs'
         )
options=('!strip')
source=('https://www.google.com/chrome/intl/en/eula_text.html'
        'get_cdm_version.c::https://aur.archlinux.org/cgit/aur.git/plain/get_cdm_version.c?h=chromium-widevine'
        )
sha256sums=('5d675e1125ede0bf4676ced3da2f7c90c641269f5b158bf003c9322bf0129d43'
            '3fda44a5b8b222434530f27923568de1fda1eb0caa8621b56a8b2a6a2a2e3d5d'
            )
_metadata="$(curl -sL "https://dl.google.com/linux/chrome/rpm/stable/x86_64/repodata/other.xml.gz" | gzip -df)"
_rpm_ver="$(echo "${_metadata}" | grep -m1 -A1 -e unstable | awk -v FS='ver="' -v RS='" ' '$0=$2')"
_rpm_rel="$(echo "${_metadata}" | grep -m1 -A1 -e unstable | awk -v FS='rel="' -v RS='"/' '$0=$2')"
_rpm_sha1sum="$(echo "${_metadata}" | grep -m1 -e unstable | awk -v FS='pkgid="' -v RS='" ' '$0=$2')"
source+=("http://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.x86_64.rpm")
sha256sums+=("${_rpm_sha1sum}")
noextract=("google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.x86_64.rpm")

pkgver() {
  ./get_cdm_version
}

prepare() {
  bsdtar -x --strip-components 4 -f "google-chrome-unstable-${_rpm_ver}-${_rpm_rel}.x86_64.rpm" opt/google/chrome-unstable/libwidevinecdm.so
  gcc get_cdm_version.c -o get_cdm_version -ldl
}

package() {
  install -Dm755 libwidevinecdm.so "${pkgdir}/usr/lib/chromium-dev/libwidevinecdm.so"
  install -Dm644 eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"
}
