# Maintainer:  Orhun Parmaksız <orhun@archlinux.org>
# Contributor: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

pkgbase=rio
pkgname=('rio' 'rio-terminfo')
pkgver=0.0.26
pkgrel=1
pkgdesc="A hardware-accelerated GPU terminal emulator powered by WebGPU"
arch=('x86_64')
url="https://github.com/raphamorim/${pkgbase}"
license=('MIT')
# https://raphamorim.io/rio/install/#arch-linux
depends=(
  'gcc-libs'
  'fontconfig'
  'freetype2'
  'libxcb'
  'libxkbcommon'
  'python'
)
makedepends=('cargo' 'cmake' 'desktop-file-utils')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3be164e7ba3588346128f4d8969c6f55e0963950bd377d2248558b4f19e259e1249ccc7cf17756fc501f5304c2303d338b066164507ec447c5e30ff05bf25f8d')

prepare() {
  cd "${pkgbase}-${pkgver}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "${pkgbase}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgbase}-${pkgver}"
  cargo test --frozen --workspace
}

package_rio() {
  depends+=('rio-terminfo')

  cd "${pkgbase}-${pkgver}"
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgbase}"
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgbase}/" "README.md"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgbase}/" "LICENSE"
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "misc/${pkgbase}.desktop"
  install -Dm0644 "docs/static/assets/${pkgbase}-logo-512-512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/${pkgbase}.png"
}

package_rio-terminfo() {
  pkgdesc="Terminfo for rio, a hardware-accelerated GPU terminal emulator powered by WebGPU"
  depends=('ncurses')

  cd "${pkgbase}-${pkgver}"
  install -d "${pkgdir}/usr/share/terminfo"
  tic -x -o "${pkgdir}/usr/share/terminfo" "misc/rio.terminfo"
  install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgbase}-terminfo/" "LICENSE"
}

# vim: ts=2 sw=2 et:
