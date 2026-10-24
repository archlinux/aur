# Maintainer: nietonchique <nietonchique@users.noreply.github.com>

pkgname=mc3000-mcp
pkgver=0.2.3
pkgrel=1
pkgdesc='Safe MCP server for SKYRC MC3000-compatible battery chargers over Bluetooth LE'
arch=('x86_64')
url='https://github.com/nietonchique/mc3000-mcp'
license=('Apache-2.0')
depends=('dbus' 'gcc-libs')
makedepends=('cargo')
optdepends=('bluez: Bluetooth adapter support (BlueZ over D-Bus)')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nietonchique/mc3000-mcp/releases/download/v${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
b2sums=('ec64b4a17c75cf83610c33dc5db9fa43647c46acc3eff1de2090231bcd56740b86f2099682330edce06e9163930654e85a5644f0a4760c3d08326bcbce7b0319')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm0644 skill/SKILL.md "${pkgdir}/usr/share/doc/${pkgname}/skill/SKILL.md"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/skill/checklists" skill/checklists/*.md
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/skill/profiles" skill/profiles/*.json
}
