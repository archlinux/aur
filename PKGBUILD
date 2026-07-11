# Maintainer: ldgnu <ldgnu@users.noreply.github.com>
# minitone — TUI music player (YouTube / Radio / Navidrome / local)

pkgname=minitone
pkgver=0.2.4
pkgrel=1
pkgdesc="TUI music player for YouTube, Radio Browser, Navidrome and local files"
arch=('x86_64' 'aarch64')
url="https://github.com/ldgnu/minitone"
license=('MIT')
depends=('mpv')
optdepends=(
  'yt-dlp: YouTube search and stream resolve'
  'ffmpeg: extra format support for mpv'
)
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-bin")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP') # update with: makepkg -g

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags="-s -w -X github.com/ldgnu/minitone/internal/app.Version=${pkgver}" \
    -o minitone ./cmd/minitone/
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go test -short ./...
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 minitone "${pkgdir}/usr/bin/minitone"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  if [[ -f LICENSE ]]; then
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
