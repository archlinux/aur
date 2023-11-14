# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: Bart De Vries <bart at mogwai dot be>

pkgname=widevine-aarch64
pkgdesc='A browser plugin designed for the viewing of premium video content (version for aarch64)'
pkgver=4.10.2257.0
_debian_pkgname='libwidevinecdm0'
_debian_pkgver=4.10.2252.0
_debian_pkgrel=+3
pkgrel=6
arch=('aarch64')
url='https://www.widevine.com/'
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc-widevine' 'nspr' 'nss')
makedepends=('python')
provides=('chromium-widevine')
conflicts=('chromium-widevine')
install="widevine-aarch64.install"
options=('!strip')
source=("chrome-eula_text.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html"
        "https://archive.raspberrypi.org/debian/pool/main/w/widevine/${_debian_pkgname}_${_debian_pkgver}${_debian_pkgrel}_arm64.deb"
        "register_widevine_chromium"
        "register_widevine_firefox"
        "widevine-aarch64.install"
        "widevine_fixup.py")

sha256sums=(SKIP
            'c88bbb210ca94cb4b5c3bb1ff11b5b24f146b76b22b1119b9cac37c421574284'
            'ebca260ca197c4eee5a8b76ae1fad2bf800ab99b40d8be0c2189b566bd9621d0'
            'a806dc002b8072651902f77c47cba09b9d0c0dd50e196651e235255f6e0a2cbc'
            '5991822a0c6bf24b33eb65e6ecad1ced6df4975c2ea03df71acb2795293f7a6c'
            '2504018f9128ed2b7ebe00d332383a78fb7e2bc76ad58a3f88c2159234cf86cf')

prepare() {
  # Extract data.tar.gz from deb package
  tar -xf data.tar.xz

  # Get major and minor version numbers from pkgver string
  _major_version="$(echo ${pkgver} | cut -d. -f1)"
  _minor_version="$(echo ${pkgver} | cut -d. -f2)"

  # Construct necessary metadata file(s)
  echo "{" > manifest.json
  echo "   \"name\": \"WidevineCdm\"," >> manifest.json
  echo "   \"description\": \"Widevine Content Decryption Module\"," >> manifest.json
  echo "   \"version\": \"${pkgver}\"," >> manifest.json
  echo "   \"x-cdm-codecs\": \"vp8,vp9.0,avc1,av01\"," >> manifest.json
  echo "   \"x-cdm-host-versions\": \"${_minor_version}\"," >> manifest.json
  echo "   \"x-cdm-interface-versions\": \"${_minor_version}\"," >> manifest.json
  echo "   \"x-cdm-module-versions\": \"${_major_version}\"," >> manifest.json
  echo "   \"x-cdm-persistent-license-support\": true" >> manifest.json
  echo "}" >> manifest.json

  # Create firefox preferences file 
  echo "// Set preferences related to widevine loading" > widevine.js
  echo "pref(\"media.gmp-widevinecdm.version\", \"${pkgver}\");" >> widevine.js
  echo "pref(\"media.gmp-widevinecdm.visible\", true);" >> widevine.js
  echo "pref(\"media.gmp-widevinecdm.enabled\", true);" >> widevine.js
  echo "pref(\"media.gmp-widevinecdm.autoupdate\", false);" >> widevine.js
  echo "pref(\"media.eme.enabled\", true);" >> widevine.js
  echo "pref(\"media.eme.encrypted-media-encryption-scheme.enabled\", true);" >> widevine.js
}

build() {
  # patch widevine lib to add missing functions and add support for non-4k systems
  python ../widevine_fixup.py opt/WidevineCdm/_platform_specific/linux_arm64/libwidevinecdm_real.so libwidevinecdm.so
}

package() {
  # These are general license files
  install -Dm644 ../chrome-eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"

  # These are the files for the chromium metadata package
  install -d "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_arm64"
  install -Dm755 libwidevinecdm.so -t "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_arm64/"
  install -m644 manifest.json -t "${pkgdir}/opt/WidevineCdm/chromium/"

  # These are the files for the firefox metadata package
  install -d "${pkgdir}/opt/WidevineCdm/firefox/gmp-widevinecdm/${pkgver}/"
  ln -s "../../../chromium/_platform_specific/linux_arm64/libwidevinecdm.so" "${pkgdir}/opt/WidevineCdm/firefox/gmp-widevinecdm/${pkgver}/libwidevinecdm.so"
  ln -s "../../../chromium/manifest.json" "${pkgdir}/opt/WidevineCdm/firefox/gmp-widevinecdm/${pkgver}/manifest.json"
  install -Dm644 widevine.js -t "${pkgdir}/usr/lib/firefox/browser/defaults/preferences/"

  # Registering scripts
  install -Dm755 ../register_widevine_firefox -t "${pkgdir}/usr/bin/"
  install -Dm755 ../register_widevine_chromium -t "${pkgdir}/usr/bin/"
}
