# Maintainer: fm39hz <fm39hz@gmail.com>
# AUR package — upstream PKGBUILD in repo root.
# This file is a template: release.yml rewrites both version fields and
# regenerates sha256sums (updpkgsums) before pushing, so the values below are
# never what AUR actually serves.
#
# Two orthogonal axes, deliberately not merged:
#   pkgver = which code   (a v* tag; reset pkgrel to 1 whenever it moves)
#   pkgrel = which recipe (bumped alone when only the packaging layer changes
#            — vercmp reports "0.4.5" == "0.4.5-1", so without it pacman would
#            silently refuse the corrected package)

pkgname=gotomux
pkgver=0.4.5
pkgrel=2
pkgdesc='Fuzzy tmux session picker with presets, zoxide and daemon-assisted cold start'
arch=('x86_64' 'aarch64')
url='https://github.com/fm39hz/gotomux'
license=('MIT')
depends=('tmux')
optdepends=('zoxide: frequent project paths in the picker')
makedepends=('go')
install=gotomux.install
options=('!lto' '!debug')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('9b73dd0cc5e956f46796fc8907b1d3304364f83a2005f7779d076ef7f951f53d')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=0
  go build -ldflags="-s -w -X main.version=${pkgver}" -o "${pkgname}" .
  go build -ldflags="-s -w -X main.version=${pkgver}" -o "${pkgname}d" ./cmd/gotomuxd/
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go test ./internal/... -count=1 -short
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${pkgname}d" "${pkgdir}/usr/bin/${pkgname}d"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 man/gotomux.1 "${pkgdir}/usr/share/man/man1/gotomux.1"
  install -Dm644 dist/gotomuxd.service "${pkgdir}/usr/lib/systemd/user/gotomuxd.service"
}
