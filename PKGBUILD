pkgname=hyprmoncfg
pkgver=1.18.2
pkgrel=1
pkgdesc="Terminal-first monitor configurator and auto-switching daemon for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/hyprmoncfg"
license=('MIT')
install="${pkgname}.install"
depends=('hyprland' 'xdg-terminal-exec')
optdepends=('systemd: user service for automatic profile switching')
makedepends=('go')
conflicts=('hyprmoncfg-bin' 'hyprmoncfg-git')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crmne/hyprmoncfg/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7b8012ca10c82ee9ba4a985f50354dd9a9201efb7853ef6b2a01a469178547c7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  local commit="release"
  local build_date
  build_date="$(date -u +%FT%TZ)"
  local ldflags=(
    "-s"
    "-w"
    "-X github.com/crmne/hyprmoncfg/internal/buildinfo.Version=${pkgver}"
    "-X github.com/crmne/hyprmoncfg/internal/buildinfo.Commit=${commit}"
    "-X github.com/crmne/hyprmoncfg/internal/buildinfo.Date=${build_date}"
  )

  CGO_ENABLED=0 go build -trimpath -ldflags "${ldflags[*]}" -o hyprmoncfg ./cmd/hyprmoncfg
  CGO_ENABLED=0 go build -trimpath -ldflags "${ldflags[*]}" -o hyprmoncfgd ./cmd/hyprmoncfgd
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "hyprmoncfg" "${pkgdir}/usr/bin/hyprmoncfg"
  install -Dm755 "hyprmoncfgd" "${pkgdir}/usr/bin/hyprmoncfgd"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "packaging/applications/hyprmoncfg.desktop" "${pkgdir}/usr/share/applications/hyprmoncfg.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=xdg-terminal-exec --app-id=TUI.float -e hyprmoncfg|' \
    -e 's/^Terminal=true$/Terminal=false/' \
    -e 's/^StartupNotify=false$/StartupNotify=true/' \
    "${pkgdir}/usr/share/applications/hyprmoncfg.desktop"
  install -Dm644 "packaging/applications/hyprmoncfg-omarchy.desktop" "${pkgdir}/usr/share/applications/hyprmoncfg-omarchy.desktop"
  install -Dm644 "packaging/icons/hyprmoncfg.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hyprmoncfg.svg"
  install -Dm644 "packaging/systemd/hyprmoncfgd.service" "${pkgdir}/usr/lib/systemd/user/hyprmoncfgd.service"
}
