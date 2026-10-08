# Maintainer: Aneesh Sambu (https://github.com/sambuaneesh)
pkgname=playy
pkgver=0.1.0
pkgrel=1
pkgdesc='Music player for the terminal: your music folder and YouTube Music in one library, offline or online'
arch=('x86_64' 'aarch64')
url='https://github.com/sambuaneesh/playy'
license=('MIT')
depends=('mpv' 'yt-dlp' 'ffmpeg' 'glibc')
makedepends=('go')
optdepends=('kitty: sharp cover art (other terminals show block art)'
            'libnotify: a notification when a song starts'
            'wl-clipboard: copy links and open shared links from the clipboard (Wayland)'
            'xdg-utils: open links in the browser')
provides=('playy')
conflicts=('playy-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e026c93844537661a335f5aada6a42e3d1d36b036502f767b959022b8721a70')

prepare() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go mod download -x >/dev/null 2>&1 || go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -ldflags "-linkmode=external -X main.version=${pkgver}" -o playy .
}

check() {
  cd "${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  go test ./internal/music/... ./internal/lyrics/... ./internal/ytm/... ./internal/spotify/... ./internal/ui/... ./internal/config/...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 playy "${pkgdir}/usr/bin/playy"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 packaging/playy.desktop "${pkgdir}/usr/share/applications/playy.desktop"
  install -Dm644 assets/playy.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/playy.svg"
  install -Dm644 assets/playy-256.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/playy.png"
}
