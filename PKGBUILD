# Maintainer: David Hummel <david dot hummel at gmail point com>

pkgbase=extension-bitwarden-git
pkgname=('brave-extension-bitwarden-git'
         'chrome-extension-bitwarden-git'
         'chromium-extension-bitwarden-git'
         'firefox-extension-bitwarden-git'
         'librewolf-extension-bitwarden-git'
         'opera-extension-bitwarden-git')
pkgver=2023.9.1.r13184.gc7afbab
pkgrel=1
pkgdesc='Bitwarden browser extensions'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL3')
makedepends=('git' 'nodejs' 'npm' 'unzip')
source=('git+https://github.com/bitwarden/clients.git')
sha256sums=('SKIP')

pkgver() {
  cd clients || exit
  printf "%s.%s" "$(git tag | grep '^browser' | tail -n1 | cut -d- -f2 | cut -dv -f2)" "$(git describe --long --abbrev=7 | cut -d- -f2- | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd clients || exit
  npm ci
}

build() {
  cd clients/apps/browser || exit
  npm run dist:chrome dist:firefox dist:opera
}

check() {
  cd clients/apps/browser || exit
  npm run test
}

package_brave-extension-bitwarden-git() {
  conflicts=('brave-extension-bitwarden')
  depends=('brave')
  install="${pkgname}.install"
  pkgdesc='Bitwarden browser extension for Brave'
  provides=('brave-extension-bitwarden')

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  unzip -qq clients/apps/browser/dist/dist-chrome.zip -d "${pkgdir}/usr/share/${pkgname}"
}

package_chrome-extension-bitwarden-git() {
  conflicts=('chrome-extension-bitwarden')
  depends=('google-chrome')
  install="${pkgname}.install"
  pkgdesc='Bitwarden browser extension for Chrome'
  provides=('chrome-extension-bitwarden')

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  unzip -qq clients/apps/browser/dist/dist-chrome.zip -d "${pkgdir}/usr/share/${pkgname}"
}

package_chromium-extension-bitwarden-git() {
  conflicts=('chromium-extension-bitwarden')
  depends=('chromium')
  install="${pkgname}.install"
  pkgdesc='Bitwarden browser extension for Chromium'
  provides=('chromium-extension-bitwarden')

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  unzip -qq clients/apps/browser/dist/dist-chrome.zip -d "${pkgdir}/usr/share/${pkgname}"
}

package_firefox-extension-bitwarden-git() {
  conflicts=('firefox-extension-bitwarden')
  depends=('firefox')
  groups=('firefox-addons')
  pkgdesc='Bitwarden browser extension for Firefox'
  provides=('firefox-extension-bitwarden')
  install -Dm644 clients/apps/browser/dist/dist-firefox.zip "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

package_librewolf-extension-bitwarden-git() {
  conflicts=('librewolf-extension-bitwarden')
  depends=('librewolf')
  pkgdesc='Bitwarden browser extension for LibreWolf'
  provides=('librewolf-extension-bitwarden')
  install -Dm644 clients/apps/browser/dist/dist-firefox.zip "${pkgdir}/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

package_opera-extension-bitwarden-git() {
  conflicts=('opera-extension-bitwarden')
  depends=('opera')
  install="${pkgname}.install"
  pkgdesc='Bitwarden browser extension for Opera'
  provides=('opera-extension-bitwarden')

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  unzip -qq clients/apps/browser/dist/dist-opera.zip -d "${pkgdir}/usr/share/${pkgname}"
}
