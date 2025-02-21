# Maintainer: Matt Harrison <matt@harrison.us.com>
# Contributor: David Hummel <hummeltech@sherpaguru.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=firefox-extension-bitwarden
pkgver=2025.2.1
pkgrel=1
pkgdesc='Bitwarden browser extension for Firefox'
arch=('any')
url='https://github.com/bitwarden/clients'
license=('GPL-3.0-or-later')
optdepends=('firefox')
groups=('firefox-addons')
pkgdesc='Bitwarden browser extension for Firefox'
makedepends=('nodejs' 'npm' 'unzip' 'zip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bitwarden/clients/archive/refs/tags/browser-v${pkgver}.tar.gz")
b2sums=('15d1205205efef57b2a38c959bf41e276defa6c4b9b80be7cfe97687aaffaf6298cd35093e063c531ab3f08b2ecc43b881050d4c37d53893ebd4aba19c3380be')

prepare() {
  cd "${srcdir}/clients-browser-v${pkgver}" || exit
  # Starting in 2024.12.0 it uses powershell to create the zip. Rather than requiring powershell to build this, we just create the zip in the build step.
  sed -i 's| \&\& \.\/scripts\/compress\.ps1 dist-firefox\.zip||' apps/browser/package.json
  npm ci
}

build() {
  cd "${srcdir}/clients-browser-v${pkgver}/apps/browser" || exit
  npm run dist:firefox
  cd build
  zip -r ../dist/dist-firefox.zip .
}

check() {
  cd "${srcdir}/clients-browser-v${pkgver}/apps/browser" || exit
  npm run test
}

package() {
  install -Dm644 "${srcdir}/clients-browser-v${pkgver}/apps/browser/dist/dist-firefox.zip" "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}
