# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgbase=extension-bitwarden-git
pkgname=(
  'brave-extension-bitwarden-git'
  'chrome-extension-bitwarden-git'
  'chromium-extension-bitwarden-git'
  'firefox-developer-edition-extension-bitwarden-git'
  'firefox-extension-bitwarden-git'
  'librewolf-extension-bitwarden-git'
  'opera-extension-bitwarden-git'
)
pkgver=2026.11.0.r23994.g5912919
pkgrel=1
pkgdesc='Bitwarden browser extensions'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL-3.0-or-later')
makedepends=(
  'git'
  'nodejs'
  'npm'
  'zip'
)
source=("${pkgbase}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  local _version
  _version=$(
    git -C "${pkgbase}" tag --sort=committerdate --list 'browser-*' \
      | tail --lines=1 \
      | cut --delimiter='-' --fields=2 \
      | cut --delimiter='v' --fields=2
  )
  printf '%s.r%s.g%s' \
    "${_version}" \
    "$(git -C "${pkgbase}" rev-list --count HEAD)" \
    "$(git -C "${pkgbase}" rev-parse --short=7 HEAD)"
}

prepare() {
  npm --prefix "${srcdir}/${pkgbase}" \
    --cache "${srcdir}/npm-cache" \
    ci
}

build() {
  export NODE_OPTIONS="${NODE_OPTIONS:-} --max-old-space-size=8192"

  rm --recursive --force "${srcdir}/${pkgbase}/apps/browser/dist"

  for target in chrome firefox opera; do
    npm --prefix "${srcdir}/${pkgbase}" \
      --cache "${srcdir}/npm-cache" \
      --prefer-offline \
      --workspace=apps/browser \
      run "dist:${target}"
  done
}

check() {
  export NODE_OPTIONS="${NODE_OPTIONS:-} --max-old-space-size=4096"

  npm --prefix "${srcdir}/${pkgbase}" \
    --cache "${srcdir}/npm-cache" \
    --prefer-offline \
    --workspace=apps/browser \
    run test
}

package_brave-extension-bitwarden-git() {
  pkgdesc='Bitwarden browser extension for Brave'
  optdepends=('brave: Web browser to use the extension with')
  provides=('brave-extension-bitwarden')
  conflicts=('brave-extension-bitwarden')
  install="${pkgname}.install"

  install --directory --mode=755 "${pkgdir}/usr/share/${pkgname}"
  bsdtar --extract \
    --file "${srcdir}/${pkgbase}/apps/browser/dist/oss-dist-chrome.zip" \
    --directory "${pkgdir}/usr/share/${pkgname}"
}

package_chrome-extension-bitwarden-git() {
  pkgdesc='Bitwarden browser extension for Google Chrome'
  optdepends=('google-chrome: Web browser to use the extension with')
  provides=('chrome-extension-bitwarden')
  conflicts=('chrome-extension-bitwarden')
  install="${pkgname}.install"

  install --directory --mode=755 "${pkgdir}/usr/share/${pkgname}"
  bsdtar --extract \
    --file "${srcdir}/${pkgbase}/apps/browser/dist/oss-dist-chrome.zip" \
    --directory "${pkgdir}/usr/share/${pkgname}"
}

package_chromium-extension-bitwarden-git() {
  pkgdesc='Bitwarden browser extension for Chromium'
  optdepends=('chromium: Web browser to use the extension with')
  provides=('chromium-extension-bitwarden')
  conflicts=('chromium-extension-bitwarden')
  install="${pkgname}.install"

  install --directory --mode=755 "${pkgdir}/usr/share/${pkgname}"
  bsdtar --extract \
    --file "${srcdir}/${pkgbase}/apps/browser/dist/oss-dist-chrome.zip" \
    --directory "${pkgdir}/usr/share/${pkgname}"
}

package_firefox-developer-edition-extension-bitwarden-git() {
  pkgdesc='Bitwarden browser extension for Firefox Developer Edition'
  optdepends=('firefox-developer-edition: Web browser to use the extension with')
  provides=('firefox-developer-edition-extension-bitwarden')
  conflicts=('firefox-developer-edition-extension-bitwarden')

  install --directory --mode=755 "${pkgdir}/usr/lib/firefox-developer-edition/browser/extensions"
  install --mode=644 "${srcdir}/${pkgbase}/apps/browser/dist/oss-dist-firefox.zip" \
    "${pkgdir}/usr/lib/firefox-developer-edition/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

package_firefox-extension-bitwarden-git() {
  pkgdesc='Bitwarden browser extension for Firefox'
  groups=('firefox-addons')
  optdepends=('firefox: Web browser to use the extension with')
  provides=('firefox-extension-bitwarden')
  conflicts=('firefox-extension-bitwarden')

  install --directory --mode=755 "${pkgdir}/usr/lib/firefox/browser/extensions"
  install --mode=644 "${srcdir}/${pkgbase}/apps/browser/dist/oss-dist-firefox.zip" \
    "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

package_librewolf-extension-bitwarden-git() {
  pkgdesc='Bitwarden browser extension for LibreWolf'
  optdepends=('librewolf: Web browser to use the extension with')
  provides=('librewolf-extension-bitwarden')
  conflicts=('librewolf-extension-bitwarden')

  install --directory --mode=755 "${pkgdir}/usr/lib/librewolf/browser/extensions"
  install --mode=644 "${srcdir}/${pkgbase}/apps/browser/dist/oss-dist-firefox.zip" \
    "${pkgdir}/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

package_opera-extension-bitwarden-git() {
  pkgdesc='Bitwarden browser extension for Opera'
  optdepends=('opera: Web browser to use the extension with')
  provides=('opera-extension-bitwarden')
  conflicts=('opera-extension-bitwarden')
  install="${pkgname}.install"

  install --directory --mode=755 "${pkgdir}/usr/share/${pkgname}"
  bsdtar --extract \
    --file "${srcdir}/${pkgbase}/apps/browser/dist/oss-dist-opera.zip" \
    --directory "${pkgdir}/usr/share/${pkgname}"
}
