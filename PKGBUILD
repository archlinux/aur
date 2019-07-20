# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=whalebird
pkgver=2.8.0
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client'
arch=(i686 x86_64)
url=https://whalebird.org
license=(MIT)
makedepends=(npm)
source=(whalebird-$pkgver.tar.gz::https://github.com/h3poteto/whalebird-desktop/archive/$pkgver.tar.gz
        whalebird.desktop)
sha512sums=('f54f31e087ca076a1b836440aafa97b476c73568c30193b2061839d6dad76bf7043b468823e95a4a4c36305fcfe7daa164b7e6682a84e8fee6d34473a1371003'
            '3e5f29fc6db305957b81abc8e4b4679fbd979bbf41ce0c190b19c31a96a3bfe03b624885961ce6d7410716d286c82548b960ebbc1e547c1cacc0b16175eecee2')

build() {
  cd whalebird-desktop-$pkgver
  npm install
  npm run build
  npx electron-builder --dir
}

package() {
  install -Dm 644 whalebird.desktop -t "$pkgdir"/usr/share/applications

  cd whalebird-desktop-$pkgver/build

  cp -a linux-unpacked "$pkgdir"/usr/share/whalebird

  for i in 16 32 128 256 512; do
    install -Dm 644 icons/icon.iconset/icon_${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/whalebird.png
  done

  mkdir "$pkgdir"/usr/bin
  ln -s /usr/share/whalebird/whalebird "$pkgdir"/usr/bin/whalebird
}
