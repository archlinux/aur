# Maintainer: James Osborne <incentive@circlewithadot.net>
pkgname=relibre
pkgver=0.2.0
pkgrel=1
pkgdesc="Native webview app to generate single-file landing pages for music releases"
arch=('x86_64')
url="https://git.circlewithadot.net/incentive/relibre"
license=('AGPL3')
depends=('gtk3' 'webkit2gtk' 'libsoup3' 'hicolor-icon-theme')
makedepends=('go' 'git')
provides=('relibre')
conflicts=('relibre-bin')

source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  go mod download
}

build() {
  cd "${srcdir}/${pkgname}"
  export CGO_ENABLED=1
  go build -trimpath -ldflags "-s -w" -o relibre
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 relibre "${pkgdir}/usr/bin/relibre"

  if [[ -f dist/com.circlewithadot.Relibre.desktop.arch ]]; then
    install -Dm644 dist/com.circlewithadot.Relibre.desktop.arch \
      "${pkgdir}/usr/share/applications/com.circlewithadot.Relibre.desktop"
  elif [[ -f dist/com.circlewithadot.Relibre.desktop ]]; then
    install -Dm644 dist/com.circlewithadot.Relibre.desktop \
      "${pkgdir}/usr/share/applications/com.circlewithadot.Relibre.desktop"
  fi

  # Icon: reuse the Flatpak icon (must be a square 512×512 PNG)
  if [[ -f dist/com.circlewithadot.Relibre.png ]]; then
    install -Dm644 dist/com.circlewithadot.Relibre.png \
      "${pkgdir}/usr/share/icons/hicolor/512x512/apps/com.circlewithadot.Relibre.png"
  fi
}
