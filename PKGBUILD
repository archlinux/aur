# Maintainer: Icaro Motta <icarogomesmotta@proton.me>
pkgname=autoanimedownloader-git
pkgver=1.3.3.r0.g0000000
pkgrel=2
pkgdesc="An app that automatically downloads your anime from Anilist"
arch=('x86_64' 'aarch64')
url="https://github.com/icarosuper/AutoAnimeDownloader"
license=('GPL3')
depends=('qbittorrent')
makedepends=('git' 'go' 'npm' 'pkg-config')
provides=('autoanimedownloader')
conflicts=('autoanimedownloader-bin')
source=("${pkgname}::git+https://github.com/icarosuper/AutoAnimeDownloader.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"

  # Build frontend
  cd src/internal/frontend
  npm install
  npm run build
  cd "${srcdir}/${pkgname}"

  # Build daemon (CGO enabled)
  export CGO_ENABLED=1
  export CGO_CFLAGS="-Wno-deprecated-declarations"
  go build -installsuffix cgo \
    -ldflags="-w -s -X AutoAnimeDownloader/src/internal/tray.currentVersion=${pkgver}" \
    -o autoanimedownloader-daemon \
    ./src/cmd/daemon

  # Build CLI (no CGO)
  CGO_ENABLED=0 go build -installsuffix cgo \
    -ldflags="-w -s" \
    -o autoanimedownloader \
    ./src/cmd/cli
}

package() {
  cd "${pkgname}"

  install -Dm755 autoanimedownloader-daemon "${pkgdir}/usr/bin/autoanimedownloader-daemon"
  install -Dm755 autoanimedownloader "${pkgdir}/usr/bin/autoanimedownloader"

  install -Dm644 infra/linux/autoanimedownloader.service "${pkgdir}/usr/lib/systemd/user/autoanimedownloader.service"

  sed -i 's|%h/.local/bin/autoanimedownloader-daemon|/usr/bin/autoanimedownloader-daemon|g' \
    "${pkgdir}/usr/lib/systemd/user/autoanimedownloader.service"

  install -Dm644 infra/linux/autoanimedownloader.desktop "${pkgdir}/usr/share/applications/autoanimedownloader.desktop"
  install -Dm644 src/internal/tray/icon.png "${pkgdir}/usr/share/pixmaps/autoanimedownloader.png"
}
