# Maintainer:  Orhun Parmaksız <orhun@archlinux.org>
# Contributor: bbx0 <39773919+bbx0@users.noreply.github.com>
# Contributor: Raphael Amorim <rapha850@gmail.com>

pkgbase=rio
pkgname=('rio' 'rio-terminfo')
pkgver=0.0.34
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
sha512sums=('9a0a01e02a432e030b9dc01fcf62606016f57724b8bdf11b4f347a077ff373bc7e03843294e883ff4add24a6d69e9baf628ea0b05252a7028dc18e315f44a4de')

prepare() {
  cd "${pkgbase}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  install -Dm0644 "docs/static/assets/${pkgbase}-logo.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgbase}.svg"
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
