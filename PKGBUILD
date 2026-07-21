# Maintainer: Fgaoxing <fgaoxing0206@outlook.com>
pkgname=axolotl-launcher
pkgver=1.3.4
pkgrel=1
pkgdesc="A free, cross-platform Minecraft launcher built on the Modrinth ecosystem"
arch=('x86_64' 'aarch64')
url="https://github.com/Mystic-Stars/Axolotl"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libnotify')
makedepends=('rust' 'cargo' 'nodejs>=24' 'pnpm' 'base-devel')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('10dc6c8713259ccec951db7f9ec0808d515efbcd3bfd62b1f682120c25fc5cc7')

prepare() {
  cd "${srcdir}/Axolotl-${pkgver}"
  pnpm install --frozen-lockfile
}

build() {
  cd "${srcdir}/Axolotl-${pkgver}"
  export CARGO_BUILD_JOBS="$(nproc)"
  pnpm turbo run build --filter=@modrinth/app-frontend
  cargo build --release --manifest-path apps/app/Cargo.toml
}

package() {
  cd "${srcdir}/Axolotl-${pkgver}"

  install -Dm755 target/release/theseus_gui "${pkgdir}/usr/bin/Axolotl Launcher"

  install -Dm644 scripts/axolotl/flatpak/red.ghs.axolotl.desktop "${pkgdir}/usr/share/applications/axolotl-launcher.desktop"
  sed -i 's/^Exec=.*/Exec=WEBKIT_DISABLE_DMABUF_RENDERER=1 Axolotl Launcher/' "${pkgdir}/usr/share/applications/axolotl-launcher.desktop"

  install -Dm644 apps/app/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/red.ghs.axolotl.png"
  install -Dm644 apps/app/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/red.ghs.axolotl.png"

  install -Dm644 scripts/axolotl/flatpak/red.ghs.axolotl.metainfo.xml "${pkgdir}/usr/share/metainfo/red.ghs.axolotl.metainfo.xml"
}
