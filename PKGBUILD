# Maintainer:  Orhun Parmaksız <orhun@archlinux.org>
# Contributor: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

pkgname=rio
pkgver=0.1.7
pkgrel=1
pkgdesc="A hardware-accelerated GPU terminal emulator powered by WebGPU"
arch=('x86_64')
url="https://github.com/raphamorim/rio"
license=('MIT')
# https://raphamorim.io/rio/install/#arch-linux
depends=(
  'gcc-libs'
  'fontconfig'
  'freetype2'
  'glibc'
  'hicolor-icon-theme'
)
makedepends=(
  'cargo'
  'cmake'
  'desktop-file-utils'
  'libxcb'
  'libxkbcommon'
  'python'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('94c844e0be6a91dc666555060d15a48f0576d7a82fd9c848e1d75fa1ddbb7578c0b29be63a984aa15610e23fc42d44a627d50c80c525d3d5beb4c5f672dd9024')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --workspace
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}/" "README.md"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "LICENSE"
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "misc/${pkgname}.desktop"
  install -Dm0644 "docs/static/assets/${pkgname}-logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}

# vim: ts=2 sw=2 et:
