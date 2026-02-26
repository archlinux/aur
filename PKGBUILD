# Maintainer: PaperMoon <tangyuan0821@email.cn>

pkgname=windows12-git
pkgver=r0
pkgrel=1
pkgdesc='Windows 12网页版，提供桌面、应用生态与AI Copilot体验  / Windows 12 Online: A full desktop experience with app ecosystem and AI Copilot.'
arch=('x86_64')
url='https://github.com/tjy-gitnub/win12/'
license=('EPL-2.0')
depends=('gtk3' 'webkit2gtk' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('git' 'nodejs' 'npm' 'rust')
provides=('windows12')
conflicts=('windows12')
source=(
  "win12::git+https://github.com/tjy-gitnub/win12.git#branch=main"
  'windows12.desktop'
)
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/win12"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/win12"
  npm run build:frontend
  cargo build --manifest-path src-tauri/Cargo.toml --release
}

package() {
  cd "${srcdir}/win12"

  install -Dm755 src-tauri/target/release/windows12-online "${pkgdir}/usr/bin/windows12"
  install -Dm644 icon/windows12.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/windows12.svg"
  install -Dm644 "${srcdir}/windows12.desktop" "${pkgdir}/usr/share/applications/windows12.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/windows12/LICENSE"
}
