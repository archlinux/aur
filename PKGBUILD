# Maintainer: btjawa <btjawa@users.noreply.github.com>

pkgname=bilitools
pkgver=1.4.7
pkgrel=1
pkgdesc="A cross-platform bilibili toolbox"
arch=('x86_64' 'aarch64')
url="https://github.com/btjawa/BiliTools"
license=('GPL-3.0-or-later')
depends=('gtk3' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'pnpm')
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ac197d22ea6b609b31c285538c6e4d9356b37e2607bdf6dea458e1a9fefc4a6a')

prepare() {
  cd "BiliTools-${pkgver}"

  cat > aur-build.conf.json <<'EOF'
{
  "bundle": {
    "createUpdaterArtifacts": false
  },
  "plugins": {
    "updater": {
      "active": false
    }
  }
}
EOF

  pnpm install --frozen-lockfile

  cargo fetch \
    --locked \
    --manifest-path src-tauri/Cargo.toml \
    --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "BiliTools-${pkgver}"

  export CARGO_TARGET_DIR="${srcdir}/cargo-target"
  pnpm tauri build --bundles deb --config aur-build.conf.json
}

package() {
  cd "BiliTools-${pkgver}"

  local deb="${srcdir}/cargo-target/release/bundle/deb/${pkgname}_${pkgver}_"
  case "$CARCH" in
    x86_64)
      deb+="amd64.deb"
      ;;
    aarch64)
      deb+="arm64.deb"
      ;;
  esac

  bsdtar -xOf "$deb" data.tar.gz | bsdtar -xzf - -C "$pkgdir"
}
