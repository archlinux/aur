# Maintainer:  Orhun Parmaksız <orhun@archlinux.org>
# Contributor: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

pkgname=rio
pkgver=0.1.5
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
sha512sums=('69e4439ddf32196a06e7ee86e316a5c2f5cbff0ee7217ced43297327f5f1aa5c50f86f045ac560945bddd1a1c31cf15fa2d394e5248f0a8a7f7d7ff34f1258c5')

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
