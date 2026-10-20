# Maintainer: deddroid <deddo9412@gmail.com>
pkgname=ak820-bin
_pkgname=ak820
pkgver=0.1.1
pkgrel=1
pkgdesc="Configurator for the AJAZZ AK820 Pro keyboard: lighting, per-key RGB, key remapping, macros, TFT screen (GUI + CLI, prebuilt)"
arch=('x86_64')
url="https://github.com/deddroid/ak820-rs"
license=('MIT')
depends=('gcc-libs' 'glibc' 'systemd-libs' 'hicolor-icon-theme'
         'libglvnd' 'libxkbcommon' 'wayland' 'libx11' 'libxcursor' 'libxi' 'libxrandr')
optdepends=('xdg-desktop-portal: file picker in the GUI'
            'gnome-shell-extension-appindicator: tray icon on GNOME')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz")
sha256sums=('b576fbf04214a301f153a6f75ccdf175f430d8cb651488613514df15738680c4')

package() {
  cd "$_pkgname-v$pkgver-linux-x86_64"
  install -Dm755 ak820 "$pkgdir/usr/bin/ak820"
  install -Dm755 ak820-gui "$pkgdir/usr/bin/ak820-gui"
  install -Dm644 packaging/linux/ak820.desktop "$pkgdir/usr/share/applications/ak820.desktop"
  for s in 32 48 64 128 256; do
    install -Dm644 "assets/icon-$s.png" "$pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/ak820.png"
  done
  # Lets the logged-in user open the keyboard without root.
  install -Dm644 udev/70-ajazz-ak820.rules "$pkgdir/usr/lib/udev/rules.d/70-ajazz-ak820.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
