# Maintainer Marek Vospěl <marek@vospel.cz>

pkgname='elk-zone-git'
pkgdesc='Native version of Elk, a nimble Mastodon web client.'
url='https://github.com/elk-zone/elk-native'
pkgver=v0.5.0.next.1.0.g0d3908a
pkgrel=1
arch=('any')
license=('MIT')

makedepends=('rust' 'cargo' 'npm')

source=('git+https://github.com/elk-zone/elk-native.git'
        elk-zone.desktop{,.sig})
sha256sums=('SKIP'
            '0bf937c26ee016cf3592c2e574778bf827f9d6d795e03bf068b56f09a38c58fe'
            'SKIP')
validpgpkeys=('11967103FD525D8611D25DB2654D7FAA1531BC24')

pkgver() {
  cd elk-native
  printf "$(git describe --long --tags | sed -E 's/[\s\/\\-]+/./g')"
}

build() {
  cd elk-native
  git submodule init
  git submodule update

  cd elk
  if [ $(which pnpm 2>/dev/null) ]; then
    pnpm i
    pnpm run build
  else
    npm_config_yes=true npx pnpm i < /dev/null
    npm run build
  fi

  cd ..
  cargo build --release
}

package() {
  install -Dm775 elk-native/target/release/app "$pkgdir"/usr/bin/elk-zone
  install -Dm755 elk-native/logo-dev.png "$pkgdir"/usr/share/icons/elk-zone.png
  install -Dm755 elk-zone.desktop "$pkgdir"/usr/share/applications/elk-zone.desktop
}
