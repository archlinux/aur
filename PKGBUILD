# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=whalebird-desktop
pkgver=3.1.0
pkgrel=1
pkgdesc='Electron-based Mastodon/Pleroma client'
arch=(x86_64)
url=https://whalebird.org
license=(MIT)
depends=(gtk3 libxss nss)
makedepends=(npm git)
source=($pkgname-$pkgver.tar.gz::https://github.com/h3poteto/$pkgname/archive/$pkgver.tar.gz
        whalebird.desktop)
sha512sums=('9544cc65ebba90da2881d05c612c31b5455ade00add36b53b850a20f35f9c9c4980f6f832c832f1f49a4bfdb0fd1812dd61ca56a692cdf7b1fc11b6111a32aee'
            '3e5f29fc6db305957b81abc8e4b4679fbd979bbf41ce0c190b19c31a96a3bfe03b624885961ce6d7410716d286c82548b960ebbc1e547c1cacc0b16175eecee2')

build() {
  cd $pkgname-$pkgver
  npm i
  npm run build
  npx electron-builder --dir
}

package() {
  cd $pkgname-$pkgver/build

  mkdir -p "$pkgdir"/usr/{lib,bin}
  cp -a linux-unpacked "$pkgdir"/usr/lib/$pkgname
  ln -s /usr/lib/$pkgname/whalebird "$pkgdir"/usr/bin/whalebird

  install -Dm 644 ../../whalebird.desktop -t "$pkgdir"/usr/share/applications
  for i in 16 32 128 256 512; do
    install -Dm 644 icons/icon.iconset/icon_${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/whalebird.png
  done

  install -Dm 644 ../LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
