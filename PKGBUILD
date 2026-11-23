# Maintainer: samtoxie <sam@toxopeus.it>

pkgname=sonar
pkgver=0.1.0
pkgrel=1
pkgdesc='A file manager inspired by KDE Dolphin'
arch=('x86_64' 'aarch64')
url='https://github.com/samtoxie/sonar'
license=('EUPL-1.2')
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'shared-mime-info' 'xdg-utils' 'libarchive')
makedepends=('cargo')
optdepends=('udisks2: mount and eject removable drives from the sidebar'
            'breeze-icons: file and folder icons (or another icon theme)')
conflicts=('sonar-bin' 'sonar-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ed93a22083e1dd42f216ced2e4e8f9bea642453a74296efe745728e1f155db67')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # tauri/custom-protocol: serve the bundled UI (what `tauri build` enables).
  cargo build --frozen --release -p sonar --features tauri/custom-protocol
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/sonar "$pkgdir/usr/bin/sonar"
  sed -e 's/{{name}}/Sonar/' -e 's/{{exec}}/sonar/g' -e 's/{{icon}}/sonar/' src-tauri/linux/sonar.desktop |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/sonar.desktop"
  install -Dm644 src-tauri/icons/32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/sonar.png"
  install -Dm644 src-tauri/icons/128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/sonar.png"
  install -Dm644 src-tauri/icons/128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/sonar.png"
  install -Dm644 src-tauri/icons/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/sonar.png"
  install -Dm644 src-tauri/icons/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sonar.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
