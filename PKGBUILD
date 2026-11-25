# Maintainer: gaou-piou <i.am.piou@gmail.com>

pkgbase=extension-adnauseam-dist
pkgname=('brave-extension-adnauseam-dist'
         'chromium-extension-adnauseam-dist'
         'edge-extension-adnauseam-dist'
         'opera-extension-adnauseam-dist'
         'firefox-extension-adnauseam-dist')
pkgver=3.29.4
pkgrel=1
pkgdesc='AdNauseam: ad blocker that also clicks every blocked ad, to obfuscate tracking (official release builds)'
arch=('any')
url='https://adnauseam.io'
license=('GPL-3.0-only')
# Chromium family: upstream's GitHub release builds, loaded unpacked.
# Firefox family: the same version from addons.mozilla.org, because that XPI is signed by
# Mozilla and so loads even where signature checks are on (LibreWolf, Firefox Nightly).
# The AMO file id changes with every version: update-release.sh bumps both together.
_amo_file=5248814
_rel="https://github.com/dhowe/AdNauseam/releases/download/v${pkgver}"
source=("adnauseam-${pkgver}.chromium.zip::${_rel}/adnauseam-${pkgver}.chromium.zip"
        "adnauseam-${pkgver}.edge.zip::${_rel}/adnauseam-${pkgver}.edge.zip"
        "adnauseam-${pkgver}.opera.crx::${_rel}/adnauseam-${pkgver}.opera.crx"
        "adnauseam-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_amo_file}/adnauseam-${pkgver}.xpi"
        "LICENSE-${pkgver}.txt::https://raw.githubusercontent.com/dhowe/AdNauseam/v${pkgver}/LICENSE.txt")
noextract=("adnauseam-${pkgver}.chromium.zip"
           "adnauseam-${pkgver}.edge.zip"
           "adnauseam-${pkgver}.opera.crx"
           "adnauseam-${pkgver}.xpi")
sha256sums=('03bf3529f133311d86edc03af6efb61f2d3393a529216d9cba756c5f3fcb50f6'
            'dbeae3650cf85b08ab56b7ce709ad9c4ea7f8533a4ce0219e5d15af205c5afe5'
            'a92b5ce7273ca5acdf982ed66e0a13fae34d97274249f4d06edaae82bb22cc98'
            'dfd9f2f5e81abf89907d5ddb5038fe5c0972bf24c520b5fd58d8109a50b18804'
            'e73d33841f942fa73aa5a63d4a6399cc39a29564db1dbca0915485842fcb236d')

_firefox_id='adnauseam@rednoise.org'

# Firefox family: one copy of the XPI per browser (plain copies: hard links across
# directories break when one of them is on another filesystem); a browser that is not
# installed just gets an unused directory. Where it goes depends on how the browser was built:
#  - Arch/CachyOS Firefox is built with --allow-addon-sideload, so it loads new add-ons
#    from <install dir>/browser/extensions (application scope) directly.
#  - Firefox Nightly (Mozilla binary), LibreWolf and Floorp are not
#    (AppConstants.MOZ_ALLOW_ADDON_SIDELOAD=false): they never pick up a new add-on from
#    browser/extensions. They do install <install dir>/distribution/extensions/*.xpi into
#    the profile at the next start, and on later browser updates replace it with a newer
#    version from there. Once installed it is a normal profile add-on.
# install directory under /usr/lib : extensions directory inside it
_firefox_browsers=(firefox:browser/extensions
                   librewolf:distribution/extensions
                   floorp:distribution/extensions
                   firefox-nightly:distribution/extensions)

# Chromium family: AdNauseam is a Manifest V2 extension, loaded via "Load unpacked". It
# only works in builds that still load MV2 extensions (not Google Chrome >= 139).
_package_unpacked() {
  local archive=$1 strip=$2
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  bsdtar -xf "${srcdir}/${archive}" -C "${pkgdir}/usr/share/${pkgname}" \
    --strip-components "${strip}" --no-same-owner
  # upstream's maintainer script for refreshing filter lists, not used by the extension
  rm -f "${pkgdir}/usr/share/${pkgname}/assets/update-git.sh"
  chmod -R u=rwX,go=rX "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_brave-extension-adnauseam-dist() {
  pkgdesc='AdNauseam browser extension for Brave (official release build, loaded unpacked)'
  optdepends=('brave: the browser this extension is for')
  provides=('brave-extension-adnauseam')
  conflicts=('brave-extension-adnauseam')
  install="${pkgname}.install"
  _package_unpacked "adnauseam-${pkgver}.chromium.zip" 1
}

package_chromium-extension-adnauseam-dist() {
  pkgdesc='AdNauseam browser extension for Chromium (official release build, loaded unpacked)'
  optdepends=('chromium: the browser this extension is for')
  provides=('chromium-extension-adnauseam')
  conflicts=('chromium-extension-adnauseam')
  install="${pkgname}.install"
  _package_unpacked "adnauseam-${pkgver}.chromium.zip" 1
}

package_edge-extension-adnauseam-dist() {
  pkgdesc='AdNauseam browser extension for Microsoft Edge (official release build, loaded unpacked)'
  optdepends=('microsoft-edge-stable-bin: the browser this extension is for')
  provides=('edge-extension-adnauseam')
  conflicts=('edge-extension-adnauseam')
  install="${pkgname}.install"
  _package_unpacked "adnauseam-${pkgver}.edge.zip" 0
}

package_opera-extension-adnauseam-dist() {
  pkgdesc='AdNauseam browser extension for Opera (official release build, loaded unpacked)'
  optdepends=('opera: the browser this extension is for')
  provides=('opera-extension-adnauseam')
  conflicts=('opera-extension-adnauseam')
  install="${pkgname}.install"
  _package_unpacked "adnauseam-${pkgver}.opera.crx" 0
}

package_firefox-extension-adnauseam-dist() {
  pkgdesc='AdNauseam browser extension for Firefox, LibreWolf, Floorp and Firefox Nightly (Mozilla-signed release)'
  groups=('firefox-addons')
  optdepends=('firefox: installed for the system Firefox'
              'librewolf: installed for LibreWolf'
              'floorp: installed for Floorp'
              'firefox-nightly: installed for Firefox Nightly')
  provides=('firefox-extension-adnauseam' 'librewolf-extension-adnauseam' 'floorp-extension-adnauseam')
  conflicts=('firefox-extension-adnauseam' 'firefox-extension-adnauseam-bin-amo'
             'librewolf-extension-adnauseam' 'floorp-extension-adnauseam')
  install="${pkgname}.install"
  local b
  for b in "${_firefox_browsers[@]}"; do
    install -Dm644 "${srcdir}/adnauseam-${pkgver}.xpi" \
      "${pkgdir}/usr/lib/${b%%:*}/${b#*:}/${_firefox_id}.xpi"
  done
  install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
