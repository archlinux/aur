# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=1.0.10
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode-bin')
depends=('fzf' 'ripgrep')
makedepends=('git' 'bun-bin' 'go')

source=("opencode-${pkgver}.tar.gz::https://github.com/sst/opencode/archive/v${pkgver}${_subver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "opencode-${pkgver}"
  bun install
  cd packages/tui
  CGO_ENABLED=0 go build -ldflags="-s -w -X main.Version=${pkgver}" -o tui cmd/opencode/main.go
  cd ../opencode
  bun build --define OPENCODE_TUI_PATH="'$(realpath ../tui/tui)'" --define OPENCODE_VERSION="'${pkgver}'" --compile --target=bun-linux-x64 --outfile=opencode ./src/index.ts
}

package() {
  cd "opencode-${pkgver}/packages/opencode"
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
