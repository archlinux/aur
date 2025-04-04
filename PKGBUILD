# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: David Hummel <hummeltech@sherpaguru.com>

pkgname=firefox-esr-extension-bitwarden
pkgver=2025.3.2
pkgrel=1
pkgdesc='Bitwarden browser extension for Firefox ESR'
arch=('any')
url='https://github.com/bitwarden/clients/tree/main/apps/browser'
license=('GPL-3.0-or-later')
optdepends=('firefox-esr')
groups=('firefox-esr-addons')
makedepends=('nodejs' 'npm' 'unzip' 'zip' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/clients/archive/refs/tags/browser-v${pkgver}.tar.gz")
b2sums=('0b14794ae2c44ead90a0db928a080a134b52e2a49eb01bb4a8203ec6c743faa644ee1a0f6de33879d696603a33a339b38f98981ef3945176db3071a7d6885b4f')

srcpath="clients-browser-v${pkgver}/apps/browser"

prepare() {
  cd "${srcdir}/${srcpath}" || exit
  # Starting in 2024.12.0 it uses powershell to create the zip.
  # Rather than requiring powershell to build this, we just create the zip in the build step.
  sed -i 's| \&\& \.\/scripts\/compress\.ps1 dist-firefox\.zip||' package.json
  cd ../../
  npm ci
}

build() {
  cd "${srcdir}/${srcpath}" || exit
  npm run dist:firefox
  cd build
  zip -r ../dist/dist-firefox.zip .
}

check() {
  cd "${srcdir}/${srcpath}" || exit
  npm run test
}

package() {
  cd "${srcdir}/${srcpath}" || exit
  local id && id=$(jq -j '..|.gecko?.id//empty' src/manifest.json)
  install -Dm644 "dist/dist-firefox.zip" \
    "${pkgdir}/usr/lib/firefox-esr/browser/extensions/${id}.xpi"
}
