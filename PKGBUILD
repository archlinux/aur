# Maintainer: 9M2PJU <https://hamradio.my>
pkgname=localfly-linux-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Your localhost, on the internet - bore tunnels with an Adwaita window + tray"
arch=('x86_64' 'aarch64')
url="https://github.com/9M2PJU/localfly-linux"
license=('MIT')
depends=('python-gobject' 'gtk4' 'libadwaita' 'curl' 'hicolor-icon-theme')
optdepends=('qrencode: QR codes for phone testing' 'libsecret: GNOME Keyring secret storage')
makedepends=('git' 'rust')
provides=('localfly-linux')
conflicts=('localfly-linux' 'localfly-linux-bin')
source=('git+https://github.com/9M2PJU/localfly-linux.git')
sha256sums=('SKIP')

pkgver() {
  cd localfly-linux
  git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
  cd localfly-linux
  cargo build --locked --release
  cargo run --quiet --locked --release --example gen_assets
}

package() {
  cd localfly-linux
  install -Dm755 target/release/localfly "$pkgdir/usr/bin/localfly"
  install -Dm755 target/release/localflyd "$pkgdir/usr/bin/localflyd"
  install -Dm755 gui/localfly-gui "$pkgdir/usr/bin/localfly-gui"
  install -Dm644 gui/localfly_backend.py "$pkgdir/usr/share/localfly/gui/localfly_backend.py"
  install -Dm644 gui/localfly_gui.py "$pkgdir/usr/share/localfly/gui/localfly_gui.py"
  install -Dm644 gui/sni.py "$pkgdir/usr/share/localfly/gui/sni.py"
  install -Dm644 com.localfly.Localfly.desktop "$pkgdir/usr/share/applications/com.localfly.Localfly.desktop"
  install -Dm644 packaging/com.localfly.Localfly.metainfo.xml "$pkgdir/usr/share/metainfo/com.localfly.Localfly.metainfo.xml"
  install -Dm644 packaging/icons/localfly.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/localfly.png"
  install -Dm644 packaging/icons/localfly-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/localfly.png"
  install -Dm644 packaging/icons/localfly-live.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/localfly-live.png"
  install -Dm644 packaging/icons/localfly-live-48.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/localfly-live.png"
  install -Dm644 packaging/generated/completions/localfly.bash "$pkgdir/usr/share/bash-completion/completions/localfly"
  install -Dm644 packaging/generated/completions/localflyd.bash "$pkgdir/usr/share/bash-completion/completions/localflyd"
  install -Dm644 packaging/generated/completions/_localfly "$pkgdir/usr/share/zsh/site-functions/_localfly"
  install -Dm644 packaging/generated/completions/_localflyd "$pkgdir/usr/share/zsh/site-functions/_localflyd"
  install -Dm644 packaging/generated/completions/localfly.fish "$pkgdir/usr/share/fish/vendor_completions.d/localfly.fish"
  install -Dm644 packaging/generated/completions/localflyd.fish "$pkgdir/usr/share/fish/vendor_completions.d/localflyd.fish"
  install -Dm644 packaging/generated/man/localfly.1 "$pkgdir/usr/share/man/man1/localfly.1"
  install -Dm644 packaging/generated/man/localflyd.1 "$pkgdir/usr/share/man/man1/localflyd.1"
  install -Dm644 packaging/localfly.service "$pkgdir/usr/lib/systemd/user/localfly.service"
}
