# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=widevine-aarch64
pkgdesc='A browser plugin designed for the viewing of premium video content (version for aarch64)'
pkgver=4.10.2257.0
_debian_pkgname='libwidevinecdm0'
_debian_pkgver=4.10.2252.0
_debian_pkgrel=+1
pkgrel=1
arch=('aarch64')
url='https://www.widevine.com/'
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc-widevine' 'nspr' 'nss')
provides=('chromium-widevine')
conflicts=('chromium-widevine')
install="widevine-aarch64.install"
options=('!strip')
source=("chrome-eula_text.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html"
        "https://archive.raspberrypi.org/debian/pool/main/w/widevine/${_debian_pkgname}_${_debian_pkgver}${_debian_pkgrel}_arm64.deb"
        "register_widevine_chromium"
        "register_widevine_firefox"
        "widevine-aarch64.install"
        "ldadd_swp.c")

sha256sums=(SKIP
            'f11f2dabed4237b69d30c13083df5a867974bc91d888480cdf0d4cf5813583b7'
            'ebca260ca197c4eee5a8b76ae1fad2bf800ab99b40d8be0c2189b566bd9621d0'
            'b976bb594b8b51d5eee1929defaebd0313c54ddd6d62241bfa4a7d5421491e12'
            '2afd684d8818acfb7a1d5abfc928a5c7aeeebad2195a0a90a9824d592e894d65'
            'a86af0ab0d5350d70727e78e22fcc717ae1a0bf3d17167a9dd263bda00f6c198')

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
  gcc -Wall -c ../ldadd_swp.c
  ar rcs libgcc_hide.a ldadd_swp.o
  gcc -o libgcc_hide.so -shared -Wl,--whole-archive libgcc_hide.a -Wl,--no-whole-archive
}

package() {
  # These are general license files
  install -Dm644 ../chrome-eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"

  # These are the files for the chromium metadata package
  install -d "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_arm64"
  install -Dm755 opt/WidevineCdm/_platform_specific/linux_arm64/libwidevinecdm.so -t "${pkgdir}/opt/WidevineCdm/chromium/"
  install -m755 libgcc_hide.so -t "${pkgdir}/opt/WidevineCdm/"
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
