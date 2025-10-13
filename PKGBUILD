# Maintainer: xeyossr (axrona)
# Description: 🚀 Terminalde Türkçe altyazılı anime arama ve izleme aracı
pkgname=anitr-cli
pkgver=4.7.0
pkgrel=1
pkgdesc="🚀 Terminalde Türkçe altyazılı anime arama ve izleme aracı"
arch=('x86_64' 'aarch64')
url="https://github.com/axrona/anitr-cli"
license=('GPL3')
depends=('mpv')
makedepends=('go' 'git')

optdepends=(
  'rofi: X11 kullanıcıları için GUI'
  'rofi-wayland: Wayland kullanıcıları için GUI'
  'yt-dlp: Anime indirme özelliği için'
  'youtube-dl: Anime indirme özelliği için'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/axrona/anitr-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-${pkgver//+/-}"
  export GOFLAGS="-mod=mod"
  go mod tidy
  go fmt ./...

  gobuildenv=$(go version)
  go build -o build/anitr-cli -ldflags="-X 'github.com/axrona/anitr-cli/internal/update.version=${pkgver}' -X 'github.com/axrona/anitr-cli/internal/update.buildEnv=${gobuildenv}'"
}

package() {
  cd "$srcdir/$pkgname-${pkgver//+/-}"
  install -Dm755 build/anitr-cli "${pkgdir}/usr/bin/${pkgname}"
}
