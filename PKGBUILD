# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgbase=extension-bitwarden-git
pkgname=('brave-extension-bitwarden-git'
         'chrome-extension-bitwarden-git'
         'chromium-extension-bitwarden-git'
         'firefox-extension-bitwarden-git'
         'librewolf-extension-bitwarden-git'
         'opera-extension-bitwarden-git')
pkgver=2025.8.2.r19193.g678c5cb
pkgrel=1
pkgdesc='Bitwarden browser extensions'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL-3.0-or-later')
makedepends=('git' 'nodejs' 'npm' 'p7zip')
source=('git+https://github.com/bitwarden/clients.git')
sha256sums=('SKIP')

pkgver() {
  cd clients || exit
  _version=$(git tag --sort committerdate --list 'browser-*' | tail -n1 | cut -d- -f2 | cut -dv -f2)
  printf "%s.r%s.g%s" "${_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd clients || exit
  npm ci
}

build() {
  cd clients/apps/browser || exit
  rm --force --recursive dist
  mkdir --parents dist

  npm run build:prod:chrome
  mv build dist/chrome
  npm run build:prod:firefox
  mv build dist/firefox
  7z a -tzip dist/dist-firefox.zip "${PWD}"/dist/firefox/*
  npm run build:prod:opera
  mv build dist/opera
}

check() {
  cd clients/apps/browser || exit
  npm run test
}

package_brave-extension-bitwarden-git() {
  conflicts=('brave-extension-bitwarden')
  optdepends=('brave')
  install="${pkgname}.install"
  pkgdesc='Bitwarden browser extension for Brave'
  provides=('brave-extension-bitwarden')

  install -dm755 "${pkgdir}/usr/share"
  cp -av clients/apps/browser/dist/chrome "${pkgdir}/usr/share/${pkgname}"
}

package_chrome-extension-bitwarden-git() {
  conflicts=('chrome-extension-bitwarden')
  optdepends=('google-chrome')
  install="${pkgname}.install"
  pkgdesc='Bitwarden browser extension for Chrome'
  provides=('chrome-extension-bitwarden')

  install -dm755 "${pkgdir}/usr/share"
  cp -av clients/apps/browser/dist/chrome "${pkgdir}/usr/share/${pkgname}"
}

package_chromium-extension-bitwarden-git() {
  conflicts=('chromium-extension-bitwarden')
  optdepends=('chromium')
  install="${pkgname}.install"
  pkgdesc='Bitwarden browser extension for Chromium'
  provides=('chromium-extension-bitwarden')

  install -dm755 "${pkgdir}/usr/share"
  cp -av clients/apps/browser/dist/chrome "${pkgdir}/usr/share/${pkgname}"
}

package_firefox-extension-bitwarden-git() {
  conflicts=('firefox-extension-bitwarden')
  optdepends=('firefox')
  groups=('firefox-addons')
  pkgdesc='Bitwarden browser extension for Firefox'
  provides=('firefox-extension-bitwarden')

  install -Dm644 clients/apps/browser/dist/dist-firefox.zip "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

package_librewolf-extension-bitwarden-git() {
  conflicts=('librewolf-extension-bitwarden')
  optdepends=('librewolf')
  pkgdesc='Bitwarden browser extension for LibreWolf'
  provides=('librewolf-extension-bitwarden')

  install -Dm644 clients/apps/browser/dist/dist-firefox.zip "${pkgdir}/usr/lib/librewolf/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

package_opera-extension-bitwarden-git() {
  conflicts=('opera-extension-bitwarden')
  optdepends=('opera')
  install="${pkgname}.install"
  pkgdesc='Bitwarden browser extension for Opera'
  provides=('opera-extension-bitwarden')

  install -dm755 "${pkgdir}/usr/share"
  cp -av clients/apps/browser/dist/opera "${pkgdir}/usr/share/${pkgname}"
}
