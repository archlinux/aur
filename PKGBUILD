# Maintainer Marek Vospěl <marek@vospel.cz>

pkgname='elk-zone-git'
pkgdesc='Native version of Elk, a nimble Mastodon web client.'
url='https://github.com/elk-zone/elk-native'
pkgver=r191.73fd12c
pkgrel=1
arch=('any')
license=('MIT')

makedepends=('rust' 'cargo' 'cargo-tauri' 'pnpm' 'jq' 'openssl' 'appmenu-gtk-module' 'webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips' 'git' 'npm' 'binutils')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')

source=("$pkgname::git+https://github.com/elk-zone/elk-native.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  git submodule init
  git submodule update

  cd elk
  pnpm i
  cd ..

  # Disable updater and only build the executable
  echo "$(cat src-tauri/tauri.conf.json | jq 'del(.tauri.updater)')" > src-tauri/tauri.conf.json
  echo "$(cat src-tauri/tauri.conf.json | jq '.tauri.bundle.targets = "deb"')" > src-tauri/tauri.conf.json
  cargo tauri build
}

package() {
  ar x elk-zone-git/target/release/bundle/deb/elk_*.deb

  tar -zxvf ./data.tar.gz -C "$pkgdir"
}
