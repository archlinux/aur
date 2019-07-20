# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=whalebird-git
pkgver=2.8.0+r41+g76790c7
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client (git)'
arch=(i686 x86_64)
url=https://whalebird.org
license=(MIT)
provides=(whalebird)
conflicts=(whalebird whalebird-bin)
makedepends=(git npm)
source=(git+https://github.com/h3poteto/whalebird-desktop
        whalebird.desktop)
sha512sums=('SKIP'
            '3e5f29fc6db305957b81abc8e4b4679fbd979bbf41ce0c190b19c31a96a3bfe03b624885961ce6d7410716d286c82548b960ebbc1e547c1cacc0b16175eecee2')

pkgver() {
  cd whalebird-desktop
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd whalebird-desktop
  npm install
  npm run build
  npx electron-builder --dir
}

package() {
  install -Dm 644 whalebird.desktop -t "$pkgdir"/usr/share/applications

  cd whalebird-desktop/build

  cp -a linux-unpacked "$pkgdir"/usr/share/whalebird

  for i in 16 32 128 256 512; do
    install -Dm 644 icons/icon.iconset/icon_${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/whalebird.png
  done

  mkdir "$pkgdir"/usr/bin
  ln -s /usr/share/whalebird/whalebird "$pkgdir"/usr/bin/whalebird
}
