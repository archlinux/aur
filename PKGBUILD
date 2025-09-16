# Maintainer: robertfoster
pkgname='opencode-git'
pkgver=0.9.3
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

source=("${pkgname%%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%%-git}"
  printf "%s" "$(git describe --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${pkgname%%-git}"
  bun install
  cd packages/tui
  CGO_ENABLED=0 go build -ldflags="-s -w -X main.Version=${pkgver}" -o tui cmd/opencode/main.go
  cd "../${pkgname%%-git}"
  bun build --define OPENCODE_TUI_PATH="'$(realpath ../tui/tui)'" --define OPENCODE_VERSION="'${pkgver}'" --compile --target=bun-linux-x64 --outfile=opencode ./src/index.ts
}

package() {
  cd "${pkgname%%-git}/packages/opencode"
  install -Dm755 ./"${pkgname%%-git}" "${pkgdir}/usr/bin/${pkgname%%-git}"
}
