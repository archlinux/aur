# Maintainer Marek Vospěl <marek@vospel.cz>

pkgname='elk-zone-git'
pkgdesc='Native version of Elk, a nimble Mastodon web client.'
url='https://github.com/elk-zone/elk-native'
pkgver=r117.6ca37d2
pkgrel=1
arch=('any')
license=('MIT')

makedepends=('rust' 'cargo' 'cargo-tauri' 'pnpm' 'jq' 'openssl' 'appmenu-gtk-module' 'webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libvips')

source=('git+https://github.com/elk-zone/elk-native.git'
        elk-zone.desktop{,.sig})
sha256sums=('SKIP'
            '0bf937c26ee016cf3592c2e574778bf827f9d6d795e03bf068b56f09a38c58fe'
            'SKIP')
validpgpkeys=('11967103FD525D8611D25DB2654D7FAA1531BC24')

pkgver() {
  cd elk-native
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd elk-native
  git submodule init
  git submodule update

  cd elk
  pnpm i
  cd ..

  # Disable updater and only build the executable
  echo "$(cat src-tauri/tauri.conf.json | jq 'del(.tauri.updater)')" > src-tauri/tauri.conf.json
  echo "$(cat src-tauri/tauri.conf.json | jq '.tauri.bundle.active = false')" > src-tauri/tauri.conf.json
  cargo tauri build
}

package() {
  install -Dm775 elk-native/target/release/elk "$pkgdir"/usr/bin/elk-zone
  install -Dm755 elk-native/logo-dev.png "$pkgdir"/usr/share/icons/elk-zone.png
  install -Dm755 elk-zone.desktop "$pkgdir"/usr/share/applications/elk-zone.desktop
}
