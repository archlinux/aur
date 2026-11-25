# Maintainer: gaou-piou <c.ballios@paperman.ai>
# Based on extension-bitwarden-git (David Hummel) and firefox-extension-bitwarden (Matt Harrison)

pkgbase=extension-bitwarden-dist
pkgname=('brave-extension-bitwarden-dist'
         'chrome-extension-bitwarden-dist'
         'chromium-extension-bitwarden-dist'
         'edge-extension-bitwarden-dist'
         'firefox-extension-bitwarden-dist'
         'opera-extension-bitwarden-dist')
pkgver=2026.11.0
pkgrel=2
pkgdesc='Bitwarden browser extensions (official release dist builds)'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL-3.0-or-later')
# bsdtar (libarchive) is part of base and unpacks the zips
# Upstream prefixes releases with the license variant: this package tracks the
# open-source (GPL) build, which is "oss-" since 2026.11.0 and was unprefixed before.
_dist='oss-'
_rel="${url}/releases/download/browser-v${pkgver}"
source=("${_dist}dist-chrome-${pkgver}.zip::${_rel}/${_dist}dist-chrome-${pkgver}.zip"
        "${_dist}dist-edge-${pkgver}.zip::${_rel}/${_dist}dist-edge-${pkgver}.zip"
        "${_dist}dist-firefox-${pkgver}.zip::${_rel}/${_dist}dist-firefox-${pkgver}.zip"
        "${_dist}dist-opera-${pkgver}.zip::${_rel}/${_dist}dist-opera-${pkgver}.zip"
        "LICENSE_GPL-${pkgver}.txt::https://raw.githubusercontent.com/bitwarden/clients/browser-v${pkgver}/LICENSE_GPL.txt")
noextract=("${_dist}dist-chrome-${pkgver}.zip"
           "${_dist}dist-edge-${pkgver}.zip"
           "${_dist}dist-firefox-${pkgver}.zip"
           "${_dist}dist-opera-${pkgver}.zip")
sha256sums=('407b741949bc8ba3ba2af425c6a3ef124454c7bd72eb0a1db0679dc3c2fd7713'
            'e23d0525ba0f32ec3266d9c01473f031a055c1eb9e8f956580b2ee7a7fb654e1'
            'c31bcd736a588586916655cfce28c4e44c3ae3bc4afe8ff9cf49b386dd37b4d8'
            '5afe12218a1d0dd783819b298d8706dc54b3c2777e77e60dba933b088c2fea70'
            'b98fbb37db5b23bc5cfdcd16793206a5a7120a7b01f75374e5e0888376e4691c')

_firefox_id='{446900e4-71c2-419f-a6a7-df9c091e268b}'

# Unpacked Chromium-family extension: loaded manually via "Load unpacked".
_package_unpacked() {
  local _browser=$1
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  bsdtar -xf "${srcdir}/${_dist}dist-${_browser}-${pkgver}.zip" -C "${pkgdir}/usr/share/${pkgname}" --no-same-owner
  chmod -R u=rwX,go=rX "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 "${srcdir}/LICENSE_GPL-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_GPL.txt"
}

# Firefox family: the zip is the xpi. One copy per browser (plain copies: hard links across
# directories break when one of them is on another filesystem); a browser that is not
# installed just gets an unused directory. Where it goes depends on how the browser was built:
#  - Arch/CachyOS Firefox is built with --allow-addon-sideload, so it loads new add-ons
#    from <install dir>/browser/extensions (application scope) directly.
#  - Firefox Nightly (Mozilla binary), LibreWolf and Floorp are not
#    (AppConstants.MOZ_ALLOW_ADDON_SIDELOAD=false): they never pick up a new add-on from
#    browser/extensions. They do install <install dir>/distribution/extensions/*.xpi into
#    the profile at the next start, and on later browser updates replace it with a newer
#    version from there. Once installed it is a normal profile add-on.
# The dist build is NOT signed by Mozilla: Arch/CachyOS Firefox accepts unsigned add-ons in
# the application scope, Floorp defaults to xpinstall.signatures.required=false, LibreWolf
# and Firefox Nightly need it set to false (otherwise the add-on is removed as "not
# correctly signed").
# install directory under /usr/lib : extensions directory inside it
_firefox_browsers=(firefox:browser/extensions
                   librewolf:distribution/extensions
                   floorp:distribution/extensions
                   firefox-nightly:distribution/extensions)

package_brave-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Brave (official dist build)'
  optdepends=('brave: the browser this extension is for')
  provides=('brave-extension-bitwarden')
  conflicts=('brave-extension-bitwarden' 'brave-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked chrome
}

package_chrome-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Google Chrome (official dist build)'
  optdepends=('google-chrome: the browser this extension is for')
  provides=('chrome-extension-bitwarden')
  conflicts=('chrome-extension-bitwarden' 'chrome-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked chrome
}

package_chromium-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Chromium (official dist build)'
  optdepends=('chromium: the browser this extension is for')
  provides=('chromium-extension-bitwarden')
  conflicts=('chromium-extension-bitwarden' 'chromium-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked chrome
}

package_edge-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Microsoft Edge (official dist build)'
  optdepends=('microsoft-edge-stable-bin: the browser this extension is for')
  provides=('edge-extension-bitwarden')
  conflicts=('edge-extension-bitwarden' 'edge-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked edge
}

package_firefox-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Firefox, LibreWolf, Floorp and Firefox Nightly (official dist build)'
  groups=('firefox-addons')
  optdepends=('firefox: installed for the system Firefox'
              'librewolf: installed for LibreWolf (needs unsigned add-ons allowed)'
              'floorp: installed for Floorp'
              'firefox-nightly: installed for Firefox Nightly (needs unsigned add-ons allowed)')
  provides=('firefox-extension-bitwarden' 'librewolf-extension-bitwarden' 'floorp-extension-bitwarden')
  conflicts=('firefox-extension-bitwarden' 'firefox-extension-bitwarden-git'
             'librewolf-extension-bitwarden' 'librewolf-extension-bitwarden-git'
             'librewolf-extension-bitwarden-dist'
             'floorp-extension-bitwarden')
  replaces=('librewolf-extension-bitwarden-dist')
  install="${pkgname}.install"
  local b
  for b in "${_firefox_browsers[@]}"; do
    install -Dm644 "${srcdir}/${_dist}dist-firefox-${pkgver}.zip" \
      "${pkgdir}/usr/lib/${b%%:*}/${b#*:}/${_firefox_id}.xpi"
  done
  install -Dm644 "${srcdir}/LICENSE_GPL-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_GPL.txt"
}

package_opera-extension-bitwarden-dist() {
  pkgdesc='Bitwarden browser extension for Opera (official dist build)'
  optdepends=('opera: the browser this extension is for')
  provides=('opera-extension-bitwarden')
  conflicts=('opera-extension-bitwarden' 'opera-extension-bitwarden-git')
  install="${pkgname}.install"
  _package_unpacked opera
}
