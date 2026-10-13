# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=hyprmoncfg
pkgver=1.23.0
pkgrel=1
pkgdesc="Terminal-first monitor configurator and auto-switching daemon for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/hyprmoncfg"
license=('MIT')
install="${pkgname}.install"
depends=('hyprland' 'xdg-terminal-exec')
makedepends=('go')
optdepends=('systemd: user service for automatic profile switching')
conflicts=('hyprmoncfg-bin' 'hyprmoncfg-git')
options=('!debug')
# The deps archive holds the release's Go module cache, so the build is offline.
source=("hyprmoncfg-1.23.0.tar.gz::https://github.com/crmne/hyprmoncfg/archive/refs/tags/v1.23.0.tar.gz"
        "hyprmoncfg-1.23.0-deps.tar.xz::https://github.com/crmne/hyprmoncfg/releases/download/v1.23.0/hyprmoncfg-1.23.0-deps.tar.xz")
sha256sums=('7fddb75af20d408340ee2e4eb5a8df72151a136e385635ac3391ca8fe128a701'
            'dfb630bd72ed7fcb6b021d6c6624a3c266f478484deb45648fc0047ff774d784')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # r<commit count>.<short commit> of the release tag; keep the commit.
  local commit="r355.cb46c6f"
  commit="${commit##*.}"
  local build_date
  build_date="$(date -u +%FT%TZ)"
  local ldflags=(
    "-s"
    "-w"
    "-X github.com/crmne/hyprmoncfg/internal/buildinfo.Version=${pkgver}"
    "-X github.com/crmne/hyprmoncfg/internal/buildinfo.Commit=${commit}"
    "-X github.com/crmne/hyprmoncfg/internal/buildinfo.Date=${build_date}"
  )

  GOMODCACHE="${srcdir}/go-mod" GOPROXY=off CGO_ENABLED=0 go build -buildvcs=false -trimpath -mod=readonly -ldflags "${ldflags[*]}" -o hyprmoncfg ./cmd/hyprmoncfg
  GOMODCACHE="${srcdir}/go-mod" GOPROXY=off CGO_ENABLED=0 go build -buildvcs=false -trimpath -mod=readonly -ldflags "${ldflags[*]}" -o hyprmoncfgd ./cmd/hyprmoncfgd
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  GOMODCACHE="${srcdir}/go-mod" GOPROXY=off go test -buildvcs=false ./...
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
