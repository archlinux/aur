# Maintainer: Mikele <mikele@gmail.com>
pkgname=appmeup-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Create and edit Chromium web apps from .desktop files (Go/Qt 6)"
arch=('x86_64')
url="https://github.com/mikelexp/appmeup-go"
license=('GPL3')
provides=('appmeup')
conflicts=('appmeup')
replaces=('appmeup')
depends=('gcc-libs' 'glibc' 'qt6-base')
makedepends=('go' 'pkgconf')
optdepends=(
  'google-chrome: Google Chrome browser'
  'chromium: Chromium browser'
  'brave-bin: Brave browser'
  'vivaldi: Vivaldi browser'
)
source=("appmeup-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4dfaa4449d738a2842dae26ea69e88d8ff94d92f1e970becae0c33fa8fa61751')

_go_source() {
  if [[ -d "${srcdir}/appmeup-${pkgver}/AppMeUpGo" ]]; then
    printf '%s\n' "${srcdir}/appmeup-${pkgver}/AppMeUpGo"
  elif [[ -d "${srcdir}/appmeup-go-${pkgver}" ]]; then
    printf '%s\n' "${srcdir}/appmeup-go-${pkgver}"
  else
    printf '%s\n' "${srcdir}/appmeup-${pkgver}"
  fi
}

prepare() {
  cd "$(_go_source)"
  go mod download
}

build() {
  cd "$(_go_source)"
  go build -mod=readonly -trimpath -ldflags='-s -w' -o appmeup .
}

package() {
  cd "$(_go_source)"
  install -Dm755 appmeup "${pkgdir}/usr/bin/appmeup"
  install -Dm644 icon.png "${pkgdir}/usr/share/appmeup/icon.png"
  install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/mikelexp.appmeup.png"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 appmeup.desktop "${pkgdir}/usr/share/applications/mikelexp.appmeup.desktop"
}
