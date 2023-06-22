pkgname=firefox-extension-bitwarden-git
pkgver=v2023.5.1.r12857.g19d2b25
pkgrel=1
pkgdesc='Bitwarden addon for Firefox'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/bitwarden-password-manager/'
license=('GPLV3')
makedepends=('nodejs' 'npm')
depends=('firefox')
groups=('firefox-addons')
provides=('firefox-extension-bitwarden')
conflicts=('firefox-extension-bitwarden')
source=('clients::git+https://github.com/bitwarden/clients.git')
sha256sums=('SKIP')

pkgver() {
  cd clients
  printf "%s.%s" "$(git tag | grep '^browser' | tail -n1 | cut -d- -f2)" "$(git describe --long --abbrev=7 | cut -d- -f2- | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
  cd clients
  npm ci
}

build() {
  cd clients/apps/browser
  npm run dist:firefox
}

check() {
  cd clients/apps/browser
  npm run test
}

package() {
  install -Dm644 clients/apps/browser/dist/dist-firefox.zip "${pkgdir}/usr/lib/firefox/browser/extensions/{446900e4-71c2-419f-a6a7-df9c091e268b}.xpi"
}

