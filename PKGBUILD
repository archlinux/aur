# Maintainer: Bart De Vries <bart at mogwai dot be>

pkgname=widevine-armv7h
pkgdesc='A browser plugin designed for the viewing of premium video content (version for armv7h)'
pkgver=4.10.1679.0
pkgrel=1
#list od current images https://dl.google.com/dl/edgedl/chromeos/recovery/recovery.conf
_chromeos_ver=13099.110.0
_chromeos_file="chromeos_${_chromeos_ver}_jacuzzi_recovery_stable-channel_mp-v3.bin"
_rootfs_img="ROOT-A.img"
_libwidevine="libwidevinecdm.so"
arch=('armv7h')
url='https://www.widevine.com/'
license=('custom')
depends=('gcc-libs' 'glib2' 'glibc' 'nspr' 'nss')
provides=('chromium-widevine')
conflicts=('chromium-widevine' 'chromium-widevine-armv7h')
makedepends=('p7zip')
install="widevine-armv7h.install"
options=('!strip')
source=("chrome-eula_text.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html"
        "https://dl.google.com/dl/edgedl/chromeos/recovery/${_chromeos_file}.zip"
        "register_widevine_chromium"
        "register_widevine_firefox"
        "widevine-armv7h.install")
noextract=("${_chromeos_file}.zip")
sha256sums=(SKIP
            'cbec1708dd978b2353481d9ca8e022c287abfe53309d51532df2f17703a5450c'
            'ebca260ca197c4eee5a8b76ae1fad2bf800ab99b40d8be0c2189b566bd9621d0'
            'b976bb594b8b51d5eee1929defaebd0313c54ddd6d62241bfa4a7d5421491e12'
            '8790061f5a5b9eed63545a9caa0bb6452bec965313b40857657973f986b01794')

prepare() {
  # Retrieve the widevinecdm lib file from the chromeos image
  7z e ../${_chromeos_file}.zip -y
  7z e ${_chromeos_file} ${_rootfs_img} -y
  7z e ${_rootfs_img} ${_libwidevine} -r -y

  # Get major and minor version numbers from pkgver string
  _full_version="$(grep -Eaom1 '([0-9]+\.){3}[0-9]+' ${_libwidevine})"
  _major_version="$(echo ${_full_version} | cut -d. -f1)"
  _minor_version="$(echo ${_full_version} | cut -d. -f2)"

  # Construct necessary metadata file(s)
  echo "{" > manifest.json
  echo "   \"name\": \"WidevineCdm\"," >> manifest.json
  echo "   \"description\": \"Widevine Content Decryption Module\"," >> manifest.json
  echo "   \"version\": \"${_full_version}\"," >> manifest.json
  echo "   \"x-cdm-codecs\": \"vp8,vp9.0,avc1,av01\"," >> manifest.json
  echo "   \"x-cdm-host-versions\": \"${_minor_version}\"," >> manifest.json
  echo "   \"x-cdm-interface-versions\": \"${_minor_version}\"," >> manifest.json
  echo "   \"x-cdm-module-versions\": \"${_major_version}\"," >> manifest.json
  echo "   \"x-cdm-persistent-license-support\": true" >> manifest.json
  echo "}" >> manifest.json

  # Create firefox preferences file 
  echo "// Set preferences related to widevine loading" > widevine.js
  echo "pref(\"media.gmp-widevinecdm.version\", \"${_full_version}\");" >> widevine.js
  echo "pref(\"media.gmp-widevinecdm.visible\", true);" >> widevine.js
  echo "pref(\"media.gmp-widevinecdm.enabled\", true);" >> widevine.js
  echo "pref(\"media.gmp-widevinecdm.autoupdate\", false);" >> widevine.js
  echo "pref(\"media.eme.enabled\", true);" >> widevine.js
  echo "pref(\"media.eme.encrypted-media-encryption-scheme.enabled\", true);" >> widevine.js

}

pkgver() {
  echo $(grep -Eaom1 '([0-9]+\.){3}[0-9]+' ${_libwidevine})
}

package() {
  # These are general license files
  install -Dm644 ../chrome-eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  # These are the files for the chromium metadata package
  install -Dm755 ${_libwidevine} -t "${pkgdir}/opt/WidevineCdm/chromium/"
  install -Dm644 ../LICENSE -t "${pkgdir}/opt/WidevineCdm/chromium/"
  install -m644 manifest.json -t "${pkgdir}/opt/WidevineCdm/chromium/"
  install -d "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_arm"
  ln -s "../../${_libwidevine}" "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_arm/${_libwidevine}"

  # These are the files for the firefox metadata package
  install -d "${pkgdir}/opt/WidevineCdm/firefox"
  ln -s "../chromium" "${pkgdir}/opt/WidevineCdm/firefox/${pkgver}"
  install -Dm644 widevine.js -t "${pkgdir}/usr/lib/firefox/browser/defaults/preferences/"

  # Registering scripts
  install -Dm755 ../register_widevine_firefox -t "${pkgdir}/usr/bin/"
  install -Dm755 ../register_widevine_chromium -t "${pkgdir}/usr/bin/"
}
