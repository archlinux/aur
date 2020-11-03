# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=widevine-armv7h
pkgdesc='A browser plugin designed for the viewing of premium video content (version for armv7h)'
pkgver=4.10.1679.0
_debian_pkgname='libwidevinecdm0'
_debian_pkgrel=1
pkgrel=2
arch=('armv7h')
url='https://www.widevine.com/'
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')
provides=('chromium-widevine')
conflicts=('chromium-widevine' 'chromium-widevine-armv7h')
install="widevine-armv7h.install"
options=('!strip')
source=("chrome-eula_text.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html"
        "https://archive.raspberrypi.org/debian/pool/main/w/widevine/${_debian_pkgname}_${pkgver}-${_debian_pkgrel}_armhf.deb"
        "register_widevine_chromium"
        "register_widevine_firefox"
        "widevine-armv7h.install")
sha256sums=(SKIP
            '7e2240774620a5ec4a722567439fd5d8b54acc35dfe9e3766d8de9e231bbbf0a'
            'ebca260ca197c4eee5a8b76ae1fad2bf800ab99b40d8be0c2189b566bd9621d0'
            'b976bb594b8b51d5eee1929defaebd0313c54ddd6d62241bfa4a7d5421491e12'
            '8790061f5a5b9eed63545a9caa0bb6452bec965313b40857657973f986b01794')

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

package() {
  # These are general license files
  install -Dm644 ../chrome-eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"

  # These are the files for the chromium metadata package
  install -d "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_arm"
  install -Dm755 opt/WidevineCdm/_platform_specific/linux_arm/libwidevinecdm.so -t "${pkgdir}/opt/WidevineCdm/chromium/"
  install -m644 manifest.json -t "${pkgdir}/opt/WidevineCdm/chromium/"
  ln -s "../../libwidevinecdm.so" "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_arm/libwidevinecdm.so"

  # These are the files for the firefox metadata package
  install -d "${pkgdir}/opt/WidevineCdm/firefox"
  ln -s "../chromium" "${pkgdir}/opt/WidevineCdm/firefox/${pkgver}"
  install -Dm644 widevine.js -t "${pkgdir}/usr/lib/firefox/browser/defaults/preferences/"

  # Registering scripts
  install -Dm755 ../register_widevine_firefox -t "${pkgdir}/usr/bin/"
  install -Dm755 ../register_widevine_chromium -t "${pkgdir}/usr/bin/"
}
