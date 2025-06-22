# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Matt Harrison <matt@harrison.us.com>
# Contributor: David Hummel <hummeltech@sherpaguru.com>

pkgname=firefox-esr-extension-bitwarden
pkgver=2025.5.0
pkgrel=1
pkgdesc='Bitwarden browser extension for Firefox ESR'
arch=('any')
url='https://github.com/bitwarden/clients/tree/main/apps/browser'
license=('GPL-3.0-or-later')
optdepends=('firefox-esr')
groups=('firefox-esr-addons')
makedepends=('nodejs' 'npm' 'unzip' 'zip' 'jq')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/clients/archive/refs/tags/browser-v${pkgver}.tar.gz")
b2sums=('0de37c8474cf94b647e9534560ee96adf7e6678bc867c3594b550d30398eea22f07beb1a22b8044f4b79ca0184b32738e5e9317b6d80874cfadda63f34a79906')

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
