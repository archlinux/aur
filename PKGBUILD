# Maintainer: Pysio <qq593277393@outlook.com>
pkgname=loliashizuku-git
pkgver=0.0.2
pkgrel=1
pkgdesc="Wails-powered third-party desktop client for Lolia FRP"
arch=('x86_64' 'aarch64')
url="https://github.com/Mxmilu666/LoliaShizuku"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk'
  'ca-certificates'
  'tzdata'
)
makedepends=(
  'git'
  'go>=1.24'
  'bun'
  'patchelf'
)
provides=('loliashizuku')
conflicts=('loliashizuku')
source=("${pkgname}::git+https://github.com/Mxmilu666/LoliaShizuku.git#tag=v${pkgver}")
sha256sums=('8987335b447b7c08560a09201212fe904afe8a9fcbcdc9029dd4936e8c5bc171')

prepare() {
  cd "$pkgname"
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  go mod download
}

build() {
  cd "$pkgname"
  export GOPATH="${srcdir}/gopath"
  export GOMODCACHE="${GOPATH}/pkg/mod"
  export CGO_ENABLED=1

  # Install wails CLI into build GOPATH
  go install github.com/wailsapp/wails/v2/cmd/wails@v2.11.0
  export PATH="${GOPATH}/bin:${PATH}"

  # Install frontend dependencies
  cd frontend
  bun install
  cd ..

  # Prepare ldflags
  local _commit _buildtime
  _commit="$(git rev-parse --short=12 HEAD)"
  _buildtime="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

  local _ldflags=(
    "-X github.com/Mxmilu666/LoliaShizuku/backend/version.Version=${pkgver}"
    "-X github.com/Mxmilu666/LoliaShizuku/backend/version.GitCommit=${_commit}"
    "-X github.com/Mxmilu666/LoliaShizuku/backend/version.GitBranch=v${pkgver}"
    "-X github.com/Mxmilu666/LoliaShizuku/backend/version.BuildTime=${_buildtime}"
  )

  wails build -clean -ldflags "${_ldflags[*]}"
}

package() {
  cd "$pkgname"

  # Install binary
  install -Dm755 "build/bin/LoliaShizuku" "${pkgdir}/usr/bin/LoliaShizuku"

  # Install desktop file
  install -Dm644 "build/linux/loliashizuku.desktop" "${pkgdir}/usr/share/applications/loliashizuku.desktop"

  # Patch desktop file Exec path to /usr/bin
  sed -i 's|Exec=/usr/local/bin/LoliaShizuku|Exec=/usr/bin/LoliaShizuku|' \
    "${pkgdir}/usr/share/applications/loliashizuku.desktop"

  # Install icon
  install -Dm644 "build/appicon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/loliashizuku.png"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
