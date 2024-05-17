# Maintainer: Bart De Vries <bart at mogwai dot be>

# list of versions can be retrieved from https://dl.google.com/widevine-cdm/versions.txt
_x86_64_pkgver=4.10.2710.0

_lacros_url='https://commondatastorage.googleapis.com/chromeos-localmirror/distfiles/'
_lacros_img_aarch64=chromeos-lacros-arm64-squash-zstd
_lacros_img_armv7h=chromeos-lacros-arm-squash-zstd
_lacros_version=120.0.6098.0

pkgname=widevine
pkgdesc='A browser plugin designed for the viewing of premium video content.  System-wide installation with automated registering for chromium and firefox.'
pkgver=4.10.2710.0
pkgrel=7
arch=('x86_64' 'aarch64' 'armv7h')
url='https://www.widevine.com/'
license=('custom')
depends=('gcc-libs' 'glib2' 'nspr' 'nss' 'glibc>=2.39')
makedepends_aarch64=('python' 'squashfs-tools')
makedepends_armv7h=('python' 'squashfs-tools')
provides=('chromium-widevine')
conflicts=('chromium-widevine')
install="widevine.install"
options=('!strip')

source=("chrome-eula_text.html::https://www.google.com/intl/en/chrome/privacy/eula_text.html"
        "widevine.install")
source_x86_64=("https://dl.google.com/widevine-cdm/${_x86_64_pkgver}-linux-x64.zip")
source_aarch64=("lacros-arm64.squashfs::${_lacros_url}${_lacros_img_aarch64}-${_lacros_version}"
                "widevine_fixup.py")
source_armv7h=("lacros-arm.squashfs::${_lacros_url}${_lacros_img_armv7h}-${_lacros_version}"
               "widevine_fixup_32.py")

sha256sums=(SKIP
            '5ffda209f750c8ba31800b5e28c9d32f04c4b261eeec09784ff7045b694456f4')
sha256sums_x86_64=('c120e5d03ca6eb5243d4c69a6a4348e121233824ab26db9126a53ba99709d152')
sha256sums_aarch64=('38a57cc3975af68675a1219b00354f08890ff58d0c54b690dcf5d2dd904b1576'
                    '6e886755201f1ba9dab1ead5f11846bae321cbf343da1112f06c08c8a8012182')
sha256sums_armv7h=('c11d54ce5953c72cdb0a9b4c1e3a6442e872aaf90c80ca95f21d5182b1560363'
                   'c66c83a1d2a673f96de946b8dbfcf2c0a2d23db0a8931a7a5a89f6e4f45f24be')

prepare() {
  if [[ $CARCH == "aarch64" ]]; then
    unsquashfs -q lacros-arm64.squashfs 'WidevineCdm/*'
  fi

  if [[ $CARCH == "armv7h" ]]; then
    unsquashfs -q lacros-arm.squashfs 'WidevineCdm/*'
  fi

  if [[ $CARCH == "aarch64" || $CARCH == "armv7h" ]]; then
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
  fi

  # Create firefox preferences file 
  echo "// Set preferences related to widevine loading" > widevine.js
  echo "pref(\"media.gmp-widevinecdm.version\", \"${pkgver}\");" >> widevine.js
  echo "pref(\"media.gmp-widevinecdm.visible\", true);" >> widevine.js
  echo "pref(\"media.gmp-widevinecdm.enabled\", true);" >> widevine.js
  echo "pref(\"media.gmp-widevinecdm.autoupdate\", false);" >> widevine.js
  echo "pref(\"media.eme.enabled\", true);" >> widevine.js
  echo "pref(\"media.eme.encrypted-media-encryption-scheme.enabled\", true);" >> widevine.js

  # Create shell file to add widevine plugin to firefox system-wide plugins
  echo 'MOZ_GMP_PATH="$MOZ_GMP_PATH${MOZ_GMP_PATH:+:}/opt/WidevineCdm/firefox/gmp-widevinecdm/system-installed"' > firefox_widevine.sh
  echo "export MOZ_GMP_PATH" >> firefox_widevine.sh
}

build() {
  if [[ $CARCH == "aarch64" ]]; then
    # patch widevine lib to add missing functions and add support for non-4k systems
    python ../widevine_fixup.py squashfs-root/WidevineCdm/_platform_specific/cros_arm64/libwidevinecdm.so libwidevinecdm.so
  elif [[ $CARCH == "armv7h" ]]; then
    python ../widevine_fixup_32.py squashfs-root/WidevineCdm/_platform_specific/cros_arm/libwidevinecdm.so libwidevinecdm.so
  fi
}

package() {
  case $CARCH in
      x86_64)
          WIDEVINE_ARCH_NAME="x64"
          ;;
      aarch64)
          WIDEVINE_ARCH_NAME="arm64"
          ;;
      armv7h)
          WIDEVINE_ARCH_NAME="arm"
          ;;
  esac

  if [[ $CARCH == "aarch64" ||  $CARCH == "armv7h" ]]; then
    # These are general license files
    install -Dm644 ../chrome-eula_text.html "${pkgdir}/usr/share/licenses/${pkgname}/eula_text.html"
  elif [[ $CARCH == "x86_64" ]]; then
    install -Dm644 ./LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  fi

  # These are the files for the chromium metadata package
  install -d "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_${WIDEVINE_ARCH_NAME}"
  install -Dm755 libwidevinecdm.so -t "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_${WIDEVINE_ARCH_NAME}/"
  install -m644 manifest.json -t "${pkgdir}/opt/WidevineCdm/chromium/"
  # make link to have chromium recognize the lib
  install -d "${pkgdir}/usr/lib/chromium"
  ln -s "/opt/WidevineCdm/chromium" "${pkgdir}/usr/lib/chromium/WidevineCdm"

  if [[ $CARCH == "aarch64" ||  $CARCH == "armv7h" ]]; then
    # HACK because chromium will not find the arm(hf|64) lib without this
    install -d "${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_x64"
    touch ${pkgdir}/opt/WidevineCdm/chromium/_platform_specific/linux_x64/libwidevinecdm.so
  fi

  # These are the files for the firefox metadata package
  install -d "${pkgdir}/opt/WidevineCdm/firefox/gmp-widevinecdm/system-installed/"
  ln -s "../../../chromium/_platform_specific/linux_${WIDEVINE_ARCH_NAME}/libwidevinecdm.so" "${pkgdir}/opt/WidevineCdm/firefox/gmp-widevinecdm/system-installed/libwidevinecdm.so"
  ln -s "../../../chromium/manifest.json" "${pkgdir}/opt/WidevineCdm/firefox/gmp-widevinecdm/system-installed/manifest.json"
  install -Dm644 widevine.js -t "${pkgdir}/usr/lib/firefox/browser/defaults/preferences/"
  install -Dm644 firefox_widevine.sh -t "${pkgdir}/etc/profile.d/"
}
