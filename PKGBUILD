pkgbase=extension-bitwarden-git
pkgname=('chrome-extension-bitwarden-git' 'librewolf-extension-bitwarden-git')
pkgver=v2023.7.1.r12965.g49549cc
pkgrel=1
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPLV3')
makedepends=('nodejs' 'npm' 'unzip')
source=('git+https://github.com/bitwarden/clients.git')
sha256sums=('SKIP')

pkgver() {
  cd clients || exit
  printf "%s.%s" "$(git tag | grep '^browser' | tail -n1 | cut -d- -f2)" "$(git describe --long --abbrev=7 | cut -d- -f2- | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd clients || exit
  npm ci
}

build() {
  cd clients/apps/browser || exit
  npm run dist:chrome dist:firefox
}

check() {
  cd clients/apps/browser || exit
  npm run test
}

package_chrome-extension-bitwarden-git() {
  conflicts=('bitwarden-chromium' 'brave-extension-bitwarden' 'chrome-extension-bitwarden' 'chromium-extension-bitwarden')
  optdepends=('brave' 'chromium' 'google-chrome')
  install="${pkgname}.install"
  pkgdesc='Bitwarden extension for Brave/Chrome/Chromium'
  provides=('brave-extension-bitwarden' 'chrome-extension-bitwarden' 'chromium-extension-bitwarden')

  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  unzip -d "${pkgdir}/usr/share/${pkgname}" clients/apps/browser/dist/dist-chrome.zip
}

package_firefox-extension-bitwarden-git() {
  conflicts=('firefox-extension-bitwarden')
  depends=('firefox')
  groups=('firefox-addons')
  pkgdesc='Bitwarden extension for Firefox'
  provides=('firefox-extension-bitwarden')
  install -Dm644 clients/apps/browser/dist/dist-firefox.zip "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

package_librewolf-extension-bitwarden-git() {
  conflicts=('librewolf-extension-bitwarden')
  depends=('librewolf')
  pkgdesc='Bitwarden extension for LibreWolf'
  provides=('librewolf-extension-bitwarden')
  install -Dm644 clients/apps/browser/dist/dist-firefox.zip "${pkgdir}/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}
