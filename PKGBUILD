# Maintainer: xycld
pkgname=waytranslate-git
pkgver=0.2.0.r0.g0000000
pkgrel=1
pkgdesc="Select text anywhere on Wayland, get an inline translation popup (KDE Plasma / wlroots)"
arch=('x86_64' 'aarch64')
license=('MIT')
url="https://github.com/xycld/waytranslate"
depends=('gtk4' 'gtk4-layer-shell' 'wayland')
makedepends=('cargo' 'git' 'gettext' 'cmake')
provides=('waytranslate')
conflicts=('waytranslate')
source=("waytranslate::git+https://github.com/xycld/waytranslate.git")
sha256sums=('SKIP')
# aws-lc-rs (rustls) C objects break under makepkg's default LTO injection
options=('!lto')

pkgver() {
  cd waytranslate
  printf "0.2.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd waytranslate
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd waytranslate
  cargo build --release --frozen
}

package() {
  cd waytranslate
  install -Dm644 assets/waytranslate.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/waytranslate.svg"
  install -Dm644 assets/waytranslate-symbolic.svg "$pkgdir/usr/share/icons/hicolor/symbolic/apps/waytranslate-symbolic.svg"
  for s in 24 48 96; do
    install -Dm644 "assets/waytranslate-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/waytranslate.png"
  done
  install -Dm644 packaging/io.github.xycld.waytranslate.desktop "$pkgdir/usr/share/applications/io.github.xycld.waytranslate.desktop"
  install -Dm755 target/release/waytranslate "$pkgdir/usr/bin/waytranslate"
  install -Dm644 packaging/io.github.xycld.waytranslate-autostart.desktop "$pkgdir/etc/xdg/autostart/io.github.xycld.waytranslate.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  msgfmt po/zh_CN.po -o "$pkgdir/zh_CN.mo"
  install -Dm644 "$pkgdir/zh_CN.mo" "$pkgdir/usr/share/locale/zh_CN/LC_MESSAGES/waytranslate.mo"
}
