# Maintainer: MingxuanGame <MingxuanGame@outlook.com>
# Maintainer: serverbread <serverbread-DEV@qq.com>
pkgname="meowpad-configurator-v2-git"
pkgrel=1
pkgver=1.2.0.r160.b2886a0
pkgdesc="Meowpad v2 配置器"
arch=('x86_64')
license=('MIT')
url="https://desu.life/"
depends=(    
  'webkit2gtk-4.1'
  'gtk3'
  'systemd-libs'
  'openssl'
  'gdk-pixbuf2'
  'gcc-libs'
  'libsoup3'
  'glibc'
  'glib2'
  'hicolor-icon-theme'
)
makedepends=(
  'rust'
  'cargo'
  'cargo-tauri'
  'nodejs'
  'pnpm' 
  'git'
)
provides=("meowpad-configurator-v2")
conflicts=("meowpad-configurator-v2" "meowpad-configurator-v2-bin")
options=('!emptydirs' '!lto')
install='udev.install'
source=(
  "git+https://github.com/desu-life/MeowpadConfigurator.git"
  '52-meowpad.rules'
  'LICENSE::https://raw.githubusercontent.com/desu-life/MeowpadConfigurator/refs/heads/2.0-meowpad/LICENSE'
  'udev.install'
)
sha256sums=(
  'SKIP'
  '5c399802e5cb6e55ab13058e3474ea9c3b67601bdefb5da85061e3628e862428'
  '20572bbf6ce7d98829f48e0281a2109469f6b3068e814d10400066014deee9c5'
  '47cbe69ec65ea12001ed527c429022bda09a02320636f425bfe8faa1ae662fc9'
)

pkgver() {
  cd MeowpadConfigurator/
  printf "%s.r%s.%s" "$(cat $srcdir/MeowpadConfigurator/package.json | sed -n 's/.*"version": "\([^"]*\)".*/\1/p')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd MeowpadConfigurator/
  pnpm install --no-frozen-lockfile
  cargo tauri build --bundles deb
}

package() {
  cp -r "$srcdir/MeowpadConfigurator/src-tauri/target/release/bundle/deb/MeowpadConfiguratorForV2_$(cat "$srcdir/MeowpadConfigurator/package.json" | sed -n 's/.*"version": "\([^"]*\)".*/\1/p')_amd64/data/usr" "$pkgdir"
  ln -s "MeowpadConfiguratorForV2" "$pkgdir/usr/bin/meowpad-configurator-for-v2"
  install -Dm 644 "$srcdir/52-meowpad.rules" "$pkgdir"/usr/lib/udev/rules.d/52-meowpad.rules
  install -Dm 644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -rf "$pkgdir/usr/src"
}
