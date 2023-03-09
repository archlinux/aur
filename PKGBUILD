# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=widevine-aarch64
pkgdesc='A browser plugin designed for the viewing of premium video content (version for aarch64)'
pkgver=4.10.2257.0
_debian_pkgname='libwidevinecdm0'
_debian_pkgver=4.10.2252.0
_debian_pkgrel=+1
pkgrel=2
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

sha256sums=('106863de0f826ec32c09386a2a6278e013c6019b996934bb0f385f1233b72b03'
            'f11f2dabed4237b69d30c13083df5a867974bc91d888480cdf0d4cf5813583b7'
            'ebca260ca197c4eee5a8b76ae1fad2bf800ab99b40d8be0c2189b566bd9621d0'
            'b976bb594b8b51d5eee1929defaebd0313c54ddd6d62241bfa4a7d5421491e12'
            '6be10c8786b24f47dbbb54ff676f28a7b49771b8d5f7c03cc3f2e73b7e18c22f'
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
  python ../widevine_fixup.py opt/WidevineCdm/_platform_specific/linux_arm64/libwidevinecdm.so libwidevinecdm.so
}

package() {
  # These are general license files
  install -Dm644 ../chrome-eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"

  # These are the files for the chromium metadata package
  install -d "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_arm64"
  install -Dm755 libwidevinecdm.so -t "${pkgdir}/opt/WidevineCdm/chromium/"
  install -m644 manifest.json -t "${pkgdir}/opt/WidevineCdm/chromium/"
  ln -s "../../libwidevinecdm.so" "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_arm64/libwidevinecdm.so"

  # These are the files for the firefox metadata package
  install -d "${pkgdir}/opt/WidevineCdm/firefox"
  ln -s "../chromium" "${pkgdir}/opt/WidevineCdm/firefox/${pkgver}"
  install -Dm644 widevine.js -t "${pkgdir}/usr/lib/firefox/browser/defaults/preferences/"

  # Registering scripts
  install -Dm755 ../register_widevine_firefox -t "${pkgdir}/usr/bin/"
  install -Dm755 ../register_widevine_chromium -t "${pkgdir}/usr/bin/"
}
